import 'package:flutter/material.dart';

num ceil(double a, double b) {
  return (a / b).ceil();
}

Future displayBottomSheet(BuildContext context, Widget child) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: child,
      );
    },
  );
}
