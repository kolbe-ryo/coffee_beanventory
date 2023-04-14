// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:coffee_beanventory/ui/top_page/top_page_state.dart';

part 'top_page_view_model.g.dart';

@riverpod
class TopPageViewModel extends _$TopPageViewModel {
  @override
  FutureOr<TopPageState> build() async {
    final isLoaded = await _cacheImage();
    return TopPageState(isLoaded: isLoaded);
  }

  Future<bool> _cacheImage() async {
    await precachePicture(
      ExactAssetPicture(
        SvgPicture.svgStringDecoderBuilder,
        'assets/images/frame_sketch.svg',
      ),
      null,
    );
    return true;
  }
}
