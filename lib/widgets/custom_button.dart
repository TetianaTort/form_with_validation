import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.titleWidget,
    required this.onPressed,
  });

  final Widget titleWidget;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: titleWidget,
    );
  }
}
