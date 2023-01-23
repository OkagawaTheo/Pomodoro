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
                colors: [Color(0xff09C6F9), Color(0xff045DE9)])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 120),
                child: Text('$_minutes',
                    style: const TextStyle(color: Colors.white, fontSize: 45),
                    textAlign: TextAlign.center),
              ),
              const SizedBox(
                height: 200,
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                        child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.blueGrey,
                              spreadRadius: 4,
                              blurRadius: 30,
                              offset: Offset(-7, 0),
                              blurStyle: BlurStyle.normal)
                        ],
                        color: Color.fromARGB(255, 240, 243, 250),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 50, left: 20, right: 20, bottom: 80),
                        child: Column(children: [
                          Expanded(
                              child: Row(
                            children: [
                              Expanded(
                                  child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text('Study Time', style: TextStyle(fontSize: 15, color: Colors.grey[400])),
                                      Text('Break', style: TextStyle(fontSize: 15, color: Colors.grey[400])),
                                    ],
                                  ),
                                  Expanded(
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                        ElevatedButton(
                                          //start button
                                          style: ButtonStyle(minimumSize:
                                              MaterialStateProperty.resolveWith<
                                                  Size?>((states) {
                                            return const Size(150, 50);
                                          }), backgroundColor:
                                              MaterialStateProperty.resolveWith<
                                                  Color?>((states) {
                                            if (states.contains(
                                                MaterialState.hovered)) {
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
                                        )
                                      ]))
                                ],
                              ))
                            ],
                          ))
                        ]),
                      ),
                    )),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
