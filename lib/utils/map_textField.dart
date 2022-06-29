import 'package:flutter/material.dart';

class MapTextField extends StatelessWidget {
  final InputDecoration dec;
  const MapTextField({
    Key? key,
    required this.dec,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextField(
        decoration: dec,
      ),
    );
  }
}
