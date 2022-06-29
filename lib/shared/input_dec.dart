import 'package:flutter/material.dart';

import 'custom_colors.dart';

InputDecoration inputDec = InputDecoration(
  border: InputBorder.none,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(25),
    borderSide: const BorderSide(
      color: primaryColor,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(25),
    borderSide: const BorderSide(
      color: primaryColor,
    ),
  ),
);
