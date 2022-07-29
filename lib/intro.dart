import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'currencypage.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('images/rut.jpg'),
                radius: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Yo Issa me yo boi Rutwik Mekala, if you wanna , yo know, convert canadian dollas to Indian rupee, then hit the button below. And also click on the pictures for more pictures. Ok cool bye',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pacifico',
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CurrencyPage();
                  }));
                },
                child: Text(
                  'click',
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
