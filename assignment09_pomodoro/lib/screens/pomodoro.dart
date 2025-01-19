import 'dart:async';
import 'package:flutter/material.dart';

class Pomodoro extends StatefulWidget {
  const Pomodoro({super.key});

  @override
  State<Pomodoro> createState() => _PomodoroState();
}

class _PomodoroState extends State<Pomodoro> {
  int minutesSelection = 25;
  int totalSeconds = 1500;
  bool isRunning = false;
  bool isBreak = false;
  int totalRounds = 0;
  int totalGoals = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();

    // 화면이 로드될 때 타이머 먼저 초기화
    timer = Timer.periodic(const Duration(seconds: 1), onTick);
    timer.cancel();
  }

  // onTick 함수는 state를 변경한다.
  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        isRunning = false;
        totalSeconds = 1500;
      });
      timer.cancel();
    }
    setState(() {
      totalSeconds = totalSeconds - 1;
    });
  }

  void onStartPressed() async {
    setState(() {
      isRunning = true;
    });

    while (isRunning && totalSeconds > 0) {
      await Future.delayed(const Duration(milliseconds: 1)); // 1/1000초 대기
      setState(() {
        totalSeconds -= 1; // 1초 감소
      });

      if (totalSeconds == 0 && isBreak == false) {
        setState(() {
          totalRounds = totalRounds + 1;
          if (totalRounds == 4) {
            totalGoals = totalGoals + 1;
            totalRounds = 0;
          }

          isBreak = true; // 쉬는시간 시작
          totalSeconds = 5 * 60; // 타이머 초기화
        });
      } else if (totalSeconds == 0 && isBreak == true) {
        // 쉬는시간 끝났을 때
        setState(() {
          isBreak = false;
          totalSeconds = minutesSelection * 60;
        });
      }
    }
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onResetPressed() {
    timer.cancel();
    setState(() {
      totalSeconds = minutesSelection * 60;
      isRunning = false;
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split('.').first.substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'ChanMoDoRo',
                    style: TextStyle(
                      color: Theme.of(context).cardColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    isBreak ? 'BREAK TIME ☕' : "",
                    style: TextStyle(
                      color: Theme.of(context).cardColor,
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    format(totalSeconds),
                    style: TextStyle(
                      color: Theme.of(context).cardColor,
                      fontSize: 100,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Stack(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5,
                      (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            isRunning = false;
                            minutesSelection = 15 + index * 5; // 클릭한 버튼의 값을 설정
                            totalSeconds = minutesSelection * 60; // 시간 설정
                          });
                          timer.cancel();
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                            color: 15 + index * 5 == minutesSelection
                                ? Theme.of(context).cardColor
                                : Colors.transparent,
                            border: Border.all(
                              color: Theme.of(context).cardColor,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 8,
                            ),
                            child: Text(
                              '${15 + index * 5}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: 15 + index * 5 == minutesSelection
                                    ? Theme.of(context).scaffoldBackgroundColor
                                    : Theme.of(context).cardColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        iconSize: 80,
                        color: Theme.of(context).cardColor,
                        onPressed: isRunning ? onPausePressed : onStartPressed,
                        icon: Icon(isRunning
                            ? Icons.pause_circle_outline
                            : Icons.play_circle_outline),
                      ),
                      Text(
                        isRunning ? "PAUSE" : "START",
                        style: TextStyle(
                            color: Theme.of(context).cardColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        iconSize: 80,
                        color: Theme.of(context).cardColor,
                        onPressed: onResetPressed,
                        icon: Icon(Icons.restore),
                      ),
                      Text(
                        'RESET',
                        style: TextStyle(
                            color: Theme.of(context).cardColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$totalRounds / 4',
                              style: TextStyle(
                                fontSize: 32,
                                color:
                                    Theme.of(context).cardColor.withAlpha(160),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'ROUND',
                              style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).cardColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 80,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$totalGoals / 12',
                              style: TextStyle(
                                fontSize: 32,
                                color:
                                    Theme.of(context).cardColor.withAlpha(160),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'GOAL',
                              style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).cardColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
