import 'package:carbon/helper/text_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:google_fonts/google_fonts.dart';

import '../../helper/colors.dart';
import '../../helper/size.dart';
import '../../helper/text_form_field.dart';
import '../../model/chatUser.dart';
import '../../model/userModel.dart';
import '../../widget/app_bar_widget.dart';

import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import 'chat_widget.dart';

class ChatUi extends StatefulWidget {
  const ChatUi({Key? key}) : super(key: key);

  @override
  State<ChatUi> createState() => _ChatUiState();
}

class _ChatUiState extends State<ChatUi> {
  TextEditingController search = TextEditingController();

  List<UserModel> _list = [];

  // for storing searched items
  final List<UserModel> _searchList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.cF1F7F2,
      appBar: appBarWidget(
        context: context,
        title: 'Chat',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           // searchTextFormField(context: context, controller: search),

            SizedBox(
              height: MediaQuery.of(context).size.height / 100,
            ),

            Center(
              child: Container(
                height: AppSize.heightDivide(context, 5.33),
                width: AppSize.widthDivide(context, 1.2),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 4,
                          color: AppColor.c000000w15,
                          inset: false),
                      BoxShadow(
                        offset: Offset(-110, -50),
                        blurRadius: 50,
                        color: AppColor.cCCF2E9w50,
                        inset: true,
                      ),
                      BoxShadow(
                        offset: Offset(110, 50),
                        blurRadius: 50,
                        color: AppColor.cCCF2E9w50,
                        inset: true,
                      ),
                    ]),
                child: Row(
                  children: [
                    Expanded(
                      child: Image.asset(
                        'images/poster.png',
                        height: AppSize.heightDivide(context, 7),
                        width: AppSize.widthDivide(context, 2.40),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Find Carbon reducer',
                        style: GoogleFonts.croissantOne(
                          fontSize: 24,
                          letterSpacing: 0.2,
                          color: AppColor.c009177,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: AppSize.widthDivide(context, 18),
                    )
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.widthDivide(context, 12.85),
                vertical: AppSize.widthDivide(context, 20),
              ),
              child: Text(
                'Message',
                style: AppText.montserrat40014pxc000000w50,
              ),
            ),
            // SizedBox(
            //   height: AppSize.heightDivide(context, 13),
            //   width: double.infinity,
            //   child: Row(
            //     children: [
            //       Expanded(
            //         flex :10,
            //         child: Padding(
            //           padding: EdgeInsets.symmetric(
            //               horizontal: AppSize.widthDivide(context, 12),
            //           ),
            //           child: Row(
            //             crossAxisAlignment: CrossAxisAlignment.center,
            //             children: [
            //               ClipRRect(
            //                 borderRadius: BorderRadius.circular(AppSize.heightMultiply(context, 0.3)),
            //                 child: SizedBox(
            //                   height: 45,
            //                   width: 45,
            //                   child: Image.network('https://images.unsplash.com/photo-1605092676920-8ac5ae40c7c8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=465&q=80',
            //                   fit: BoxFit.cover,
            //                   )
            //                 ),
            //               ),
            //               SizedMedia.widthDivide(context, AppSize.widthDivide(context, 12)),
            //               Column(
            //                 mainAxisAlignment: MainAxisAlignment.center,
            //                 children: [
            //                   Text('Robert Fox', style: AppText.montserrat50015pxc000000,),
            //                   SizedBox(height: 2,),
            //                   Text('Good to go.', style: AppText.montserrat40012pxc000000,)
            //                 ],
            //               )
            //             ],
            //           ),
            //         ),
            //       ),
            //       Expanded(
            //         flex: 2,
            //           child: Text('Sun', style: AppText.montserrat40012pxc000000,))
            //     ],
            //   ),
            // ),

            StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('users').snapshots(),
              builder: (context, snapShot) {
                switch (snapShot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case ConnectionState.active:
                  case ConnectionState.done:
                    final data = snapShot.data?.docs;

                    _list = data
                        ?.map((e) => UserModel.fromJson(e.data()))
                        .toList() ??
                        [];
                    print(_list.length);
                    print(data);
                    print(data!.length);
                    if (_list.isNotEmpty) {
                      return ListView.separated(
                        itemCount: _list.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        // physics : const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return  ChatWidget(userModel: _list[index],);
                        },
                        separatorBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppSize.widthDivide(context, 25)),
                            child: Divider(
                              thickness: 1,
                              color: AppColor.c000000w10,
                            ),
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: Text(
                          'No Data found',
                          style: GoogleFonts.croissantOne(
                            fontSize: 25,
                          ),
                        ),
                      );
                    }
                }
              },
            ),

            // ListView.separated(
            //   shrinkWrap: true,
            //   physics: const NeverScrollableScrollPhysics(),
            //   itemBuilder: (context, index) {
            //     return const ChatWidget();
            //   },
            //   separatorBuilder: (context, index) {
            //     return Padding(
            //       padding: EdgeInsets.symmetric(
            //           horizontal: AppSize.widthDivide(context, 25)),
            //       child: Divider(
            //         thickness: 1,
            //         color: AppColor.c000000w10,
            //       ),
            //     );
            //   },
            //   itemCount: 6,
            // ),
            SizedMedia.heightDivide(context, 5)
          ],
        ),
      ),
    );
  }
}
