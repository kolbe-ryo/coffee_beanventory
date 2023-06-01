// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:coffee_beanventory/constant/constants.dart';
import 'package:coffee_beanventory/enum/color_index_enum.dart';
import 'package:coffee_beanventory/global/global_manager.dart';
import 'package:coffee_beanventory/ui/component/common_card.dart';
import 'package:coffee_beanventory/ui/component/custom_text_field.dart';
import 'package:coffee_beanventory/ui/pages/base_web_view.dart';
import 'package:coffee_beanventory/ui/view_model/color_controller_view_model.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> with SingleTickerProviderStateMixin {
  bool _isEditting = false;

  @override
  void initState() {
    ref.read(globalManagerProvider.notifier).colorControllerViewModel = ColorControllerViewModel(
      vsync: this,
      initialColorIndex: ref.read(globalManagerProvider).colorIndex,
    );
    super.initState();
  }

  void switchEditting() => setState(() => _isEditting = !_isEditting);

  @override
  Widget build(BuildContext context) {
    // final colorIndexEnum = ref.watch(globalManagerProvider.select((value) => value.colorIndex));
    final animationViewModel = ref.watch(globalManagerProvider.notifier).colorControllerViewModel;
    return AnimatedBuilder(
      animation: animationViewModel.animationController,
      builder: (context, _) {
        return Scaffold(
          backgroundColor: animationViewModel.animation.value,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: animationViewModel.animation.value,
            elevation: 0,
            title: const Text('Settings'),
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
                        onTap: () => Navigator.push(
                          context,
                          BaseWebView.route(
                            title: 'About Thid App',
                            url: baseAppUrl,
                          ),
                        ),
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
                        onTap: () => showLicensePage(context: context),
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
                  onTap: switchEditting,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: kPadding * 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.tag,
                          size: settingIconSize,
                        ),
                        const SpacerW(space: kPadding),
                        _isEditting
                            ? Expanded(
                                child: CustomTextField(
                                  switchEditting: switchEditting,
                                ),
                              )
                            : ConstrainedBox(
                                constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 2),
                                child: Text(
                                  ref.watch(globalManagerProvider.select((value) => value.coffeeName)),
                                  style: const TextStyle(
                                    fontSize: largeFontSize,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
                const SpacerH(),
                Row(
                  children: [
                    Expanded(
                      child: SquareCard(
                        onTap: () => ref.watch(globalManagerProvider.notifier).switchColor(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            FaIcon(
                              FontAwesomeIcons.paintRoller,
                              size: settingIconSize,
                            ),
                            SpacerH(space: kPadding),
                            Text(
                              'Color Theme',
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
                        onTap: () => Navigator.push(
                          context,
                          BaseWebView.route(
                            title: 'Privacy',
                            url: policyUrl,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            FaIcon(
                              FontAwesomeIcons.userShield,
                              size: settingIconSize,
                            ),
                            SpacerW(space: kPadding),
                            Text(
                              'Privacy',
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
      },
    );
  }
}
