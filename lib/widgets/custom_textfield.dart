import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield(
      {super.key,
      this.validator,
      required this.lable,
      this.value,
      this.textInputAction,
      this.onChanged});

  final String? Function(String?)? validator;
  final Function(String?)? onChanged;
  final String lable;
  final String? value;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: UniqueKey(),
      initialValue: value,
      textInputAction: textInputAction,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: lable,
        labelStyle: Theme.of(context).textTheme.bodySmall,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
      validator: validator,
      onChanged: onChanged,
    );
  }
}
