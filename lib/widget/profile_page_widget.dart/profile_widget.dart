import 'package:carbon/helper/colors.dart';
import 'package:carbon/helper/size.dart';
import 'package:carbon/helper/text_style.dart';
import 'package:carbon/widget/profile_page_widget.dart/edit_profile_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: AppSize.heightDivide(context, 40)),
      padding:
          EdgeInsets.symmetric(horizontal: AppSize.widthDivide(context, 20)),
      height: AppSize.heightDivide(context, 4.5977),
      width: AppSize.widthMultiply(context, 1),

      child : FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance.collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid).get(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){

          if (snapshot.hasError) {
            return const Center(child: Text("Something went wrong"),);
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return const Center(child: Text("Document does not exist"),);
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
            print(data);
            return Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: AppSize.heightDivide(context, 8.8888),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        EditProfileWidget(imageUrl: data['photoUrl'].isEmpty ? '': data['photoUrl'],),
                       // SizedMedia.widthDivide(context, 20),
                        VerticalDivider(
                          width: 1,
                          color: AppColor.c9ABAB6,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Carbon\nFootprint',
                                style: AppText.montserrat50014pxc000000w70,
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                '${data['carbonFootPrint'] == '' ? '0 ' : data['carbonFootPrint'].toString() } kgs',
                                style: AppText.montserrat60022pxc000000,
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedMedia.heightDivide(context, 30),
                  Text(
                    data['first_name'].toString().toUpperCase(),
                    style: AppText.montserrat60020pxc000000,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    data['last_name'].toString().toUpperCase(),
                    style: AppText.montserrat50020pxc000000w60,
                    textAlign: TextAlign.start,
                  ),
                ]);
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
