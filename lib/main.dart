import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool flag = true;
  int x = 0;
  int lotnumber = 0;
  final myController = TextEditingController();
  String lot = 'Try to guess the Lottery number :))';
  String trying = 'Let\'s try our luck';

  @override
  Widget build(BuildContext context) {
    String text = myController.text;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lottery App'),
        ),
        body: Column(children: [
          Center(
            child: Text(
              '$lot',
              style: const TextStyle(fontSize: 25),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              controller: myController,
              enabled: flag,
              decoration: const InputDecoration(
                icon: Icon(Icons.money),
                labelText: 'Lottery Number',
                hintText: 'Enter Your Lottery Number ',
                fillColor: Colors.blue,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
              ),
              child: Visibility(
                visible: text == '25011950',
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Hurray \nYOU WON the lottery'),
                    Image.network(
                      'https://justmaths.co.uk/wp-content/uploads/2016/10/celebration-gif.gif',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                replacement: Text(trying),
              ))
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (x == 1) {
              trying =
                  'Aww you missed it \n so let me give you an hint \n it\'s an important date in January';
            }
            if (x == 2) {
              trying =
                  'OOps!! you missed it again \n so let me give you another hint \n it\'s the day when our constitution came into effect';
            }
            if (x == 3) {
              trying =
                  'Aww you tried very hard \n so let me give you another hint \n 3 years after the independence';
            } else {
              trying = 'Try and try but don\'t cry ';
            }
            x++;
            setState(() {});
          },
          child: const Icon(Icons.check),
        ),
      ),
    );
  }
}
