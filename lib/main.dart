import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Vibration Button App'),
        ),
        body: Center(
          child: VibrationButton(),
        ),
      ),
    );
  }
}

class VibrationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        // await Vibration.hasVibrator() returns a boolean

        if ((await Vibration.hasVibrator())!) {
          Vibration.vibrate();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('No vibration hardware detected.')),
          );
        }
      },
      child: Text('Vibrate'),
    );
  }
}
