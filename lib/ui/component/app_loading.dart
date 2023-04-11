// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:get_it/get_it.dart';

Future<bool?> showLoadingModal({
  required Future<bool> future,
}) {
  return showDialog<bool>(
    context: GetIt.I<GlobalKey<NavigatorState>>().currentContext!,
    builder: (_) {
      return FutureBuilder(
        future: future,
        builder: (context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const CupertinoActivityIndicator(radius: 24);
          }
          if (snapshot.hasData && (snapshot.data ?? false)) {
            Navigator.pop(context, true);
          } else {
            Navigator.pop(context, false);
          }
          return const SizedBox.shrink();
        },
      );
    },
  );
}
