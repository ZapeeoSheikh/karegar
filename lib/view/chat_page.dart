import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:softec/utils/widgets/custom_app_bar.dart';
import 'package:softec/utils/widgets/widgets_imports.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: KColors.kPrimary,
        title: 'Chats',
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
              ),
            ),
            SizedBox(
              height: 70,
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon:  const Icon(Icons.send),
                  hintText: 'Message',
                  focusColor: KColors.kPrimary,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(25),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
