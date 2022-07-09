import 'package:flutter/material.dart';
import '../value_manger.dart';

class MyForm extends StatelessWidget {
  final String? label;
  final String? hint;

  final bool isPassword;
  final TextInputType type;
  final VoidCallback? suffixIconPressed;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final FormFieldSetter<String>? onSaved;
  final GestureTapCallback? onTap;
  final TextEditingController? controller;
  final String validator;

  const MyForm({
    Key? key,
    this.label,
    this.isPassword = false,
    required this.type,
    this.suffixIcon,
    this.hint,
    this.suffixIconPressed,
    this.prefixIcon,
    this.onSaved,
    this.onTap,
    this.controller,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        hintText: hint,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: AppSpacing.ap1_5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(AppSpacing.ap8),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: AppSpacing.ap1_5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(AppSpacing.ap8),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: AppSpacing.ap1_5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(AppSpacing.ap8),
          ),
        ),
        prefixIcon: Icon(prefixIcon),
        suffixIcon: IconButton(
          icon: Icon(
            suffixIcon,
            color: Colors.black,
          ),
          onPressed: suffixIconPressed,
        ),
      ),
      obscureText: isPassword,
      validator: (String? val) {
        if (val!.isEmpty) {
          return validator;
        }
        return null;
      },
      onSaved: onSaved,
      onTap: onTap,
    );
  }
}
