import 'package:flutter/material.dart';
import 'dart:async';

import 'package:pomodoro_app/widgets/sets_icons.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _minutes = 25;
  int _seconds = 0;
  Timer? timer;
  bool _buttonEnable = true;

  void start() {
    if (_minutes > 0) {
      _seconds = _minutes * 60;
    }
    if (_seconds > 60) {
      _minutes = (_seconds / 60).floor();
      _seconds -= (_minutes * 60);
      const oneSec = Duration(seconds: 1);
      timer = Timer.periodic(
          oneSec,
          (timer) => {
                setState(() {
                  if (_seconds > 0) {
                    _seconds--;
                  } else {
                    if (_minutes > 0) {
                      _seconds = 59;
                      _minutes--;
                    } else {
                      setState(() {
                        timer.cancel();
                        'Timer completed';
                      });
                    }
                  }
                })
              });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Color(0xff2C5364), Color(0xff0F2027)])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 120),
                child: Text('$_minutes : $_seconds',
                    style: const TextStyle(color: Colors.white, fontSize: 45),
                    textAlign: TextAlign.center),
              ),


              const SizedBox(height: 100,),
              const SetsIcons(total: 4, done: 1), // sets widget

              Expanded(
                child: Column(
                  children: [
                    Expanded(
                        child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xff66D7EE),
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
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 50, left: 20, right: 20, bottom: 50),
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
                                      Text('Study Time',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blueGrey[800])),
                                      Text('Break',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blueGrey[800],
                                          )),
                                    ],
                                  ),
                                  Expanded(
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                        ElevatedButton(
                                          //start button
                                          child: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10, horizontal: 10),
                                              child: Text(
                                                'Start Studying',
                                              )),

                                          onPressed: () {
                                            if (_buttonEnable) {
                                              _buttonEnable = false;
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
