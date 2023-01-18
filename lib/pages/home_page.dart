import 'package:flutter/material.dart';
import 'package:pomodoro_app/functions/start_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[700],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                '25:00',
                style: TextStyle(fontSize: 45, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 68),
          const SizedBox(
            height: 270,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              StartButton
              ],
          
          )
        ],
      ),
    );
  }
}
