// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

// Project imports:
import 'package:coffee_beanventory/generated/l10n.dart';
import 'package:coffee_beanventory/ui/top_page/top_page.dart';
import 'package:coffee_beanventory/util/di.dart';

void main() {
  setUpDI();
  runApp(
    const ProviderScope(
      child: RootPage(),
    ),
  );
}

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Income life',
      theme: ThemeData.dark(),
      home: const TopPage(),
      navigatorKey: GetIt.I<GlobalKey<NavigatorState>>(),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
    );
  }
}
