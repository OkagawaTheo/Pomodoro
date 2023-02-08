import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:pomodoro_app/widgets/sets_icons.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

Timer? timer;
int minutes = 25;
int seconds = 0;
int breaktime = 5;
int longbreak = 15;
int counter = 0;
int sets = 0;

class _MyHomePageState extends State<MyHomePage> {
  void start() {
    if (minutes > 1) {
      seconds = minutes * 60;
    }
    if (seconds > 60) {
      minutes = (seconds / 60).floor();
      seconds -= (minutes * 60);

      const oneSec = Duration(milliseconds: 1000);
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
                    } else {
                      counter++;
                      timer.cancel();
                      if (counter == 1) {
                        _breakTime();
                      } else {
                        minutes = 25;
                        counter++;
                      }
                    }
                  }
                })
              });
    }
  }

  void _breakTime() {
    setState(() {
      counter = -2;
      minutes = breaktime;
      if (sets < 4) {
        sets += 1;
      } else {
        minutes = longbreak;
        sets = 0;
      }
    });
  }

  void _stopTimer() {
    setState(() {
      timer?.cancel();
    });
  }

  void _resetTimer() {
    setState(() {
      minutes = 25;
      seconds = 0;
    });
  }

  Future popUp() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Reset'),
            content: const Text('Do you want to reset the timer?'),
            actionsAlignment: MainAxisAlignment.center,
            elevation: 10,
            actions: [
              ElevatedButton(
                  onPressed: () {
                    _resetTimer();
                    _stopTimer();
                    Navigator.pop(context);
                  },
                  child: const Text('Yes')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('No'))
            ],
          );
        });
  }

  Widget buildButtons() {
    final isRunnig = timer == null ? false : timer!.isActive;

    return isRunnig
        ? ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 8,
              fixedSize: const Size(60, 60),
            ),
            onPressed: () {
              popUp();
            },
            child: const Icon(Icons.stop_rounded))
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 8, fixedSize: const Size(60, 60)),
            onPressed: () {
              start();
            },
            child: const Icon(Icons.play_arrow_rounded),
          );
  }

  Widget buildTimer() {
    return SizedBox(
      height: 200,
      width: 200,
      child: Center(
          child: Center(
              child: Text(
        seconds == 0 ? '$minutes : ${seconds.round()}0' : '$minutes : $seconds',
        style: const TextStyle(fontSize: 30),
      ))),
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

              SetsIcons(total: 4, done: sets), // sets widget

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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Text('Study time'),
                              Text('Breaktime'),
                            ],
                          ),
                          Expanded(child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                            buildButtons()
                          ],))
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
