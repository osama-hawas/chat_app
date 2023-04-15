import 'package:flutter/material.dart';

void scaffoldmessege(BuildContext context, String messege) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(messege),
      ),
    );
  }