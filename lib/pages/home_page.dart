import 'dart:async';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pomodoro_app/widgets/sets_icons.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

int minutes = 25;
int seconds = 0;
Timer? timer;
final isRunnig = timer == null ? false : timer!.isActive;

class _MyHomePageState extends State<MyHomePage> {
  void start({bool reset = true}) {
    if (reset) {
      resetTimer();
    }

    if (minutes > 1) {
      seconds = minutes * 60;
    } else {
      stopTimer(reset: false);
    }
    if (seconds > 60) {
      minutes = (seconds / 60).floor();
      seconds -= (minutes * 60);

      const oneSec = Duration(seconds: 1);
      timer = Timer.periodic(
          oneSec,
          (timer) => {
                setState(() {
                  if (seconds > 0) {
                    seconds--;
                  } else {
                    if (minutes > 0) {
                      seconds = 59;
                      minutes--;
                    }
                  }
                })
              });
    }
  }

  void resetTimer() => setState(() {
        minutes = 25;
        seconds = 0;
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
                  onPressed: () {}),
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

 

  Widget buildTimer() {
    return SizedBox(
      height: 200,
      width: 200,
      child: Center(
          child: CircularPercentIndicator(
        center: Text(
          '$minutes : $seconds',
          style: const TextStyle(fontSize: 30),
        ),
        animation: true,
        animationDuration: 1000,
        addAutomaticKeepAlive: false,
        reverse: true,
        radius: 130,
        lineWidth: 10,
        percent: 1,
        backgroundColor: const Color(0xff121212),
        linearGradient: const LinearGradient(
            colors: [Color(0xff0575E6), Color(0xff021B79)]),
        circularStrokeCap: CircularStrokeCap.round,
      )),
    );
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
              Expanded(child: buildTimer()),

              const SetsIcons(total: 4, done: 2), // sets widget

              Expanded(
                child: Column(
                  children: [
                    Expanded(
                        child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.cyan.shade500,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(255, 38, 88, 112),
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
