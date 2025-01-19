import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment 07 - UI Clone',
      home: Scaffold(
        backgroundColor: Color(0xFF1F1F1F),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.people,
                            size: 80,
                            color: Colors.white,
                          ),
                          Icon(
                            Icons.add_rounded,
                            size: 40,
                            color: Colors.white,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: [
                          Text(
                            'MONDAY 16',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Text(
                              'TODAY',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 48,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFAA2A7A),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(padding: EdgeInsets.all(5)),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              '17',
                              style: TextStyle(
                                color: Colors.white.withAlpha(127),
                                fontSize: 48,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              '18',
                              style: TextStyle(
                                color: Colors.white.withAlpha(127),
                                fontSize: 48,
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              '19',
                              style: TextStyle(
                                color: Colors.white.withAlpha(127),
                                fontSize: 48,
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              '20',
                              style: TextStyle(
                                color: Colors.white.withAlpha(127),
                                fontSize: 48,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFFEF754),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16, 32, 16, 16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              spacing: -8,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '11',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  '30',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  '|',
                                  style: TextStyle(
                                      color: Colors.black.withAlpha(127),
                                      fontSize: 32,
                                      fontWeight: FontWeight.w300),
                                ),
                                Text(
                                  '12',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  '20',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Column(
                              spacing: -28,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'DESIGN',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 60,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'MEETING',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 60,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 48,
                            ),
                            Text(
                              'ALEX',
                              style: TextStyle(
                                color: Colors.black.withAlpha(127),
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              width: 32,
                            ),
                            Text(
                              'HELENA',
                              style: TextStyle(
                                color: Colors.black.withAlpha(127),
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              width: 32,
                            ),
                            Text(
                              'NANA',
                              style: TextStyle(
                                color: Colors.black.withAlpha(127),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF9C6BCE),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16, 32, 16, 16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              spacing: -8,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '12',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  '35',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  '|',
                                  style: TextStyle(
                                      color: Colors.black.withAlpha(127),
                                      fontSize: 32,
                                      fontWeight: FontWeight.w300),
                                ),
                                Text(
                                  '14',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  '10',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Column(
                              spacing: -28,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'DAILY',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 60,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'PROJECT',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 60,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 48,
                            ),
                            Text(
                              'ME',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              width: 32,
                            ),
                            Text(
                              'RICHARD',
                              style: TextStyle(
                                color: Colors.black.withAlpha(127),
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              width: 32,
                            ),
                            Text(
                              'CIRY',
                              style: TextStyle(
                                color: Colors.black.withAlpha(127),
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              width: 32,
                            ),
                            Text(
                              '+4',
                              style: TextStyle(
                                color: Colors.black.withAlpha(127),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFBBEE4B),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16, 32, 16, 16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              spacing: -8,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '15',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  '00',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  '|',
                                  style: TextStyle(
                                      color: Colors.black.withAlpha(127),
                                      fontSize: 32,
                                      fontWeight: FontWeight.w300),
                                ),
                                Text(
                                  '16',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  '30',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Column(
                              spacing: -28,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'WEEKLY',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 60,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'PLANNING',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 56,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 48,
                            ),
                            Text(
                              'DEN',
                              style: TextStyle(
                                color: Colors.black.withAlpha(127),
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              width: 32,
                            ),
                            Text(
                              'NANA',
                              style: TextStyle(
                                color: Colors.black.withAlpha(127),
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              width: 32,
                            ),
                            Text(
                              'MARK',
                              style: TextStyle(
                                color: Colors.black.withAlpha(127),
                                fontSize: 16,
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
        ),
      ),
    );
  }
}
