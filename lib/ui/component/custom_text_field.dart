import 'package:coffee_beanventory/global/global_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomTextField extends ConsumerStatefulWidget {
  const CustomTextField({super.key});

  @override
  ConsumerState<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends ConsumerState<CustomTextField> {
  late final TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController(
      text: ref.read(globalManagerProvider).coffeeName,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _textEditingController,
      cursorColor: Colors.white,
      cursorWidth: 1,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(kBorder),
        //   borderSide: const BorderSide(color: AppColors.lightGrey60),
        // ),
        // prefixIcon: const Icon(
        //   Icons.search,
        //   color: Colors.tealAccent,
        // ),
      ),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
      onChanged: (text) => _textEditingController.text = text,
    );
  }
}
