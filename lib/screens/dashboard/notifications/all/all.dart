import 'package:flutter/material.dart';

import '../../../../shared/custom_colors.dart';

class All extends StatelessWidget {
  const All({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 15),
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            height: _size.height * 0.13,
            decoration: BoxDecoration(
              color: lightColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text(
                    'Thu,12 May',
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Flexible(
                      child: Text(
                        'To have a feel of zero stress life you need to get started by selecting a service you prefer,',
                        style: TextStyle(
                          color: greyColor,
                        ),
                      ),
                    ),
                    Icon(Icons.check_circle, color: primaryColor)
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
