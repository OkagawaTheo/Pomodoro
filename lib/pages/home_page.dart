import 'package:flutter/material.dart';
import 'dart:async';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _minutes = 10;

  void start() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if(_minutes > 0){
        setState(() {
        _minutes--;
      });}
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Color(0xff1542bf), Color(0xff51a8ff)])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Text(
                    '$_minutes',
                    style: const TextStyle(fontSize: 50, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                // sizedbox do meio
                height: 400,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    //start button
                    style: ButtonStyle(minimumSize:
                        MaterialStateProperty.resolveWith<Size?>((states) {
                      return const Size(150, 50);
                    }), backgroundColor:
                        MaterialStateProperty.resolveWith<Color?>((states) {
                      if (states.contains(MaterialState.hovered)) {
                        return const Color(0xffD0C3FF);
                      }
                      return Colors.blue;
                    })),
                    child: const Text('Start studying'),
                    onPressed: () {
                      if (_minutes > 0) {
                        start();
                      }
                    },
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.resolveWith<Size?>((states) {
                        return const Size(150, 50);
                      }),
                      backgroundColor:
                          MaterialStateProperty.resolveWith<Color?>((states) {
                        if (states.contains(MaterialState.hovered)) {
                          return const Color(0xffD0C3FF);
                        }
                        return Colors.blue; // normal color
                      }),
                    ),
                    child: const Text('Stop'),
                    onPressed: () => {},
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
