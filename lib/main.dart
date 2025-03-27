import 'package:flutter/material.dart';
import 'package:magicapp/pages/counterPage.dart';

void main() {
	runApp(const MainApp());
}

// Stateless Widget never changes
class MainApp extends StatelessWidget {
	const MainApp({super.key});

	@override
	Widget build(BuildContext context) {
		return const MaterialApp(
			home: CounterPage(),

		);
	}

}
