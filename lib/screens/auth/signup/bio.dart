import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viva_service_provider/screens/auth/otp/otp_screen.dart';
import 'package:viva_service_provider/shared/custom_button.dart';
import 'package:viva_service_provider/shared/custom_colors.dart';
import 'package:viva_service_provider/shared/custom_navigation.dart';

import 'package:viva_service_provider/shared/custom_text_field.dart';
import 'package:viva_service_provider/shared/input_dec.dart';

class BioScreen extends StatelessWidget {
  const BioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: _size.height * .16,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        flexibleSpace: Container(
          height: _size.height * .5,
          decoration: const BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/images/bg.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  color: primaryColor.withOpacity(.6),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: _size.height * .08, left: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Row(
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
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Confirm Bio',
                    style: GoogleFonts.roboto(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: _size.height * .01),
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 15),
                  width: _size.width * 0.38,
                  height: _size.height * 0.18,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Center(
                    child: Image.asset(
                      width: 150,
                      'assets/images/male.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: _size.height * .06),
              customText(size: _size, key: 'Name:', value: 'Kwabena Awuni'),
              customText(
                  size: _size, key: 'Contact:', value: '+233 67 167 7168'),
              customText(
                  size: _size, key: 'Email:', value: 'amail@mailservice.com'),
              customText(size: _size, key: 'Sex:', value: 'M'),
              customText(size: _size, key: 'ID NO:', value: 'GHA-00185946-7'),
              customText(size: _size, key: 'Service:', value: 'Cleaning'),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Edit your profile if this is not you.',
                    style: GoogleFonts.poppins(
                      color: primaryColor,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Confirm your bio by tapping on Get Started',
                  style: GoogleFonts.poppins(
                    color: greyColor,
                    fontSize: 16.0,
                  ),
                ),
              ),
              SizedBox(height: _size.height * .05),
              Center(
                child: CustomButton(
                  width: _size.width * 0.4,
                  height: _size.height * .06,
                  onPressed: () {
                    customNavigation(context, const OtpScreen());
                  },
                  text: 'Get Started',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customText({
    required Size size,
    required String key,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: size.width * .33,
            child: Text(
              key,
              style: const TextStyle(
                color: blackColor,
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
              ),
            ),
          ),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.start,
              style: const TextStyle(
                color: greyColor,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
