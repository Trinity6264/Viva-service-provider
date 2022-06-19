import 'package:flutter/material.dart';

import 'package:viva_service_provider/shared/custom_colors.dart';
import 'package:viva_service_provider/shared/emojis.dart';

class CustomSelectedGender extends StatefulWidget {
  final ValueChanged<String> onValueChanged;
  final String selectedEmoji;
  const CustomSelectedGender({
    Key? key,
    required this.onValueChanged,
    this.selectedEmoji = 'assets/emojis/female1.png',
  }) : super(key: key);

  @override
  State<CustomSelectedGender> createState() => _CustomSelectedGenderState();
}

class _CustomSelectedGenderState extends State<CustomSelectedGender>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  bool isExpanded = false;

  void onChangedExpanded() {
    setState(() {
      isExpanded = !isExpanded;
    });
    isExpanded ? _controller.forward() : _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return AnimatedContainer(
      margin: const EdgeInsets.only(top: 15),
      duration: const Duration(milliseconds: 400),
      width: _size.width * 1,
      height: isExpanded ? _size.height * 0.4 : _size.height * 0.11,
      child: GridView.builder(
        itemCount: listOfEmojis.length,
        physics: !isExpanded
            ? const NeverScrollableScrollPhysics()
            : const AlwaysScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemBuilder: (context, index) {
          final emoji = listOfEmojis[index];
          if (index == 3) {
            return GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: greyColor,
                  ),
                ),
                margin: const EdgeInsets.all(4),
                width: _size.width * 0.7,
                height: _size.height * .08,
                child: Center(
                  child: IconButton(
                    onPressed: onChangedExpanded,
                    icon: Icon(
                      !isExpanded
                          ? Icons.arrow_forward_ios_sharp
                          : Icons.keyboard_arrow_down,
                      color: primaryColor,
                      size: 30,
                    ),
                  ),
                ),
              ),
            );
          }
          return GestureDetector(
            onTap: () {
              widget.onValueChanged(emoji);
            },
            child: Container(
              margin: const EdgeInsets.all(4),
              width: _size.width * 0.7,
              height: _size.height * .08,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color:
                      widget.selectedEmoji == emoji ? primaryColor : greyColor,
                ),
              ),
              child: Center(
                child: Image.asset(
                  width: 150,
                  emoji,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
