import 'package:coffee_beanventory/ui/top_page/top_page.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const RootPage());
}

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Income life',
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          // color: AppColors.dark,
          centerTitle: true,
          elevation: 0,
        ),
      ),
      home: const TopPage(),
      // navigatorKey: GetIt.I<GlobalKey<NavigatorState>>(),
      // localizationsDelegates: const [
      //   S.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
    );
  }
}
