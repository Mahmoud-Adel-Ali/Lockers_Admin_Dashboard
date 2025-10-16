import 'package:flutter/material.dart';

import 'notification_card.dart';

class NotificationListView extends StatelessWidget {
  const NotificationListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(top: index == 0 ? 16 : 0),
          child: NotificationCard(),
        );
      },
    );
  }
}
