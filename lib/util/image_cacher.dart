import 'package:coffee_beanventory/constant/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_cacher.g.dart';

@riverpod
class ImageCacher extends _$ImageCacher {
  @override
  FutureOr<bool> build() async {
    return await _cacheImage();
  }

  Future<bool> _cacheImage() async {
    await precachePicture(
      ExactAssetPicture(
        SvgPicture.svgStringDecoderBuilder,
        frameImagePath,
      ),
      null,
    );
    return true;
  }
}
