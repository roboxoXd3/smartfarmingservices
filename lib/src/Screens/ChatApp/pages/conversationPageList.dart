import 'package:flutter/material.dart';

import 'conversationPage.dart';


class ConversationPageList extends StatefulWidget {
  @override
  _ConversationPageListState createState() => _ConversationPageListState();
}

class _ConversationPageListState extends State<ConversationPageList> {
  @override
  Widget build(BuildContext context) {
    return  ConversationPage();
//    return PageView(
//      children: [
//        ConversationPage(),
//        ConversationPage(),
//        ConversationPage(),
//      ],
//    );
  }
}
