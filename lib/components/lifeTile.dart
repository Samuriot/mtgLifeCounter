// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';

class LifeTile extends StatefulWidget {
  final String commander;
  const LifeTile({super.key, required this.commander});

  @override
  State<LifeTile> createState() => _LifeTileState();
}

class _LifeTileState extends State<LifeTile> {
  int life = 40;
  int commanderDmg = 0;
  Timer? timer;
  Duration delay = const Duration(milliseconds: 700);

  void incrementCounter() {
		// setState rebuilds the widget to reflect changes
		setState(() {
			life++;
		});
	}

  void stopTimer() {
    timer?.cancel();
    timer = null;
  }

  void add10Counter() {
		// setState rebuilds the widget to reflect changes
		setState(() {
			life+=10;
		});
	}

  void minus10Counter() {
		// setState rebuilds the widget to reflect changes
		setState(() {
			life-=10;
		});
	}

	void decrementCounter() {
		setState(() {
			life--;
		});
	}

  void startAddTimer() {
		// setState rebuilds the widget to reflect changes
    if(timer != null) return;
    timer = Timer.periodic(delay, (timer) {
      add10Counter();
    });
	}

  void startMinusTimer() {
    // setState rebuilds the widget to reflect changes
    if(timer != null) return;
    timer = Timer.periodic(delay, (timer) {
      minus10Counter();
    });
  }

  bool isDead() {
    if(life <= 0) {
      return true;
    } else if(commanderDmg >= 21) return true;
    return false;
  }

  Widget renderWidget() {
    if(isDead()) {
      return Text("You Suck");
    } 
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: decrementCounter,
              onLongPress: startMinusTimer,
              onLongPressEnd: (details) => stopTimer(),
              child: ElevatedButton(
                onPressed: () {}, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 55, 30, 97)
                ),
                child: Icon(Icons.remove)
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.commander, style: TextStyle(fontSize: 20)
                ),
                Text(
                  life.toString(), style: TextStyle(fontSize: 20)
                ),
              ],
            ),
            GestureDetector(
              onTap: incrementCounter,
              onLongPress: startAddTimer,
              onLongPressEnd: (details) => stopTimer(),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 55, 30, 97)
                ),
                child: Icon(Icons.add)
              ),
            ),
          ],
      );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(12),
        ),
        child: renderWidget()
      ),
    );
  }
}
