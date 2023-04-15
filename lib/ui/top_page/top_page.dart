// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flame/game.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:coffee_beanventory/ui/component/paint/frame_sketch.dart';
import 'package:coffee_beanventory/ui/game_widget/game_world.dart';
import 'package:coffee_beanventory/ui/top_page/top_page_view_model.dart';
import '../../constant/constants.dart';

class TopPage extends ConsumerWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final engine = GameWorld(MediaQuery.of(context).size);
    final topPageProvider = ref.watch(topPageViewModelProvider);
    return topPageProvider.when(
      data: (state) => SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blueGrey,
          body: Padding(
            padding: const EdgeInsets.all(0),
            child: Stack(
              children: [
                const Align(
                  alignment: Alignment.topCenter,
                  child: FrameSketch(),
                ),
                Visibility(
                  visible: state.isLoaded,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: GameWidget(
                      game: engine,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: ElevatedButton(
                    onPressed: () {
                      engine.addBalls(10);
                    },
                    child: const Text('Add'),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: engine.onRemove,
                    child: const Text('Remove'),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: engine.onCreate,
                    child: const Text('Create'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      loading: () => const Center(
        child: CupertinoActivityIndicator(radius: 24),
      ),
      error: (err, stack) => Center(
        child: Text(
          err.toString(),
        ),
      ),
    );
  }
}
