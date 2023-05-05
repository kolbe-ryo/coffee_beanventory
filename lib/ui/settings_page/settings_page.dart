// Flutter imports:
import 'package:coffee_beanventory/constant/constants.dart';
import 'package:coffee_beanventory/ui/component/common_card.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: kPadding),
        child: Column(
          children: [
            const SpacerH(),
            Row(
              children: const [
                Expanded(child: SquareCard()),
                SpacerW(),
                Expanded(child: SquareCard()),
              ],
            ),
            const SpacerH(),
            const CommonCard(),
            const SpacerH(),
            Row(
              children: const [
                Flexible(
                  flex: 2,
                  child: CommonCard(),
                ),
                SpacerW(),
                Flexible(
                  child: CommonCard(),
                ),
              ],
            ),
            const SpacerH(),
            Row(
              children: const [
                Expanded(child: SquareCard()),
                SpacerW(),
                Expanded(child: SquareCard()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
