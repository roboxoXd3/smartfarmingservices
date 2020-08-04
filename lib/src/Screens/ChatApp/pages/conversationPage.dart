import 'package:flutter/material.dart';
import '../widgets/chatAppBar.dart';
import '../widgets/chatListWidget.dart';
import '../widgets/InputWidget.dart';

class ConversationPage extends StatefulWidget {
  final String name;
  final String email;
  final String image;

  const ConversationPage({Key key, this.name, this.email, this.image}) : super(key: key);
  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: ChatAppBar(
          name: widget.name,
          email: widget.email,
          image: widget.image,

        ),
        body: Stack(
          children: [
            Column(
              children: [
                ChatListWidget(),
                InputWidget(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
