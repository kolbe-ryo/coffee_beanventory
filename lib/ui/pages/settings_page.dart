// Flutter imports:
import 'package:coffee_beanventory/enum/color_index_enum.dart';
import 'package:coffee_beanventory/global/global_manager.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:coffee_beanventory/constant/constants.dart';
import 'package:coffee_beanventory/ui/component/common_card.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorIndexEnum = ref.watch(globalManagerProvider.select((value) => value.colorIndex));
    return Scaffold(
      backgroundColor: colorIndexEnum.colors['background'],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: colorIndexEnum.colors['background'],
        elevation: 0,
        title: const Text(
          'Settings',
          style: TextStyle(
            fontSize: largeFontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            iconSize: 40,
            splashRadius: 10,
            padding: const EdgeInsets.only(right: kPadding),
            onPressed: () => context.pop(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: kPadding),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  flex: 2,
                  child: CommonCard(
                    height: cardHeight * 2,
                    // TODO: マイページに遷移
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        FaIcon(
                          FontAwesomeIcons.appStore,
                          size: settingIconSize,
                        ),
                        SpacerH(space: kPadding),
                        Text(
                          'About Thid App',
                          style: TextStyle(
                            fontSize: largeFontSize,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SpacerW(),
                Flexible(
                  child: CommonCard(
                    height: cardHeight * 2,
                    // TODO: ライセンス表示
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        FaIcon(
                          FontAwesomeIcons.certificate,
                          size: settingIconSize,
                        ),
                        SpacerH(space: kPadding),
                        Text(
                          'Licenses',
                          style: TextStyle(
                            fontSize: largeFontSize,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SpacerH(),
            CommonCard(
              // TODO: タップ時に入れ替える
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  FaIcon(
                    FontAwesomeIcons.paintRoller,
                    size: settingIconSize,
                  ),
                  SpacerW(space: kPadding),
                  Text(
                    'Color Setting',
                    style: TextStyle(
                      fontSize: largeFontSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SpacerH(),
            Row(
              children: [
                Expanded(
                  child: SquareCard(
                    // TODO: Something
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        FaIcon(
                          FontAwesomeIcons.trash,
                          size: settingIconSize,
                        ),
                        SpacerH(space: kPadding),
                        Text(
                          // TODO
                          'Something',
                          style: TextStyle(
                            fontSize: largeFontSize,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SpacerW(),
                Expanded(
                  child: SquareCard(
                    // TODO: Change maximum volume for bin
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        FaIcon(
                          FontAwesomeIcons.fillDrip,
                          size: settingIconSize,
                        ),
                        SpacerH(space: kPadding),
                        Text(
                          'Change Volume',
                          style: TextStyle(
                            fontSize: largeFontSize,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SpacerH(),
            Row(
              children: [
                Flexible(
                  child: CommonCard(
                    // TODO: Delete All
                    onTap: () {},
                    child: const FaIcon(
                      FontAwesomeIcons.trash,
                      size: settingIconSize,
                    ),
                  ),
                ),
                const SpacerW(),
                Flexible(
                  flex: 2,
                  child: CommonCard(
                    // TODO: Something
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        FaIcon(
                          FontAwesomeIcons.paintRoller,
                          size: settingIconSize,
                        ),
                        SpacerW(space: kPadding),
                        Text(
                          // TODO
                          'Something',
                          style: TextStyle(
                            fontSize: largeFontSize,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
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
