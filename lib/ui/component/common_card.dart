import 'package:coffee_beanventory/constant/constants.dart';
import 'package:flutter/material.dart';

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
  const SpacerH({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: kPadding / 2,
    );
  }
}

class SpacerW extends StatelessWidget {
  const SpacerW({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: kPadding / 2,
    );
  }
}
