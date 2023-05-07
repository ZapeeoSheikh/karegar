import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:softec/models/messages_model.dart';
import 'package:softec/res/global_variables.dart';
import 'package:softec/utils/widgets/widgets_imports.dart';

import 'make_offer_view_model.dart';

enum MessagesState {
  loading,
  unknown,
  error,
}

class ChatViewModel extends ChangeNotifier {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  CollectionReference messagesCollection =
      FirebaseFirestore.instance.collection('messages');

  Future<void> addMessage(
      {required String senderId,
      required String senderName,
      required String lastMessage}) async {

      
      }
}
