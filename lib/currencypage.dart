import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getyocurrency/currencyData.dart';
import 'dart:math';

class CurrencyPage extends StatefulWidget {
  const CurrencyPage({Key? key}) : super(key: key);

  @override
  _CurrencyPageState createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  final myController = TextEditingController();
  String outputcurrency = '';

  ConvertBrain convertBrain = ConvertBrain();

  Future<double> sendData() async {
    String inputString = myController.text;
    int intputint = int.parse(inputString);
    double inrAnswer = await convertBrain.getAnswer(intputint);
    return inrAnswer;
  }

  Future<String> equalise() async {
    double outputcurrencyindouble = await sendData();
    outputcurrency = outputcurrencyindouble.toStringAsFixed(0);
    return outputcurrency;
  }

  bool visible() {
    if (myController.text.isNotEmpty == true) {
      return true;
    } else {
      return false;
    }
  }

  int randomnumber = 1;
  void randomizer() {
    setState(() {
      randomnumber = Random().nextInt(23) + 1;
      print(randomnumber);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    myController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.blue,
                alignment: Alignment.topRight,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          controller: myController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            filled: true,
                            contentPadding: EdgeInsets.all(20),
                            fillColor: Colors.white,
                            hintText: 'Enter Currency',
                            border: OutlineInputBorder(),
                          ),
                          onTap: () {
                            setState(() {
                              myController.clear();
                              print(outputcurrency);
                            });
                          },
                          onSubmitted: (value) {
                            setState(() {
                              value = myController.text;
                            });
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 30, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            myController.text,
                            style: TextStyle(
                              fontSize: 70,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'CAD',
                            style: TextStyle(
                              color: Colors.white30,
                              fontSize: 35,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Visibility(
                        visible: visible(),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                          ),
                          onPressed: () {
                            setState(() {
                              equalise();
                            });
                          },
                          child: Text('convert'),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 2.5,
                      height: 20,
                      color: Colors.white30,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 25, 0, 0),
                      child: Container(
                        color: Colors.blue,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              outputcurrency,
                              style: TextStyle(
                                fontSize: 70,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'INR',
                              style: TextStyle(
                                color: Colors.white30,
                                fontSize: 35,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue[300],
                ),
                onPressed: () {
                  setState(() {
                    randomizer();
                  });
                },
                child: Image(
                  image: AssetImage('images/kev$randomnumber.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
