import 'package:flutter/material.dart';

void customNavigation(BuildContext context, Widget child) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => child),
  );
}
