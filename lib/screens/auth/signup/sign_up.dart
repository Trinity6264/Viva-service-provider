import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viva_service_provider/screens/auth/signup/create_profile.dart';
import 'package:viva_service_provider/shared/custom_button.dart';
import 'package:viva_service_provider/shared/custom_colors.dart';
import 'package:viva_service_provider/shared/custom_navigation.dart';
import 'package:viva_service_provider/shared/custom_text_field.dart';
import 'package:viva_service_provider/shared/input_dec.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

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
                    'Create your Viva account',
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
              SizedBox(height: _size.height * 0.04),
              CustomTextField(
                title: 'Full Name',
                inputDecoration: inputDec,
              ),
              SizedBox(height: _size.height * 0.03),
              CustomTextField(
                title: 'Email',
                inputDecoration: inputDec,
              ),
              SizedBox(height: _size.height * 0.03),
              CustomTextField(
                title: 'Password',
                inputDecoration: inputDec.copyWith(
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.visibility_off_outlined,
                      color: primaryLightColor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: _size.height * 0.03),
              CustomTextField(
                title: 'Confirm Password',
                inputDecoration: inputDec.copyWith(
                    suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.visibility_outlined,
                    color: primaryLightColor,
                  ),
                )),
              ),
              SizedBox(height: _size.height * 0.06),
              Center(
                child: CustomButton(
                  width: _size.width * 0.4,
                  height: _size.height * .06,
                  onPressed: () {
                    customNavigation(context, const CreateProfileScreen());
                  },
                  text: 'Next',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
