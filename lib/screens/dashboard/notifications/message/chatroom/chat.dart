import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../model/chat_model.dart';
import '../../../../../shared/custom_colors.dart';

class Chat extends StatefulWidget {
  Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  String? messageContent;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: _size.height * .07,
              decoration: BoxDecoration(
                color: secondaryColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 15),
                    width: _size.width * .11,
                    height: _size.height * .1,
                    decoration: const BoxDecoration(
                      color: secondaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset('assets/emojis/male4.png'),
                  ),
                  Text(
                    'Kwabena Awuni',
                    style: GoogleFonts.poppins(
                      color: primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 12,
                ),
                margin: const EdgeInsets.symmetric(vertical: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: secondaryColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  reverse: true,
                  itemCount: listOfChats.length,
                  itemBuilder: (context, index) {
                    final chat = listOfChats[index];
                    return Row(
                      mainAxisAlignment: chat.isMe
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(16),
                          constraints: BoxConstraints(
                            maxWidth: _size.width * .38,
                          ),
                          alignment: chat.isMe
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: chat.isMe
                                ? greyLightColor
                                : secondaryColor.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Text(
                                chat.messageContent,
                                textAlign:
                                    chat.isMe ? TextAlign.end : TextAlign.start,
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  wordSpacing: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.symmetric(horizontal: 5),
              width: double.infinity,
              height: _size.height * .05,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        color: secondaryColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.face, color: Colors.amber),
                          const SizedBox(width: 5),
                          Flexible(
                            child: TextField(
                              onChanged: (val) {
                                if (val.isEmpty) {
                                  debugPrint('Empty');
                                  setState(() {
                                    messageContent = null;
                                  });
                                  return;
                                }
                                debugPrint('!Empty');
                                setState(() {
                                  messageContent = val;
                                });
                              },
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Type a message',
                                hintStyle: TextStyle(
                                  color: primaryLightColor,
                                  fontSize: 16.5,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 3),
                    decoration: BoxDecoration(
                      color: secondaryColor.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: messageContent == null ? null : () {},
                      icon: Icon(
                        Icons.send_outlined,
                        color: messageContent == null
                            ? primaryLightColor
                            : primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
