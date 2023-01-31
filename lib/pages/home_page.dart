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

  void start({bool reset = true}) {
    if (reset) {
      resetTimer();
    }

    if (_minutes > 0) {
      _seconds = _minutes * 60;
    } else {
      stopTimer(reset: false);
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
                    }
                  }
                })
              });
    }
  }

  void resetTimer() => setState(() {
        _minutes = 25;
        _seconds = 0;
      });

  void stopTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }

    setState(() {
      timer?.cancel();
    });
  }

  Widget buildButtons() {
    final isRunnig = timer == null ? false : timer!.isActive;

    return isRunnig
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  // pause button
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(110, 1)),
                  child: Text(isRunnig ? 'Pause' : 'Resume'),
                  onPressed: () {
                    setState(() {
                      if (isRunnig) {
                        stopTimer(reset: false);
                      } else {
                        start(reset: false);
                      }
                    });
                  }),
              const SizedBox(
                width: 12,
              ),
              ElevatedButton(
                  // cancel button
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(110, 1)),
                  onPressed: () {
                    stopTimer(reset: true);
                  },
                  child: const Text('cancel'))
            ],
          )
        : ElevatedButton(
            // start button
            style: ElevatedButton.styleFrom(fixedSize: const Size(110, 0)),
            onPressed: () {
              start();
            },
            child: const Text('start'));
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
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('$_minutes : $_seconds')],
              )),

              const SetsIcons(total: 4, done: 2), // sets widget

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
                                          children: [buildButtons()]))
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
