


import 'package:carbon/model/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/message.dart';

String getConversationID(String id) => FirebaseAuth.instance.currentUser!.uid.hashCode <= id.hashCode
    ? '${FirebaseAuth.instance.currentUser!.uid}_$id'
    : '${id}_${FirebaseAuth.instance.currentUser!.uid}';


Future<void> sendFirstMessage(
    UserModel userModel, String msg, Type type) async {
  await FirebaseFirestore.instance
      .collection('users')
      .doc(userModel.id)
      .collection('my_users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .set({}).then((value) => sendMessage(userModel, msg, type));
}

Future<void> sendMessage(
    UserModel userModel, String msg, Type type) async {
  //message sending time (also used as id)
  final time = DateTime.now().millisecondsSinceEpoch.toString();

  //message to send
  final Message message = Message(
      toId: userModel.id,
      msg: msg,
      read: '',
      type: type,
      fromId: FirebaseAuth.instance.currentUser!.uid,
      sent: time);

    final ref = FirebaseFirestore.instance
        .collection('chats/${getConversationID(userModel.id)}/messages/');
    await ref.doc(time).set(message.toJson());
    // .then((value) =>
    // sendPushNotification(chatUser, type == Type.text ? msg : 'image'));
}