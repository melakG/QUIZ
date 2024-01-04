import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CustomTextFiled extends StatelessWidget {
  final String hintText;
  final bool? isSecured;

  final TextCapitalization? textCapitalization;
  final TextInputType? textInputType;
  final void Function(String par)? onChange;
  final TextStyle? hintTextStyle;
  final String? Function(String? par) validator;
  final IconButton? suffixIcon;
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;
  final String errorResponse;

  const CustomTextFiled({
    Key? key,
    required this.hintText,
    this.isSecured = false,
    required this.onChange,
    required this.validator,
    this.suffixIcon,
    required this.controller,
    required this.formKey,
    required this.errorResponse,
    this.hintTextStyle,
    this.textInputType,
    this.textCapitalization,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppTheme.inputFieldPadding,
      child: SizedBox(
        width: 331,
        child: Form(
          key: formKey,
          child: TextFormField(
            keyboardType: textInputType,
            controller: controller,
            obscureText: isSecured!,
            textCapitalization: textCapitalization!,
            onChanged: onChange,
            validator: validator,
            decoration: InputDecoration(
                contentPadding: AppTheme.inputFieldHeight,
                border: OutlineInputBorder(
                  borderRadius: AppTheme.textFieldBorderRadius,
                ),
                hintText: hintText,
                hintStyle: hintTextStyle,
                suffixIcon: suffixIcon),
          ),
        ),
      ),
    );
  }
}

class CustomLabelText extends StatelessWidget {
  final String labelText;
  const CustomLabelText({super.key, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Text(
      labelText,
      style: AppTheme.labelTextStyle,
    );
  }
}
