// Flutter imports:
import 'package:coffee_beanventory/enum/color_index_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flame/game.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:coffee_beanventory/constant/constants.dart';
import 'package:coffee_beanventory/ui/component/dispense_knob_button.dart';
import 'package:coffee_beanventory/ui/component/paint/frame_sketch.dart';
import 'package:coffee_beanventory/ui/top_page/top_page_view_model.dart';
import 'package:coffee_beanventory/util/image_cacher.dart';

class TopPage extends ConsumerWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final mediaSize = MediaQuery.of(context).size;
    final imageCacher = ref.watch(imageCacherProvider);
    final topPageVM = ref.watch(topPageViewModelProvider.notifier);
    return imageCacher.when(
      data: (state) => SafeArea(
        child: Scaffold(
          backgroundColor: ColorIndexEnum.warm.colors['background'],
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
            ],
          ),
          floatingActionButton: Column(
            verticalDirection: VerticalDirection.up, // childrenの先頭が下に配置されます。
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              DispenseKnobButton(
                buttonText: 'Use',
                function: ref.watch(topPageViewModelProvider.notifier).removeBeanGrams,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: kPadding),
                child: DispenseKnobButton(
                  buttonText: 'Add',
                  function: ref.watch(topPageViewModelProvider.notifier).addBeanGrams,
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
