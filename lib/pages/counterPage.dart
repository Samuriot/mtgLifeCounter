import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:magicapp/components/lifeTile.dart';

// Stateful Widget updates the value on screen
class CounterPage extends StatefulWidget {
	const CounterPage({
    super.key
  
  });

	@override
	State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {

	// variables
	int numPlayers = 4;

	List<Widget> renderPlayers() {
    List<Widget> players = [];
		for(int i = 0; i < numPlayers; i++) {
			players.insert(i, const LifeTile(commander: "The Wise Mothman",));
		}
		return players;
	}

	List<int> diceRoll() {
		List<int> rollCounts = [];
		for(int i = 0; i < numPlayers; i++) {
			rollCounts.insert(i, Random().nextInt(21) + 1);
		}

    int winner = 0;
    int maxRoll = rollCounts[0];
    for(int i = 1; i < numPlayers; i++) {
      if(maxRoll < rollCounts[i]) {
        winner = i;
        maxRoll = rollCounts[i];
      }
    }

		return [winner, maxRoll];
	}
  
	// UI 
	@override
	Widget build(BuildContext context) {
		return Scaffold(
      backgroundColor: const Color.fromARGB(255, 51, 49, 49),
      // use Center to center in the middle of the page
      body: Center(
          // GridView allows for 2D array
          child: GridView.builder(
            itemCount: numPlayers,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.5), 
            itemBuilder: (BuildContext context, int index) {
              if(index % 2 == 0) {
                return RotatedBox(
                  quarterTurns: 1,
                  child: LifeTile(commander: "The Wise Mothman")
                );
              }
              else {
                  return RotatedBox(
                    quarterTurns: 3,
                    child: LifeTile(commander: "The Wise Mothman")
                  );
              }
            }
        )
      )
			// body: Center(
			// 	child: Column(
			// 		mainAxisAlignment: MainAxisAlignment.center,
			// 		children: renderPlayers(),
			// 	)
			// )
		);
	}
}