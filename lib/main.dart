import 'package:flutter/material.dart';

import 'intro.dart';

void main() {
  runApp(GetchoCurrency());
}

class GetchoCurrency extends StatelessWidget {
  const GetchoCurrency({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IntroPage(),
    );
  }
}
