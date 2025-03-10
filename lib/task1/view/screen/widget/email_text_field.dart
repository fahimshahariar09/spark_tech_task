import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key, required this.emailController});

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        enabledBorder: OutlineInputBorder(),
        labelText: 'E-mail',
      ),
      validator: (value) {
        if (value == "" || value == null) {
          return "email can't be empty";
        } else if (!(value.toString().contains(".") ||
            value.toString().contains("@"))) {
          return "Please enter valid email";
        }
        return null;
      },
    );
  }
}
