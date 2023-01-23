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
      if (_minutes > 0) {
        setState(() {
          _minutes--;
        });
      }
    });
  }

  

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Color(0xff09C6F9), Color(0xff045DE9
)])),
        
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 120),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('$_minutes',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 45),
                        textAlign: TextAlign.center),
                  ],
                ),
              ),

              SizedBox(
                height: 200,
                child: Container(
                ),
              ), // sizedbox do meio

              Expanded(
                child: 
                  Container(
                    decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),

                    color: Color.fromARGB(255, 240, 243, 250))
                  ),
                )
              
            ],
          ),
        ));
  }
}
