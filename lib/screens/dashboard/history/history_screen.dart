import 'package:flutter/material.dart';

import '../../../data/history_data.dart';
import '../../../shared/custom_colors.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: .0,
        backgroundColor: whiteColor,
        automaticallyImplyLeading: false,
        title: const Text(
          'History',
          style: TextStyle(
            color: blackColor,
            fontSize: 30.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: _size.height * 0.1,
              child: const Center(
                child: Divider(thickness: 1.5),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: historyData.map((e) {
                    List data = e['data'] as List;
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e['date'].toString(),
                            style: const TextStyle(
                              color: blackColor,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          ListView.builder(
                            itemCount: data.length,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: double.infinity,
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 5, 10, 15),
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                  height: _size.height * 0.2,
                                  decoration: BoxDecoration(
                                    color: data[index]['task'] == 'Moving'
                                        ? movingLightColor
                                        : data[index]['task'] == 'Cleaning'
                                            ? cleaningLightColor
                                            : laundryLightColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: Text(
                                              data[index]['task'],
                                              style: const TextStyle(
                                                color: primaryColor,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Image.asset(
                                            data[index]['task'] == 'Moving'
                                                ? 'assets/images/truck.png'
                                                : data[index]['task'] ==
                                                        'Cleaning'
                                                    ? 'assets/images/broom.png'
                                                    : 'assets/images/shirt.png',
                                            width: _size.width * .06,
                                          ),
                                        ],
                                      ),
                                      Text(
                                        data[index]['content'],
                                        style: const TextStyle(
                                          color: greyColor,
                                        ),
                                      ),
                                      SizedBox(
                                        width: double.infinity,
                                        height: _size.height * 0.04,
                                        child: const Center(
                                          child: Divider(
                                            thickness: 1.5,
                                            color: primaryLightColor,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: const [
                                          Icon(Icons.access_time,
                                              color: primaryColor),
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
                                ),
                              );
                            },
                          ),
                        ]);
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
