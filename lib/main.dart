// Flutter imports:

import 'package:coffee_beanventory/tutorial/klodike/klodike.dart';
import 'package:coffee_beanventory/ui/component/coffee_dispenser.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  final game = KlondikeGame();
  runApp(GameWidget<FlameGame>(game: game));
}

// class CoffeeBeanventoryApp extends StatelessWidget {
//   const CoffeeBeanventoryApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Coffee Beanventory',
//       theme: ThemeData.dark(),
//       home: const CoffeeDispenserScreen(),
//     );
//   }
// }
