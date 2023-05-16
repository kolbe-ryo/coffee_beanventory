// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:coffee_beanventory/constant/constants.dart';

part 'image_cacher.g.dart';

@riverpod
class ImageCacher extends _$ImageCacher {
  @override
  FutureOr<void> build() async {
    return await _cacheImages();
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
