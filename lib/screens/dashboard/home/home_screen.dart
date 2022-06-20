import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:viva_service_provider/screens/dashboard/home/today/today.dart';
import 'package:viva_service_provider/screens/dashboard/home/upcoming/upcoming.dart';

import '../../../shared/custom_colors.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback onTap;
  const HomeScreen({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isToday = true;

  void onChangedToday() {
    setState(() {
      isToday = true;
    });
  }

  void onChangedUpcoming() {
    setState(() {
      isToday = false;
    });
  }

  Widget customListTile({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Icon(icon, color: primaryLightColor, size: 26),
        title: Text(
          title,
          style: GoogleFonts.poppins(
            color: primaryColor,
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),
        ),
        onTap: onTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: whiteColor,
          systemNavigationBarColor: blackColor,
        ),
        backgroundColor: whiteColor,
        leading: GestureDetector(
          onTap: widget.onTap,
          child: Container(
            width: _size.width * 0.1,
            child: Center(
              child: Image.asset('assets/images/menu.png'),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 12.0),
            height: double.infinity,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: primaryLightColor,
              ),
            ),
          ),
        ),
        iconTheme: const IconThemeData(color: primaryColor),
        actions: [
          Container(
            width: _size.width * 0.1,
            margin: const EdgeInsets.symmetric(horizontal: 12.0),
            height: double.infinity,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: primaryColor,
            ),
          ),
        ],
        title: const Text(
          'Good Afternoon, Naa Mansa',
          style: TextStyle(
            color: blackColor,
            fontSize: 15.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: .0,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(5, 20, 5, 5),
            height: _size.height * 0.062,
            decoration: BoxDecoration(
              color: greyLightColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Flexible(
                  child: GestureDetector(
                    onTap: onChangedToday,
                    child: AnimatedContainer(
                      curve: Curves.easeIn,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 5,
                      ),
                      height: _size.height * 0.065,
                      width: _size.width / 2,
                      decoration: BoxDecoration(
                        color: isToday ? lightColor : null,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      duration: const Duration(milliseconds: 300),
                      child: const Center(
                        child: Text(
                          'Today',
                          style: TextStyle(
                            color: blackColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: GestureDetector(
                    onTap: onChangedUpcoming,
                    child: AnimatedContainer(
                      curve: Curves.easeIn,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 5,
                      ),
                      height: _size.height * 0.065,
                      width: _size.width / 2,
                      decoration: BoxDecoration(
                        color: !isToday ? lightColor : null,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      duration: const Duration(milliseconds: 300),
                      child: const Center(
                        child: Text(
                          'Upcoming',
                          style: TextStyle(
                            color: blackColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          isToday
              ? const Expanded(child: Today())
              : const Expanded(child: Upcoming()),
        ],
      ),
    );
  }
}
