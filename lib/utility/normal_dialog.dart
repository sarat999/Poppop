import 'package:flutter/material.dart';

Future<void> normalDialog(
    BuildContext context, String title, String message) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
      );
    },
  );
}
