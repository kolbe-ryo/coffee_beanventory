import 'package:coffee_beanventory/main.dart';
import 'package:coffee_beanventory/ui/component/frame_sketch.dart';
import 'package:coffee_beanventory/ui/component/game_world.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class TopPage extends StatelessWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final engine = GameWorld();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Stack(
            children: [
              const Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: 550,
                  height: 550,
                  child: FrameSketch(),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: GameWidget(
                  game: engine,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {
                    engine.addBalls(10);
                  },
                  child: Text('Button'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
