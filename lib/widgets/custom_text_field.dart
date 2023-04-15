import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextField extends StatelessWidget {
  String? hintText;
  Function(String)? onChanged;
  bool obscureState;
  CustomTextField({required this.hintText, required this.onChanged,required this.obscureState});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureState,
      validator: (data) {
        if (data!.isEmpty) {
          return 'Field is empty';
        }
      },
      style: TextStyle(color: Colors.white),
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.white,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
