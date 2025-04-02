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

  // member variables
  int life = 40;
  int commanderDmg = 0;
  Timer? timer;
  Duration delay = const Duration(milliseconds: 700);

  // increments life & updates UI
  void incrementCounter() {
		// setState rebuilds the widget to reflect changes
		setState(() {
			life++;
		});
	}

  // decrements life & updates UI
  void decrementCounter() {
		setState(() {
			life--;
		});
	}

  // increments life by 10 & updates UI 
  void add10Counter() {
		// setState rebuilds the widget to reflect changes
		setState(() {
			life+=10;
		});
	}

  // decrements life by 10 & updates UI 
  void minus10Counter() {
		// setState rebuilds the widget to reflect changes
		setState(() {
			life-=10;
		});
	}

  // uses a Timer for for holding Gestures
  // updates the UI via add10Counter() and calls this method every 700 ms
  void startAddTimer() {
		// setState rebuilds the widget to reflect changes
    if(timer != null) return;
    timer = Timer.periodic(delay, (timer) {
      add10Counter();
    });
	}

  // uses a Timer for for holding Gestures
  // updates the UI via minus10Counter() and calls this method every 700 ms
  void startMinusTimer() {
    // setState rebuilds the widget to reflect changes
    if(timer != null) return;
    timer = Timer.periodic(delay, (timer) {
      minus10Counter();
    });
  }

  // uses a Timer for for holding Gestures
  // stops the timer was this function is called, and sets var back to null
  void stopTimer() {
    timer?.cancel();
    timer = null;
  }

  // checks if a player has died yet
  bool isDead() {
    if(life <= 0) {
      return true;
    } else if(commanderDmg >= 21) return true;
    return false;
  }

  Widget renderWidget() {
    if(isDead()) {
      return Center(
        child: Text("You Suck", style: TextStyle(fontSize: 60))
      );
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
