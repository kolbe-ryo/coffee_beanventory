// Flutter imports:
import 'package:coffee_beanventory/constant/constants.dart';
import 'package:coffee_beanventory/ui/top_page/top_page_view_model.dart';
import 'package:coffee_beanventory/util/image_cacher.dart';
import 'package:coffee_beanventory/util/logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flame/game.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

// Project imports:
import 'package:coffee_beanventory/ui/component/paint/frame_sketch.dart';
import 'package:coffee_beanventory/ui/game_widget/game_world.dart';

class TopPage extends ConsumerWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaSize = MediaQuery.of(context).size;
    final engine = GameWorld(mediaQuery: mediaSize);
    final imageCacher = ref.watch(imageCacherProvider);
    return imageCacher.when(
      data: (state) => SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 65, 65, 65),
          body: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: GameWidget(
                  game: engine,
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
                    engine.addBalls(10);
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
                    engine.onRemove();
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
                    engine.onCreate();
                    ref.watch(topPageViewModelProvider.notifier).switchIsRemoveBottomLayer(isRemove: false);
                  },
                  child: const Text('Create'),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: ElevatedButton(
                  onPressed: () {
                    final ballCounts = engine.onCount();
                    logger.info(ballCounts);
                  },
                  child: const Text('Count'),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                  onPressed: engine.onRemoveBalls,
                  child: const Text('Remove Ball'),
                ),
              ),
              Positioned(
                top: mediaSize.width * aspectRateOfFlame - 50,
                left: mediaSize.width / 2 - 50,
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 137, 94, 33),
                  ),
                ),
              ),
              Positioned(
                top: mediaSize.width * aspectRateOfFlame - 50,
                left: mediaSize.width / 2 - 50,
                child: InkWell(
                  child: SleekCircularSlider(
                    appearance: CircularSliderAppearance(
                      angleRange: 360,
                      customColors: CustomSliderColors(
                        trackColor: Colors.transparent,
                        progressBarColor: Colors.orange,
                        hideShadow: true,
                      ),
                      customWidths: CustomSliderWidths(progressBarWidth: 20),
                      size: 100,
                      startAngle: 0,
                    ),
                    min: 0,
                    max: 100,
                    initialValue: 0,
                    // innerWidget: (percentage) => _CircleButton(),
                    onChange: (value) => print(value),
                  ),
                  onTap: () => print('test'),
                ),
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
