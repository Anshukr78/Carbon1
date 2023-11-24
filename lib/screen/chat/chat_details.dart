


import 'package:carbon/model/userModel.dart';
import 'package:carbon/screen/chat/profile_account.dart';
import 'package:carbon/screen/chat/user_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../helper/api.dart';
import '../../helper/colors.dart';
import '../../helper/size.dart';
import '../../helper/text_style.dart';
import '../../model/message.dart';
import 'message_ui.dart';



class ChatDetails extends StatefulWidget {
  final UserModel userModel;
  const ChatDetails({Key? key, required this.userModel}) : super(key: key);

  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {

  TextEditingController textEditingController = TextEditingController();
  
  Widget _chatInput(){
    return Padding(
        padding: EdgeInsets.symmetric(
            //vertical: AppSize.heightMultiply(context, 0.1),
          horizontal: AppSize.widthMultiply(context, 0.025),
        ),
      child: Row(
        children: [
          Expanded(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    // IconButton(
                    //     onPressed: (){},
                    //     icon: Icon(Icons.emoji_emotions,
                    //       color: AppColor.c009177w40,
                    //       size: 25,
                    //     ),
                    // ),
                    Expanded(
                        child: TextFormField(
                          controller: textEditingController,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                            hintText: 'Type somethings....',
                            hintStyle: GoogleFonts.montserrat(
                                color: AppColor.c009177w40,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                    ),
                  ],
                ),
              ),
          ),
          MaterialButton(
            onPressed: ()async{
              if(textEditingController.text.isNotEmpty){
                if(_list.isEmpty){
                  sendFirstMessage(widget.userModel, textEditingController.text, Type.text );

                }else{
                  sendMessage(widget.userModel, textEditingController.text, Type.text);
                }
                textEditingController.text = '';
              }
            },
            padding: const EdgeInsets.only(left: 5, bottom: 10, top: 10, right: 5),
            shape: const CircleBorder(),
            color: AppColor.c009177,
            child: const Icon(Icons.send, color: Colors.white, size: 28,),
          )
        ],
      ),
    );
  }

  List<Message> _list = [];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(11.0),
            child: CircleAvatar(
              radius: 13,
              backgroundColor: AppColor.cD9D9D9w40,
              child: Icon(
                Icons.arrow_back_ios_new,
                color: AppColor.c000000,
                size: AppSize.heightDivide(context, 55),
              ),
            ),
          ),
        ),
        title: Text(
          '${widget.userModel.first_name} ${widget.userModel.last_name}',
          style: AppText.montserrat60018pxc000000,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> UserProfile(userModel: widget.userModel,)));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.heightMultiply(context, 0.3)),
                child: SizedBox(
                    height: 45,
                    width: 35,
                    child: widget.userModel.photoUrl.isEmpty ? Icon(Icons.account_circle_rounded, size: 30, color: AppColor.cD9D9D9w40,) : Image.network(widget.userModel.photoUrl,
                      fit: BoxFit.fill,
                    )
                ),
              ),
            ),
          )
        ],
      ),

      body: Column(
        children: [
          Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection('chats/${getConversationID(widget.userModel.id)}/messages/').orderBy('sent', descending: false).snapshots(),
                builder: (context, snapShot){
                  print(snapShot.connectionState);
                  switch(snapShot.connectionState){
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return const Center(child: CircularProgressIndicator(),);
                    case ConnectionState.active:
                    case ConnectionState.done:
                    final data = snapShot.data?.docs;
                    _list = data
                        ?.map((e) => Message.fromJson(e.data()))
                        .toList() ??
                        [];
                      if(_list.isNotEmpty){
                        return ListView.builder(
                          itemCount : _list.length,
                            physics : const BouncingScrollPhysics(),
                            itemBuilder: (context, index){
                              return MessageCard(message: _list[index],);
                            }
                        );
                      }else{
                        return const Center(
                          child: Text('Say Hii! 👋',
                              style: TextStyle(fontSize: 20)),
                        );
                      }
                  }
                },
              )
          ),
          _chatInput()
        ],
      ),

    );
  }
}
