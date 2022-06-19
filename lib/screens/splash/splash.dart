import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viva_service_provider/screens/auth/login/login.dart';
import 'package:viva_service_provider/screens/auth/signup/sign_up.dart';
import 'package:viva_service_provider/shared/custom_button.dart';
import 'package:viva_service_provider/shared/custom_colors.dart';
import 'package:viva_service_provider/shared/custom_navigation.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 80,
              left: 10,
              right: 10,
              bottom: 100,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome\nViva Magician',
                  style: GoogleFonts.roboto(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    color: primaryColor,
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: _size.width * 0.7,
                    height: _size.height * 0.17,
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          width: double.infinity,
                          height: _size.height * 0.07,
                          onPressed: () {
                            customNavigation(
                              context,
                              const SignUpScreen(),
                            );
                          },
                          text: 'I\'m new here',
                        ),
                        CustomButton(
                          width: double.infinity,
                          height: _size.height * 0.07,
                          onPressed: () {
                            customNavigation(
                              context,
                              const LoginScreen(),
                            );
                          },
                          text: 'I\'m an existing member',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
