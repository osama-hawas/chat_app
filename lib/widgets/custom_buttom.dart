import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomButtom extends StatelessWidget {
  VoidCallback? onTap;
  String textButtom;
  CustomButtom({required this.textButtom, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: Center(
          child: Text(
            textButtom,
            style: TextStyle(
              color: Color(0xff2b475e),
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
