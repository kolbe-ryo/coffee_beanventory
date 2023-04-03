import 'package:coffee_beanventory/main.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class TopPage extends StatelessWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final engine = Forge2DExample();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: 800,
            child: GameWidget(
              game: engine,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              engine.addBalls(10);
            },
            child: Text('Button'),
          ),
        ],
      ),
    );
  }
}
