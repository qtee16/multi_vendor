import 'package:flutter/material.dart';

showMySnackBar(BuildContext context, String title) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(title),
      backgroundColor: Colors.cyan,
    ),
  );
}
