import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viva_service_provider/shared/custom_colors.dart';
import 'package:viva_service_provider/utils/laundry_card.dart';
import 'package:viva_service_provider/utils/moving_card.dart';

class Today extends StatelessWidget {
  const Today({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: _size.height * .04,
              child: const Center(
                child: Divider(
                  thickness: 1.5,
                ),
              ),
            ),
            const LaundryCard(),
            const MovingCard(),
          ],
        ),
      ),
    );
  }

  // user details

  Future showAllMeals(BuildContext context, Size _size) {
    return showDialog(
      context: context,
      useSafeArea: true,
      barrierDismissible: false,
      builder: (_) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: whiteColor,
        ),
        padding: const EdgeInsets.only(
          top: 15,
          left: 10,
          right: 10,
          bottom: 10,
        ),
        margin: const EdgeInsets.only(
          bottom: 20,
          top: 280,
          left: 20,
          right: 20,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today\'s Food',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: _size.width * .1,
                    height: _size.height * 0.035,
                    child: const Center(
                      child: Icon(Icons.close, color: blackColor),
                    ),
                    decoration: const BoxDecoration(
                      color: greyLightColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    height: _size.height * 0.1,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          maxRadius: 30,
                          backgroundColor: primaryColor,
                          backgroundImage: AssetImage(
                            'assets/images/meal.png',
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Bogolese Spice Salad',
                              style: GoogleFonts.poppins(
                                color: blackColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'A complets bowl of',
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.poppins(
                                color: greyColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
