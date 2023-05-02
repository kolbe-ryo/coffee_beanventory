import 'package:coffee_beanventory/ui/settings_page/settings_page.dart';
import 'package:coffee_beanventory/ui/top_page/top_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

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
