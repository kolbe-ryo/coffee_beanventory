// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:coffee_beanventory/ui/top_page/top_page_state.dart';

part 'top_page_view_model.g.dart';

@riverpod
class TopPageViewModel extends _$TopPageViewModel {
  @override
  TopPageState build() => const TopPageState();

  void switchIsRemoveBottomLayer({required bool isRemove}) => state = state.copyWith(isRemoveBottomLayer: isRemove);
}
