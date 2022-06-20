import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viva_service_provider/screens/dashboard/history/history_screen.dart';
import 'package:viva_service_provider/screens/dashboard/home/home_screen.dart';
import 'package:viva_service_provider/screens/dashboard/map/map_screen.dart';
import 'package:viva_service_provider/screens/dashboard/notifications/notification_screen.dart';

import '../../shared/custom_colors.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int currentIndex = 0;

  final _bottomTabs = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: 'Home',
    ),
    const BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.notifications_none_outlined), label: 'Notifications'),
    const BottomNavigationBarItem(
      icon: Icon(Icons.public_outlined),
      label: 'Service',
    ),
  ];

  final _bottomPages = <Widget>[
    HomeScreen(onTap: () {
      scaffoldState.currentState!.openDrawer();
    }),
    const HistoryScreen(),
    const NotificationScreen(),
    const MapScreen(),
  ];

  static final GlobalKey<ScaffoldState> scaffoldState =
      GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldState,
      body: _bottomPages[currentIndex],
      drawer: Drawer(
        backgroundColor: whiteColor,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: _size.height * 0.15),
              SizedBox(
                width: double.infinity,
                height: _size.height * 0.2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: _size.width / 4,
                      height: double.infinity,
                      child: Center(
                        child: Image.asset('assets/images/male.png'),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: _size.width * 0.45,
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(),
                            ],
                          ),
                        ),
                        Text(
                          'Kwabena Awuni',
                          style: GoogleFonts.poppins(
                            color: blackColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 26,
                          ),
                        ),
                        const SizedBox(height: 12),
                        GestureDetector(
                          onTap: () {
                            // Navigator.pop(context);
                            // customNavigation(const Profile(), context);
                          },
                          child: Text(
                            'View Profile',
                            style: GoogleFonts.poppins(
                              color: primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              customListTile(
                title: 'Account',
                icon: Icons.person_outline_sharp,
                onTap: () {
                  debugPrint('Account');
                },
              ),
              customListTile(
                title: 'Service Stats',
                icon: Icons.signal_cellular_alt_outlined,
                onTap: () {
                  debugPrint('Service');
                },
              ),
              customListTile(
                title: 'Payment',
                icon: Icons.credit_card,
                onTap: () {},
              ),
              customListTile(
                title: 'Settings',
                icon: Icons.settings_outlined,
                onTap: () {
                  // Navigator.pop(context);
                  // customNavigation(const Settings(), context);
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomTabs,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryColor,
        unselectedItemColor: greyColor,
        onTap: (val) => setState(() => currentIndex = val),
        elevation: 0.0,
      ),
    );
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
}
