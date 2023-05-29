import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Flutter imports:
import 'package:flutter/cupertino.dart';

class TextInputModal extends ConsumerWidget {
  const TextInputModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}

// TODO: モーダルの変更
Future<bool?> baseShowDialog({
  required BuildContext context,
  required String title,
  GlobalKey<FormState>? formKey,
  Widget? widget,
  bool isSimpleDialog = false,
  bool isOnlyClose = false,
}) async {
  final isConfirm = await showDialog<bool>(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Text(title),
        content: widget,
        actions: [
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () => Navigator.pop(context, false),
            child: Text('test'),
          ),
        ],
      );
    },
  );
  return isConfirm;
}
