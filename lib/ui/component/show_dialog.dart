// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<bool?> baseShowDialog({
  required BuildContext context,
  required String title,
}) async {
  return showDialog<bool>(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Text(title),
        actions: [
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          CupertinoDialogAction(
            // isDestructiveAction: true,
            onPressed: () => Navigator.pop(context, true),
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
