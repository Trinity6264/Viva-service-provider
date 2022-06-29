import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:viva_service_provider/shared/custom_colors.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  final InputDecoration inputDecoration;
  final Color textColor;
  const CustomTextField({
    Key? key,
    required this.title,
    this.textColor = primaryColor,
    required this.inputDecoration,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 18),
          child: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 18.0,
              color: textColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: _size.height * .02),
        SizedBox(
          width: double.infinity,
          height: _size.height * .07,
          child: TextField(
            controller: controller,
            decoration: inputDecoration,
          ),
        ),
      ],
    );
  }
}
