// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LifeTile extends StatefulWidget {
  const LifeTile({super.key});

  @override
  State<LifeTile> createState() => _LifeTileState();
}

class _LifeTileState extends State<LifeTile> {
  int life = 40;
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: decrementCounter, 
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 55, 30, 97)
              ),
              child: Icon(Icons.remove)
            ),
            Text(
              life.toString(), style: TextStyle(fontSize: 40)
            ),
            ElevatedButton(
              onPressed: incrementCounter, 
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 55, 30, 97)
              ),
              child: Icon(Icons.add)
            ),
          ],
        ),
      ),
    );
  }
}
