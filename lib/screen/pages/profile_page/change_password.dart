import 'package:carbon/helper/button.dart';
import 'package:carbon/helper/colors.dart';
import 'package:carbon/helper/size.dart';
import 'package:carbon/helper/text_form_field.dart';
import 'package:carbon/helper/text_style.dart';
import 'package:carbon/widget/app_bar_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../widget/bottom_nav_bar_widget.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController oldP = TextEditingController();
  TextEditingController newP = TextEditingController();
  TextEditingController confirmP = TextEditingController();

  void _changePassword(String currentPassword, String newPassword) async {
    final user = FirebaseAuth.instance.currentUser;
    final cred = EmailAuthProvider.credential(
        email: user!.email!, password: currentPassword);

    user.reauthenticateWithCredential(cred).then((value) {
      user.updatePassword(newPassword).then((_) {

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const BottomNavBarWidget()));

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            'Password updated',
            style: AppText.montserrat40012pxc000000,
          ),
          backgroundColor: AppColor.cFFFFFF,
        ));
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            error.toString(),
            style: AppText.montserrat40012pxc000000,
          ),
          backgroundColor: AppColor.cFFFFFF,
        ));
      });
    }).catchError((err) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(
          err.toString(),
          style: AppText.montserrat40012pxc000000,
        ),
        backgroundColor: AppColor.cFFFFFF,
      ));
    });}

  bool eye = true;
  bool eye1 = true;

  bool eye2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.cF1F7F2,
      appBar: appBarWidget(
        context: context,
        title: 'Change Password',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.widthDivide(context, 12),
          ),
          child: Column(
            children: [
              SizedBox(
                  // margin: EdgeInsets.symmetric(
                  //   vertical: AppSize.heightDivide(context, 60),
                  // ),
                  width: AppSize.widthMultiply(context, 1),
                  child: Image.asset('images/security.png')),
              passwordTextFormField(
                  context: context,
                  width: AppSize.widthMultiply(context, 1),
                  controller: oldP,
                  hintText: 'Old Password',
                  suffix: InkWell(
                    onTap: () {
                      setState(() {
                        eye = !eye;
                      });
                    },
                    child: Icon(eye ? Icons.visibility_off : Icons.visibility),
                  ),
                  obscureText: eye),
              passwordTextFormField(
                  context: context,
                  width: AppSize.widthMultiply(context, 1),
                  controller: newP,
                  hintText: 'New Password',
                  suffix: InkWell(
                    onTap: () {
                      setState(() {
                        eye1 = !eye1;
                      });
                    },
                    child: Icon(eye1 ? Icons.visibility_off : Icons.visibility),
                  ),
                  obscureText: eye1),
              passwordTextFormField(
                  context: context,
                  width: AppSize.widthMultiply(context, 1),
                  controller: newP,
                  hintText: 'Confirm Password',
                  suffix: InkWell(
                    onTap: () {
                      setState(() {
                        eye1 = !eye1;
                      });
                    },
                    child: Icon(eye1 ? Icons.visibility_off : Icons.visibility),
                  ),
                  obscureText: eye1),
              SizedMedia.heightDivide(context, 16),
              button200Fill(
                  context: context,
                  text: 'Change',
                  call: () {
                    if (newP.text.trim() == confirmP.text.trim()) {
                      _changePassword(oldP.text.trim(), newP.text.trim());
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        behavior: SnackBarBehavior.floating,
                        content: Text(
                          'Password must be same',
                          style: AppText.montserrat40012pxc000000,
                        ),
                        backgroundColor: AppColor.cFFFFFF,
                      ));
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
