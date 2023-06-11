import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final IconData iconData;
  final String hintText;
  final TextInputType? textInputType;
  final bool obscureText;
  final void Function()? onPressedEye;
  final TextEditingController? controller;

  const CustomFormField({
    Key? key,
    required this.iconData,
    required this.hintText,
    this.textInputType,
    this.obscureText = true,
    this.onPressedEye,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Email
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(
              iconData,
              color: Colors.black87,
            ),
            suffixIcon: hintText.toLowerCase() == 'password'
                ? IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off,
                      color: Colors.black87,
                    ),
                    onPressed: onPressedEye,
                  )
                : null,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black87,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
          keyboardType: textInputType ?? TextInputType.text,
        ),
      ],
    );
  }
}
