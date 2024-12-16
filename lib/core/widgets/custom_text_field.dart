import 'package:flutter/material.dart';
import 'package:store_app/core/functions/build_border.dart';
import 'package:store_app/core/utilities/app_styles.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.icon,
    this.textInputType = TextInputType.text,
    this.onFieldSubmitted,
  });
  final String hintText;
  final IconData? icon;
  final TextInputType textInputType;
  final void Function(String)? onFieldSubmitted;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) {
          return 'Field is required.';
        } else {
          return null;
        }
      },
      style: AppStyles.regular18,
      onFieldSubmitted: widget.onFieldSubmitted,
      obscureText: (widget.hintText != 'Password') ? false : obscureText,
      keyboardType: widget.textInputType,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: AppStyles.regular18.copyWith(color: Colors.grey),
        suffixIcon: (widget.hintText == 'Password')
            ? Padding(
                padding: const EdgeInsets.only(right: 20),
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        obscureText ? obscureText = false : obscureText = true;
                      });
                    },
                    icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                      size: 32,
                      color: Colors.black,
                    )),
              )
            : Padding(
                padding: const EdgeInsets.only(right: 27),
                child: Icon(
                  widget.icon,
                  size: 32,
                  color: Colors.black,
                ),
              ),
        contentPadding: const EdgeInsets.all(16),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }
}
