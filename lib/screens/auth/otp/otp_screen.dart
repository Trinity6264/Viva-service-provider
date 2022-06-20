import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viva_service_provider/screens/dashboard/dashboard_screen.dart';
import 'package:viva_service_provider/shared/custom_colors.dart';

import '../../../shared/custom_navigation.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const Icon(
              Icons.arrow_back_ios_new,
              color: whiteColor,
            ),
            Text(
              'Back',
              style: GoogleFonts.poppins(
                fontSize: 18.0,
                color: whiteColor,
              ),
            ),
          ],
        ),
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/male.png',
              width: size.width * 0.3,
              height: size.height * 0.2,
              fit: BoxFit.cover,
            ),
            Text(
              'Hey Kwabena',
              style: GoogleFonts.poppins(
                color: whiteColor,
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: size.height * .06),
            Text(
              'Kindly type in the unique code that you received via text to activate your account',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                wordSpacing: 2.0,
                color: whiteColor,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: size.height * .04),
            Container(
              width: double.infinity,
              height: size.height * .09,
              color: laundryColor,
            ),
            SizedBox(height: size.height * .03),
            TextButton.icon(
              onPressed: () {
                customNavigation(context, const DashBoard());
              },
              label: Text(
                'Resend Code',
                style: GoogleFonts.poppins(
                  color: whiteColor,
                ),
              ),
              icon: const Icon(Icons.refresh, color: whiteColor),
            ),
          ],
        ),
      ),
    );
  }
}
