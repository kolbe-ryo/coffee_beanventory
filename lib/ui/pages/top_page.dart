// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flame/game.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:coffee_beanventory/constant/constants.dart';
import 'package:coffee_beanventory/enum/color_index_enum.dart';
import 'package:coffee_beanventory/global/global_manager.dart';
import 'package:coffee_beanventory/ui/component/common_card.dart';
import 'package:coffee_beanventory/ui/component/dispense_knob_button.dart';
import 'package:coffee_beanventory/ui/component/paint/frame_sketch.dart';
import 'package:coffee_beanventory/util/initial_loader.dart';

class TopPage extends ConsumerWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialLoader = ref.watch(initialLoaderProvider);
    final globalManager = ref.watch(globalManagerProvider.notifier);
    final colorIndexEnum = ref.watch(globalManagerProvider.select((value) => value.colorIndex));
    return initialLoader.when(
      data: (state) => SafeArea(
        child: Scaffold(
          backgroundColor: colorIndexEnum.colors[backgroundColor],
          body: Padding(
            padding: const EdgeInsets.all(kPadding / 2),
            child: Stack(
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
                    color: Colors.white,
                    iconSize: 40,
                    splashRadius: 10,
                    onPressed: () => context.go('/settings'),
                  ),
                ),
                const Align(
                  alignment: Alignment.topCenter,
                  child: CoffeeBeanInfo(),
                ),
              ],
            ),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: kPadding * 2),
                child: DispenseKnobButton(
                  buttonText: 'Add',
                  function: ref.watch(globalManagerProvider.notifier).addBeanGrams,
                ),
              ),
              DispenseKnobButton(
                buttonText: 'Use',
                function: ref.watch(globalManagerProvider.notifier).removeBeanGrams,
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

class CoffeeBeanInfo extends ConsumerWidget {
  const CoffeeBeanInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stockBeans = ref.watch(globalManagerProvider.select((value) => value.beanGrams));
    final maxStockBeans = ref.watch(globalManagerProvider.select((value) => value.beanStockMax));
    return Column(
      children: [
        const SpacerH(space: kPadding * 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FaIcon(
              FontAwesomeIcons.mugHot,
              size: 50,
            ),
            const SpacerW(space: kPadding),
            Text(
              '${stockBeans}g',
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
