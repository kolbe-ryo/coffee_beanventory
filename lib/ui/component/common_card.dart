import 'package:coffee_beanventory/constant/constants.dart';
import 'package:flutter/material.dart';

class CommonCard extends StatelessWidget {
  const CommonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 0,
      color: Colors.amber,
      margin: EdgeInsets.only(top: kPadding),
      child: SizedBox(
        width: double.infinity,
        height: 80,
      ),
    );
  }
}
