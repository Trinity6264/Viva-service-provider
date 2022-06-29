import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:viva_service_provider/screens/dashboard/notifications/message/chatroom/chat.dart';

void main() {
  testWidgets('chat ...', (tester) async {
    await tester.pumpWidget(Chat());

    expect(find.byIcon(Icons.arrow_back_ios_new), findsNothing);
    // expect(find.text('1'), findsNothing);
  });
}
