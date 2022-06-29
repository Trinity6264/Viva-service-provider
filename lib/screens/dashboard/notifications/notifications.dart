import 'package:flutter/material.dart';
import 'package:viva_service_provider/screens/dashboard/notifications/all/all.dart';
import 'package:viva_service_provider/screens/dashboard/notifications/message/message.dart';

import '../../../shared/custom_colors.dart';


class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  static const _tabs = [
    Tab(
      child: Text(
        'All',
        style: TextStyle(
          color: blackColor,
        ),
      ),
    ),
    Tab(
      child: Text(
        'Messages',
        style: TextStyle(
          color: blackColor,
        ),
      ),
    ),
  ];

  static const _tabPages = [All(), Message()];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: whiteColor,
          elevation: .0,
          title: const Text(
            'Notifictions',
            style: TextStyle(
              color: blackColor,
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
          bottom: const TabBar(
            tabs: _tabs,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            indicatorColor: primaryColor,
          ),
        ),
        body: const TabBarView(
          children: _tabPages,
        ),
      ),
    );
  }
}
