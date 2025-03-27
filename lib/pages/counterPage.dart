import 'package:flutter/material.dart';
import 'package:magicapp/components/lifeTile.dart';

// Stateful Widget updates the value on screen
class CounterPage extends StatefulWidget {
	const CounterPage({super.key});

	@override
	State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {

	// variable
	int counter = 0;

	// method
	void incrementCounter() {
		// setState rebuilds the widget to reflect changes
		setState(() {
			counter++;
		});
	}

	void decrementCounter() {
		setState(() {
			counter--;
		});
	}

	// UI 
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Center(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: [
						LifeTile(),
            LifeTile(),
            LifeTile(),
            LifeTile(),
					]
				)
			)
		);
	}
}