import 'dart:math';

import 'package:flutter/material.dart';

class FunCounter extends StatefulWidget {
  const FunCounter({super.key});

  @override
  State<FunCounter> createState() => _FunCounterState();
}

class _FunCounterState extends State<FunCounter> {
  int counter = 0;
  int count = 0;
  String emoji = "☺️";
  Color bgColor = Colors.white;
  double textSize = 25.0;
  int shapeIndex = 0;

  void changeEmoji() {
    if (count < 10) {
      emoji = "☺️";
    } else if (count > 10 && count < 20) {
      emoji = "😇";
    } else if (count > 20 && count < 30) {
      emoji = "😍";
    } else if (count > 20 && count < 30) {
      emoji = "🥰";
    } else {
      emoji = "😘";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(
          "Fun Counter",
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 25, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.only(top: 50, bottom: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    // Font Size Grower
                    Text(
                      "$counter",
                      style: TextStyle(
                          fontSize: textSize, fontWeight: FontWeight.w500),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            counter++;
                            textSize += 2.0;
                          });
                        },
                        child: Text("Increase Size",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700))),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Column(
                  children: [
                    // Emoji Mood Counter
                    Text(
                      "$emoji",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            count++;
                            changeEmoji();
                          });
                        },
                        child: Text("Emoji : $count",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700))),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 70,
            ),
            Row(
              // Shape Switcher
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      shapeIndex = (shapeIndex + 1) % 3;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 100,
                    height: 100,
                    decoration: shapeIndex == 0
                        ? const BoxDecoration(
                            color: Colors.purple,
                            shape: BoxShape.circle,
                          )
                        : BoxDecoration(
                            color:
                                shapeIndex == 1 ? Colors.orange : Colors.teal,
                            borderRadius:
                                BorderRadius.circular(shapeIndex == 1 ? 20 : 0),
                          ),
                    alignment: Alignment.center,
                    child: const Text(
                      "Tap Shape",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                // Color Change Counter
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        bgColor =
                            Color((Random().nextDouble() * 0xFFFFFF).toInt())
                                .withOpacity(1.0);
                      });
                    },
                    child: Text(
                      "Chnage BgColor",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ))
              ],
            )
          ],
        ),
      )),
    );
  }
}
