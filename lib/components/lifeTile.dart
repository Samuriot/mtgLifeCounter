// ignore_for_file: prefer_const_constructors

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
  void incrementCounter() {
		// setState rebuilds the widget to reflect changes
		setState(() {
			life++;
		});
	}

	void decrementCounter() {
		setState(() {
			life--;
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
      return Text("You Fucking Suck");
    } 
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: decrementCounter, 
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 55, 30, 97)
              ),
              child: Icon(Icons.remove)
            ),
            Column(
              children: [
                Text(
                  widget.commander, style: TextStyle(fontSize: 40)
                ),
                Text(
                  life.toString(), style: TextStyle(fontSize: 40)
                ),
              ],
            ),
            ElevatedButton(
              onPressed: incrementCounter, 
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 55, 30, 97)
              ),
              child: Icon(Icons.add)
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
