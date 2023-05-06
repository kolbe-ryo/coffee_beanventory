// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flame/game.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:coffee_beanventory/constant/constants.dart';
import 'package:coffee_beanventory/enum/color_index_enum.dart';
import 'package:coffee_beanventory/global/global_manager.dart';
import 'package:coffee_beanventory/ui/component/dispense_knob_button.dart';
import 'package:coffee_beanventory/ui/component/display_meter.dart';
import 'package:coffee_beanventory/ui/component/paint/frame_sketch.dart';
import 'package:coffee_beanventory/util/image_cacher.dart';

class TopPage extends ConsumerWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageCacher = ref.watch(imageCacherProvider);
    final globalManager = ref.watch(globalManagerProvider.notifier);
    final colorIndexEnum = ref.watch(globalManagerProvider.select((value) => value.colorIndex));
    return imageCacher.when(
      data: (state) => SafeArea(
        child: Scaffold(
          backgroundColor: colorIndexEnum.colors['background'],
          body: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: GameWidget(
                  game: globalManager.world,
                ),
              ),
              const Align(
                alignment: Alignment.topCenter,
                child: ImageWidget(frameImagePath),
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.settings),
                  color: Colors.grey,
                  iconSize: 40,
                  splashRadius: 10,
                  onPressed: () => context.go('/settings'),
                ),
              ),
            ],
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: kPadding * 2),
                child: Column(
                  verticalDirection: VerticalDirection.up, // childrenの先頭が下に配置されます。
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(bottom: kPadding),
                      child: DisplayMeter(
                        buttonText: 'Stock',
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                verticalDirection: VerticalDirection.up, // childrenの先頭が下に配置されます。
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  DispenseKnobButton(
                    buttonText: 'Use',
                    function: ref.watch(globalManagerProvider.notifier).removeBeanGrams,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: kPadding),
                    child: DispenseKnobButton(
                      buttonText: 'Add',
                      function: ref.watch(globalManagerProvider.notifier).addBeanGrams,
                    ),
                  ),
                ],
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
