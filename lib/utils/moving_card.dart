import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viva_service_provider/shared/custom_colors.dart';

import 'client_details.dart';

class MovingCard extends StatelessWidget {
  const MovingCard({Key? key}) : super(key: key);

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
            margin: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text(
                  'Moving',
                  style: GoogleFonts.poppins(
                    color: primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 12),
                Image.asset(
                  'assets/images/truck.png',
                  width: _size.width * .07,
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
            margin: const EdgeInsets.only(left: 5),
            height: _size.height * .15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClientDetails(
                  size: _size,
                  index: 0,
                  color: primaryColor,
                  text: 'Naa Mansa',
                  fontSize: 18.0,
                ),
                ClientDetails(
                  size: _size,
                  index: 1,
                  icon: Icons.location_on_outlined,
                  text: 'Asylum Down to Dodowa',
                ),
                ClientDetails(
                  size: _size,
                  index: 1,
                  icon: Icons.access_time,
                  text: '10:00am - 12:00pm',
                ),
                ClientDetails(
                  size: _size,
                  index: 1,
                  icon: Icons.monetization_on_outlined,
                  text: 'GHc 128.00',
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
                  color: primaryColor.withOpacity(.2),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Text(
                    'Move to pick u',
                    style: GoogleFonts.poppins(
                      color: primaryColor,
                      fontSize: 18.0,
                      wordSpacing: 2.0,
                      fontWeight: FontWeight.w600,
                    ),
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
