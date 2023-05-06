// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:coffee_beanventory/constant/constants.dart';

class CommonCard extends StatelessWidget {
  const CommonCard({
    super.key,
    required this.child,
    this.height = cardHeight,
  });

  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.blueAccent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(kPadding),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        height: height,
        child: child,
      ),
    );
  }
}

class SquareCard extends StatelessWidget {
  const SquareCard({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.blueAccent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(kPadding),
        ),
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: SizedBox(
          width: double.infinity,
          child: child,
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
