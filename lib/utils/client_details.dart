import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viva_service_provider/shared/custom_colors.dart';

class ClientDetails extends StatelessWidget {
  final Size size;
  final int index;
  Color? color;
  IconData? icon;
  double? fontSize;
  final String text;
   ClientDetails({
    Key? key,
    required this.size,
    required this.index,
    this.color,
    this.icon,
    this.fontSize,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        index == 0
            ? Image.asset(
                'assets/images/female.png',
                width: size.width * 0.07,
              )
            : Icon(icon, color: movingColor),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            text,
            textAlign: TextAlign.right,
            style: GoogleFonts.poppins(
              color: color ?? greyColor,
              fontWeight: FontWeight.w500,
              fontSize: fontSize ?? 16.0,
            ),
          ),
        ),
      ],
    );
  }
}
