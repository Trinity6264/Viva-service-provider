import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viva_service_provider/shared/custom_colors.dart';
import 'package:viva_service_provider/shared/input_dec.dart';
import 'package:viva_service_provider/utils/map_textField.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: size.height * .12,
        backgroundColor: whiteColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Map',
              style: GoogleFonts.poppins(
                color: blackColor,
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Find directions to your destination',
              style: GoogleFonts.poppins(
                color: greyColor,
                fontSize: 17.0,
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: primaryColor,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: size.height * .36,
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: size.height * .04,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.close, color: greyColor),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 15),
                            width: size.width * .12,
                            height: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CircleAvatar(
                                  backgroundColor: primaryColor,
                                  maxRadius: 8.0,
                                  child: CircleAvatar(
                                    maxRadius: 3,
                                    backgroundColor: whiteColor,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 3,
                                    ),
                                    width: 2,
                                    color: primaryLightColor.withOpacity(.6),
                                  ),
                                ),
                                const Icon(
                                  Icons.pin_drop,
                                  color: primaryLightColor,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                MapTextField(
                                  dec: inputDec.copyWith(
                                    hintText: 'Choose starting point',
                                    hintStyle: GoogleFonts.poppins(
                                      color: greyLightColor,
                                    ),
                                    suffixIcon: const Icon(
                                      Icons.search,
                                      color: primaryLightColor,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      borderSide:
                                          const BorderSide(color: primaryColor),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      borderSide:
                                          const BorderSide(color: primaryColor),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                MapTextField(
                                  dec: inputDec.copyWith(
                                    hintText: 'Choose destination',
                                    hintStyle: GoogleFonts.poppins(
                                      color: greyLightColor,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      borderSide:
                                          const BorderSide(color: primaryColor),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      borderSide:
                                          const BorderSide(color: primaryColor),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: size.width * .12,
                            child: const Center(
                              child: Icon(
                                Icons.swap_vert,
                                color: primaryLightColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(color: greyColor),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          details(
                            text: 'Your Loaction',
                            icon: Icons.my_location,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              details(
                                text: 'Work',
                                icon: Icons.business_center_outlined,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Set location',
                                  style: GoogleFonts.poppins(
                                    color: primaryColor,
                                    fontSize: 13.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget details({required String text, required IconData icon}) {
    return Row(
      children: [
        Icon(icon, color: primaryLightColor),
        const SizedBox(width: 15),
        Text(
          text,
          textAlign: TextAlign.start,
          style: GoogleFonts.poppins(
            color: blackColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
