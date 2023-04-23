// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:coffee_beanventory/constant/constants.dart';
import 'package:coffee_beanventory/util/logger.dart';

part 'image_cacher.g.dart';

@riverpod
class ImageCacher extends _$ImageCacher {
  @override
  FutureOr<bool> build() async {
    return await _cacheImages();
  }

  Future<bool> _cacheImages() async {
    try {
      for (final image in svgImages) {
        await precachePicture(
          ExactAssetPicture(
            SvgPicture.svgStringDecoderBuilder,
            image,
          ),
          null,
        );
      }
      return true;
      // TODO: Change Exception
    } on Exception catch (e, trace) {
      logger
        ..info(e)
        ..info(trace);
      return false;
    }
  }
}
