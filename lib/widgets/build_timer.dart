import 'package:flutter/material.dart';
import 'package:pomodoro_app/pages/home_page.dart';



Widget buildTimer() {
  return SizedBox(
      height: 200,
      width: 200,

      child: Center(
          child: Stack(
            fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: (minutes * 60) + seconds.toDouble() / 60,
          ),
          
          Center(
            child: Text(
            '$minutes : $seconds',
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 27,
            ),
          ),
          )
          
        ],
      )));
}
