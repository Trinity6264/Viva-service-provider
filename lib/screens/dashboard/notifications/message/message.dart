import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viva_service_provider/screens/dashboard/notifications/message/chatroom/chat.dart';

import '../../../../shared/custom_colors.dart';
import '../../../../shared/custom_navigation.dart';

class Message extends StatelessWidget {
  const Message({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
      color: whiteColor,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(10, 30, 10, 25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: lightColor,
            ),
            child: const TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search, color: primaryColor),
                hintText: 'Search Conversation',
                hintStyle: TextStyle(
                  color: primaryLightColor,
                ),
              ),
              textInputAction: TextInputAction.search,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    customNavigation(context,  Chat());
                  },
                  child: Container(
                    width: double.infinity,
                    height: _size.height * 0.1,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: lightColor,
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          maxRadius: 25,
                          backgroundColor: secondaryColor.withOpacity(.6),
                          child: Image.asset('assets/emojis/male4.png'),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Kwabena Awuni',
                                style: GoogleFonts.poppins(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.0,
                                ),
                              ),
                              Text(
                                'Hello Good morning please will you be',
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  color: greyColor,
                                  wordSpacing: 1.8,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
