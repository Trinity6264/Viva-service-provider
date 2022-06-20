import 'package:flutter/material.dart';


import '../../../../shared/animated_calender.dart';
import '../../../../shared/custom_colors.dart';

class Upcoming extends StatelessWidget {
  const Upcoming({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteColor,
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: _size.height * 0.1,
            child: AnimatedHorizontalCalendar(
              onChanged: (val) {},
              initialDate: DateTime.now(),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: _size.height * 0.01,
            child: const Center(
              child: Divider(
                thickness: 1.5,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 15),
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  height: _size.height * 0.2,
                  decoration: BoxDecoration(
                    color: lightColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Laundry',
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                              ),
                            ),
                            Icon(Icons.message_outlined, color: primaryColor),
                          ],
                        ),
                      ),
                      const Text(
                        'To have a feel of zero stress life you need to get started by selecting a service you prefer,',
                        style: TextStyle(
                          color: greyColor,
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: _size.height * 0.02,
                        child: const Center(
                          child: Divider(
                            thickness: 1.5,
                            color: primaryColor,
                          ),
                        ),
                      ),
                      Row(
                        children: const [
                          Icon(Icons.access_time, color: primaryColor),
                          SizedBox(width: 10),
                          Text(
                            '10:30am - 12:00pm',
                            style: TextStyle(
                              color: greyColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
