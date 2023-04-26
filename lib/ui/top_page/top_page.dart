// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flame/game.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:coffee_beanventory/constant/constants.dart';
import 'package:coffee_beanventory/ui/component/dispense_knob_button.dart';
import 'package:coffee_beanventory/ui/component/paint/frame_sketch.dart';
import 'package:coffee_beanventory/ui/game_widget/game_world.dart';
import 'package:coffee_beanventory/ui/top_page/top_page_view_model.dart';
import 'package:coffee_beanventory/util/image_cacher.dart';
import 'package:coffee_beanventory/util/logger.dart';

class TopPage extends ConsumerWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaSize = MediaQuery.of(context).size;
    // final engine = GameWorld(mediaQuery: mediaSize);
    // ref.watch(topPageViewModelProvider.notifier).world = GameWorld(mediaQuery: mediaSize);
    final imageCacher = ref.watch(imageCacherProvider);
    final topPageVM = ref.watch(topPageViewModelProvider.notifier);
    return imageCacher.when(
      data: (state) => SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 65, 65, 65),
          body: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: GameWidget(
                  game: topPageVM.world,
                ),
              ),
              const Align(
                alignment: Alignment.topCenter,
                child: ImageWidget(frameImagePath),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: ElevatedButton(
                  onPressed: () {
                    topPageVM.addBeanGrams(10);
                  },
                  child: const Text('Add'),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {
                    final isRemoveBottomLayer = ref.read(topPageViewModelProvider).isRemoveBottomLayer;
                    if (isRemoveBottomLayer) {
                      return;
                    }
                    topPageVM.world.onRemove();
                    ref.watch(topPageViewModelProvider.notifier).switchIsRemoveBottomLayer(isRemove: true);
                  },
                  child: const Text('Remove'),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {
                    final isRemoveBottomLayer = ref.read(topPageViewModelProvider).isRemoveBottomLayer;
                    if (!isRemoveBottomLayer) {
                      return;
                    }
                    topPageVM.world.onCreate();
                    ref.watch(topPageViewModelProvider.notifier).switchIsRemoveBottomLayer(isRemove: false);
                  },
                  child: const Text('Create'),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: ElevatedButton(
                  onPressed: () {
                    final ballCounts = topPageVM.world.onCount();
                    logger.info(ballCounts);
                  },
                  child: const Text('Count'),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                  onPressed: topPageVM.world.onRemoveBeans,
                  child: const Text('Remove Ball'),
                ),
              ),
              Positioned(
                top: mediaSize.width * aspectRateOfFlame - 50,
                left: mediaSize.width / 2 - 50,
                child: Container(
                  height: knobRadius,
                  width: knobRadius,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 137, 94, 33),
                  ),
                ),
              ),
              Positioned(
                top: mediaSize.width * aspectRateOfFlame - 50,
                left: mediaSize.width / 2 - 50,
                child: const DispenseKnobButton(),
              ),
            ],
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
