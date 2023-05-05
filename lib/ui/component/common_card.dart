import 'package:coffee_beanventory/constant/constants.dart';
import 'package:flutter/material.dart';

class CommonCard extends StatelessWidget {
  const CommonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 0,
      color: Colors.blueAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(kPadding),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        height: cardHeight,
      ),
    );
  }
}

class SquareCard extends StatelessWidget {
  const SquareCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 0,
      color: Colors.blueAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(kPadding),
        ),
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: SizedBox(
          width: double.infinity,
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
