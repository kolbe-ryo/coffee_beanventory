// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:coffee_beanventory/constant/constants.dart';
import 'package:coffee_beanventory/global/global_manager.dart';

part 'initial_loader.g.dart';

@riverpod
class InitialLoader extends _$InitialLoader {
  @override
  FutureOr<void> build() async {
    await _cacheImages();
    await ref.watch<GlobalManager>(globalManagerProvider.notifier).fetchFromLocalStorage();
    return;
  }

  FutureOr<void> _cacheImages() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async {
        for (final image in svgImages) {
          await precachePicture(
            ExactAssetPicture(
              SvgPicture.svgStringDecoderBuilder,
              image,
            ),
            null,
          );
        }
        return;
      },
    );
  }
}
