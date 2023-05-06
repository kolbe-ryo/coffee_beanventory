// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:coffee_beanventory/generated/l10n.dart';
import 'package:coffee_beanventory/router/router.dart';
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
    return MaterialApp.router(
      routerConfig: router,
      title: 'Beanventory',
      theme: ThemeData.dark(),
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
