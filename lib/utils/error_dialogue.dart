import 'package:flutter/material.dart';

void showErrorDialogue(String title, String text, BuildContext context) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(
        title,
      ),
      content: Text(
        text,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(ctx).pop();
          },
          child: const Text(
            'OK',
          ),
        ),
      ],
    ),
  );
}
