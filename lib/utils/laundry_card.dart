import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viva_service_provider/shared/custom_colors.dart';

import 'client_details.dart';

class LaundryCard extends StatelessWidget {
  const LaundryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(10.0),
      width: double.infinity,
      height: _size.height * .4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: movingColor.withOpacity(.3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: _size.height * .05,
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'New Laundry Alert',
                      style: GoogleFonts.poppins(
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Image.asset(
                      'assets/images/shirt.png',
                      width: _size.width * .07,
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.close, color: greyColor),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: _size.height * .11,
            color: foodColor,
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(left: 5, bottom: 5),
            height: _size.height * .15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClientDetails(
                  size: _size,
                  index: 0,
                  color: primaryColor,
                  text: 'Yaa Frema Ogyiri',
                  fontSize: 18.0,
                ),
                ClientDetails(
                  size: _size,
                  index: 1,
                  icon: Icons.location_on_outlined,
                  text: 'Mataheko',
                ),
                ClientDetails(
                  size: _size,
                  index: 1,
                  icon: Icons.access_time,
                  text: '10:00am - 12:00pm',
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 7),
                width: _size.width * 0.45,
                decoration: BoxDecoration(
                  color: foodLightColor,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Accept',
                        style: GoogleFonts.poppins(
                          color: primaryColor,
                          fontSize: 18.0,
                          wordSpacing: 2.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Icon(Icons.check, color: primaryColor, size: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
