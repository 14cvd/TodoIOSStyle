import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.controller,
      this.suffix = const SizedBox.shrink(),
      required this.hintText});
  final TextEditingController controller;
  Widget suffix;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      placeholder: hintText,
      suffix: suffix,
      controller: controller,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: CupertinoColors.lightBackgroundGray,
          ),
        ),
      ),
    );
  }
}
