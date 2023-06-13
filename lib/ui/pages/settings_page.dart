// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:coffee_beanventory/constant/constants.dart';
import 'package:coffee_beanventory/global/global_manager.dart';
import 'package:coffee_beanventory/ui/component/app_loading.dart';
import 'package:coffee_beanventory/ui/component/common_card.dart';
import 'package:coffee_beanventory/ui/component/custom_text_field.dart';
import 'package:coffee_beanventory/ui/component/show_dialog.dart';
import 'package:coffee_beanventory/ui/pages/base_web_view.dart';
import 'package:coffee_beanventory/ui/view_model/color_controller_view_model.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    ref.read(globalManagerProvider.notifier).colorControllerViewModel = ColorControllerViewModel(
      vsync: this,
      initialColorIndex: ref.read(globalManagerProvider).colorIndex,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                const SpacerH(),
                Row(
                  children: const [
                    _AboutThisApp(),
                    SpacerW(),
                    _Licenses(),
                  ],
                ),
                const SpacerH(),
                const _NameLabel(),
                const SpacerH(),
                Row(
                  children: const [
                    _ColorTheme(),
                    SpacerW(),
                    _MaximumVolume(),
                  ],
                ),
                const SpacerH(),
                Row(
                  children: const [
                    _DeleteSettings(),
                    SpacerW(),
                    _PrivacyPage(),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _AboutThisApp extends StatelessWidget {
  const _AboutThisApp();

  @override
  Widget build(BuildContext context) {
    return Flexible(
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
    );
  }
}

class _Licenses extends StatelessWidget {
  const _Licenses();

  @override
  Widget build(BuildContext context) {
    return Flexible(
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
    );
  }
}

class _NameLabel extends ConsumerStatefulWidget {
  const _NameLabel();

  @override
  ConsumerState<_NameLabel> createState() => _NameLabelState();
}

class _NameLabelState extends ConsumerState<_NameLabel> {
  bool _isEditting = false;

  void switchEditting() => setState(() => _isEditting = !_isEditting);

  @override
  Widget build(BuildContext context) {
    return CommonCard(
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
            Visibility(
              visible: _isEditting,
              replacement: ConstrainedBox(
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
              child: Expanded(
                child: CustomTextField(
                  switchEditting: switchEditting,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ColorTheme extends ConsumerWidget {
  const _ColorTheme();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
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
    );
  }
}

class _MaximumVolume extends ConsumerWidget {
  const _MaximumVolume();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storageSize = ref.watch(globalManagerProvider.select((value) => value.beanStockMax));
    final globalManager = ref.watch(globalManagerProvider.notifier);
    final isMax = ref.watch(globalManagerProvider.select((value) => value.beanStockMax == maxStorage));
    final isMin = ref.watch(globalManagerProvider.select((value) => value.beanStockMax == minStorage));
    return Expanded(
      child: SquareCard(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FaIcon(
              FontAwesomeIcons.fillDrip,
              size: settingIconSize,
            ),
            const SpacerH(space: kPadding),
            const Text(
              'Volume',
              style: TextStyle(
                fontSize: largeFontSize,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  color: isMin ? Colors.transparent : null,
                  icon: const FaIcon(
                    FontAwesomeIcons.arrowLeft,
                    size: settingMinIconSize,
                  ),
                  // TODO 大きい数字から小さい数字にする際は50ずづ削除する処理を入れる
                  onPressed: () => globalManager.changeVolume(isCountUp: false),
                ),
                Text(
                  '$storageSize',
                  style: const TextStyle(
                    fontSize: largeFontSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  color: isMax ? Colors.transparent : null,
                  icon: const FaIcon(
                    FontAwesomeIcons.arrowRight,
                    size: settingMinIconSize,
                  ),
                  onPressed: () => globalManager.changeVolume(isCountUp: true),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DeleteSettings extends ConsumerWidget {
  const _DeleteSettings();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Flexible(
      child: CommonCard(
        onTap: () async {
          final navigator = Navigator.of(context);
          final result = await baseShowDialog(context: context, title: 'Are you sure delete?');
          if (result ?? false) {
            navigator.pop();
            await showLoadingModal(future: ref.watch(globalManagerProvider.notifier).deleteAllSettins());
          }
        },
        child: const FaIcon(
          FontAwesomeIcons.trash,
          size: settingIconSize,
        ),
      ),
    );
  }
}

class _PrivacyPage extends StatelessWidget {
  const _PrivacyPage();

  @override
  Widget build(BuildContext context) {
    return Flexible(
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
    );
  }
}
