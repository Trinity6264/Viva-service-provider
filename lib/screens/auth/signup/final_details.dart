import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viva_service_provider/screens/auth/signup/bio.dart';
import 'package:viva_service_provider/shared/custom_button.dart';
import 'package:viva_service_provider/shared/custom_colors.dart';
import 'package:viva_service_provider/shared/custom_navigation.dart';
import 'package:viva_service_provider/shared/custom_selected_gender.dart';
import 'package:viva_service_provider/shared/custom_text_field.dart';
import 'package:viva_service_provider/shared/input_dec.dart';

class FinalDetailsScreen extends StatefulWidget {
  const FinalDetailsScreen({Key? key}) : super(key: key);

  @override
  State<FinalDetailsScreen> createState() => FinalDetailsScreenState();
}

class FinalDetailsScreenState extends State<FinalDetailsScreen> {
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

  List<String> services = ['Food', 'Cleaning', 'Laundry', 'Moving'];

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: _size.height * .2,
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
                    'Add final details',
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
              SizedBox(height: _size.height * 0.08),
              Container(
                margin: const EdgeInsets.only(left: 18),
                child: Text(
                  'Select a service',
                  style: GoogleFonts.poppins(
                    fontSize: 18.0,
                    color: greyColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: primaryColor),
                ),
                height: _size.height * .07,
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  elevation: 0,
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: primaryColor,
                  ),
                  items: services
                      .map(
                        (e) => DropdownMenuItem<String>(
                          value: e,
                          child: Text(e),
                        ),
                      )
                      .toList(),
                  onChanged: (val) {},
                ),
              ),
              SizedBox(height: _size.height * 0.03),
              CustomTextField(
                title: 'National ID Number',
                textColor: greyColor,
                inputDecoration: inputDec,
              ),
              SizedBox(height: _size.height * 0.3),
              Center(
                child: CustomButton(
                  width: _size.width * 0.4,
                  height: _size.height * .06,
                  onPressed: () {
                    customNavigation(context, const BioScreen());
                  },
                  text: 'Finish',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
