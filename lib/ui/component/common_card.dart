// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:coffee_beanventory/constant/constants.dart';
import 'package:coffee_beanventory/enum/color_index_enum.dart';
import 'package:coffee_beanventory/global/global_manager.dart';

class CommonCard extends ConsumerWidget {
  const CommonCard({
    super.key,
    required this.child,
    this.height = cardHeight,
    required this.onTap,
  });

  final Widget child;
  final double height;
  final void Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorIndexEnum = ref.watch(globalManagerProvider.select((value) => value.colorIndex));
    return Card(
      elevation: 0,
      color: colorIndexEnum.colors[trackColor],
      margin: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(kPadding),
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(kPadding),
        onTap: onTap,
        child: SizedBox(
          width: double.infinity,
          height: height,
          child: Center(child: child),
        ),
      ),
    );
  }
}

class SquareCard extends ConsumerWidget {
  const SquareCard({
    super.key,
    required this.child,
    required this.onTap,
  });

  final Widget child;
  final void Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorIndexEnum = ref.watch(globalManagerProvider.select((value) => value.colorIndex));
    return Card(
      elevation: 0,
      color: colorIndexEnum.colors[trackColor],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(kPadding),
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(kPadding),
        onTap: onTap,
        child: AspectRatio(
          aspectRatio: 1,
          child: SizedBox(
            width: double.infinity,
            child: child,
          ),
        ),
      ),
    );
  }
}

class SpacerH extends StatelessWidget {
  const SpacerH({super.key, this.space = kPadding / 2});

  final double space;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: space,
    );
  }
}

class SpacerW extends StatelessWidget {
  const SpacerW({super.key, this.space = kPadding / 2});

  final double space;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: space,
    );
  }
}
