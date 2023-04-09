// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flame/game.dart';

// Project imports:
import 'package:coffee_beanventory/main.dart';
import 'package:coffee_beanventory/ui/component/paint/frame_sketch.dart';
import 'package:coffee_beanventory/ui/game_widget/game_world.dart';

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
