// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:coffee_beanventory/ui/pages/settings_page.dart';
import 'package:coffee_beanventory/ui/pages/top_page.dart';

// Project imports:

final router = GoRouter(
  navigatorKey: GetIt.I<GlobalKey<NavigatorState>>(),
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const TopPage(),
      routes: [
        GoRoute(
          path: 'settings',
          pageBuilder: (context, state) => const MaterialPage(
            fullscreenDialog: true,
            child: SettingsPage(),
          ),
        ),
      ],
    ),
  ],
);
