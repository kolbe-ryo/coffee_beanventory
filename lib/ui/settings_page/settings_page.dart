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
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: kPadding),
        child: Column(
          children: const [
            CommonCard(),
            CommonCard(),
            CommonCard(),
          ],
        ),
      ),
    );
  }
}
