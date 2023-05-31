import 'package:coffee_beanventory/constant/constants.dart';
import 'package:coffee_beanventory/global/global_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomTextField extends ConsumerStatefulWidget {
  const CustomTextField({
    required this.switchEditting,
    super.key,
  });

  final void Function() switchEditting;

  @override
  ConsumerState<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends ConsumerState<CustomTextField> {
  late final TextEditingController _textEditingController;
  late final FocusNode _focusNode;

  @override
  void initState() {
    _textEditingController = TextEditingController(
      text: ref.read(globalManagerProvider).coffeeName,
    );
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _textEditingController,
      cursorColor: Colors.white,
      cursorWidth: 1,
      focusNode: _focusNode,
      style: const TextStyle(
        color: Colors.white,
        fontSize: largeFontSize,
        fontWeight: FontWeight.w600,
      ),
      onEditingComplete: () {
        ref.read(globalManagerProvider.notifier).changeCoffeeName(_textEditingController.text);
        widget.switchEditting();
        _focusNode.unfocus();
      },
    );
  }
}
