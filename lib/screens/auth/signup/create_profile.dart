import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viva_service_provider/screens/auth/signup/final_details.dart';
import 'package:viva_service_provider/shared/custom_button.dart';
import 'package:viva_service_provider/shared/custom_colors.dart';
import 'package:viva_service_provider/shared/custom_navigation.dart';
import 'package:viva_service_provider/shared/custom_selected_gender.dart';
import 'package:viva_service_provider/shared/custom_text_field.dart';
import 'package:viva_service_provider/shared/input_dec.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({Key? key}) : super(key: key);

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  bool isMale = true;

  void onChangedMale(bool val) {
    setState(() {
      isMale = val;
    });
  }

  bool isExpanded = false;
  void onChangedExpanded() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  String selectedEmoji = 'assets/emojis/female1.png';

  void onChangedEmoji(String val) {
    setState(() {
      selectedEmoji = val;
    });
  }

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
                    'Create your profile',
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
              SizedBox(height: _size.height * 0.02),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                height: _size.height * .05,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => onChangedMale(true),
                      child: Container(
                        width: _size.width * 0.4,
                        height: _size.height * .05,
                        decoration: BoxDecoration(
                          color: isMale ? primaryColor : whiteColor,
                          border: Border.all(
                            color: isMale ? primaryColor : greyColor,
                          ),
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        child: Center(
                          child: Text(
                            'Male',
                            style: GoogleFonts.poppins(
                              color: isMale ? whiteColor : primaryColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () => onChangedMale(false),
                      child: Container(
                        width: _size.width * 0.4,
                        height: _size.height * .05,
                        decoration: BoxDecoration(
                          color: !isMale ? primaryColor : whiteColor,
                          border: Border.all(
                            color: !isMale ? primaryColor : greyColor,
                          ),
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        child: Center(
                          child: Text(
                            'female',
                            style: GoogleFonts.poppins(
                              color: !isMale ? whiteColor : primaryColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
                      selectedEmoji,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              CustomSelectedGender(
                selectedEmoji: selectedEmoji,
                onValueChanged: (val) {
                  onChangedEmoji(val);
                },
              ),
              SizedBox(height: _size.height * 0.05),
              CustomTextField(
                title: 'User Name',
                textColor: greyColor,
                inputDecoration: inputDec,
              ),
              SizedBox(height: _size.height * 0.03),
              CustomTextField(
                title: 'Contact',
                textColor: greyColor,
                inputDecoration: inputDec,
              ),
              SizedBox(height: _size.height * 0.06),
              Center(
                child: CustomButton(
                  width: _size.width * 0.4,
                  height: _size.height * .06,
                  onPressed: () {
                    customNavigation(
                      context,
                      const FinalDetailsScreen(),
                    );
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
