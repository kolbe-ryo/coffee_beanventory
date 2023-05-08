// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:coffee_beanventory/constant/constants.dart';
import 'package:coffee_beanventory/ui/component/common_card.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        title: const Text('Settings'),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            iconSize: 30,
            splashRadius: 10,
            onPressed: () => context.pop(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: kPadding),
        child: Column(
          children: [
            Row(
              children: const [
                //
                Flexible(
                  flex: 2,
                  child: CommonCard(
                    child: Icon(Icons.apple),
                    height: cardHeight * 2,
                  ),
                ),
                SpacerW(),
                Flexible(
                  child: CommonCard(
                    child: Icon(Icons.apple),
                    height: cardHeight * 2,
                  ),
                ),
              ],
            ),
            const SpacerH(),
            const CommonCard(
              child: Icon(Icons.apple),
            ),
            const SpacerH(),
            Row(
              children: const [
                //
                Expanded(
                  child: SquareCard(
                    child: Icon(Icons.apple),
                  ),
                ),
                SpacerW(),
                Expanded(
                  child: SquareCard(
                    child: Icon(Icons.apple),
                  ),
                ),
              ],
            ),
            const SpacerH(),
            Row(
              children: [
                Flexible(
                  child: CommonCard(
                    child: Icon(Icons.apple),
                  ),
                ),
                SpacerW(),
                Flexible(
                  flex: 2,
                  child: CommonCard(
                    child: Column(
                      children: [
                        Text('App Store'),
                        Expanded(child: Icon(Icons.apple)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // const SpacerH(),
            // Row(
            //   children: const [
            //     Expanded(child: SquareCard()),
            //     SpacerW(),
            //     Expanded(child: SquareCard()),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
