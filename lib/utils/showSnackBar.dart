import 'package:Nkipay/utils/constants.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Text(
          text,
        ),
      ),
    ),
  );
}
