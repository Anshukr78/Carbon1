// ignore_for_file: use_build_context_synchronously

import 'package:carbon/helper/button.dart';
import 'package:carbon/helper/colors.dart';
import 'package:carbon/helper/size.dart';
import 'package:carbon/helper/text_form_field.dart';
import 'package:carbon/helper/text_style.dart';
import 'package:carbon/screen/authentication/login_screen.dart';
import 'package:carbon/widget/bottom_nav_bar_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uuid/uuid.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmP = TextEditingController();

  bool eye = true;
  bool eye1 = true;

  bool loader = false;



  registration() async {
    if (firstName.text.trim().isNotEmpty &&
        lastName.text.trim().isNotEmpty &&
        email.text.trim().isNotEmpty &&
        password.text.trim().isNotEmpty &&
        confirmP.text.trim().isNotEmpty &&
        email.text.trim().endsWith('@gmail.com') &&
        password.text.trim() == confirmP.text.trim()) {
      setState(() {
        loader = true;
      });
      try {
        final FirebaseAuth auth = FirebaseAuth.instance;
        await auth.createUserWithEmailAndPassword(
            email: email.text.trim(), password: password.text.trim());

        final User? user = FirebaseAuth.instance.currentUser;

        if (user != null) {
          final uId = user.uid;
          user.updateDisplayName(firstName.text.trim());
          user.reload();

          await FirebaseFirestore.instance.collection('users').doc(uId).set({
            'id': uId,
            'photoUrl': '',
            'first_name': firstName.text.trim(),
            'last_name': lastName.text.trim(),
            'email': email.text.toLowerCase(),
            'gender': '',
            'mobile': '',
            'location': '',
            'lan': '',
            'long': '',
            'dob': '',
            'city': '',
            'countryName': '',
            'pin_code': '',
            'reward_point': '',
            'activity': [],
            'certificate': [],
            'carbonFootPrint': '',
            'wasteCalculate': '',
            'reward_history': [],
            'level': 0,
            'createdAt': Timestamp.now(),
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text(
                'Registration Successful',
                style: AppText.montserrat40012pxc000000,
              ),
              backgroundColor: AppColor.cFFFFFF,
            ),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomNavBarWidget(),
            ),
          );
          setState(() {
            loader = false;
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text(
                'Something went wrong! Please check your internet',
                style: AppText.montserrat40012pxc000000,
              ),
              backgroundColor: AppColor.cFFFFFF,
            ),
          );
        }
      } on FirebaseException catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text(
              error.message.toString(),
              style: AppText.montserrat40012pxc000000,
            ),
            backgroundColor: AppColor.cFFFFFF,
          ),
        );
        setState(() {
          loader = false;
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            e.toString(),
            style: AppText.montserrat40012pxc000000,
          ),
          backgroundColor: AppColor.cFFFFFF,
        ));
        setState(() {
          loader = false;
        });
      } finally {
        setState(() {
          loader = false;
        });
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(
          'enter valid value',
          style: AppText.montserrat40012pxc000000,
        ),
        backgroundColor: AppColor.cFFFFFF,
      ));
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.cF1F7F2,
      body: SingleChildScrollView(
        child: SizedBox(
          height: AppSize.heightMultiply(context, 1),
          width: AppSize.widthMultiply(context, 1),
          child: Stack(
            children: [
              Center(
                child: SvgPicture.asset(
                  'images/world_map.svg',
                  width: AppSize.widthMultiply(context, 1),
                ),
              ),
              Positioned(
                top: AppSize.heightDivide(context, 6.333),
                left: AppSize.widthDivide(context, 12),
                right: AppSize.widthDivide(context, 12),
                child: SizedBox(
                  width: AppSize.widthMultiply(context, 1),
                  child: Column(
                    children: [
                      SizedMedia.heightDivide(context, 15),
                      SvgPicture.asset(
                        'images/black_logo.svg',
                      ),
                      SizedMedia.heightDivide(context, 12.9),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          signInTextFormField(
                              context: context,
                              width: AppSize.widthDivide(context, 2.4827),
                              controller: firstName,
                              hintText: 'First Name'),
                          signInTextFormField(
                              context: context,
                              width: AppSize.widthDivide(context, 2.4827),
                              controller: lastName,
                              hintText: 'Last Name'),
                        ],
                      ),
                      signInTextFormField(
                          context: context,
                          width: AppSize.widthMultiply(context, 1),
                          controller: email,
                          hintText: 'Email address',
                      ),
                      passwordTextFormField(
                        context: context,
                        width: AppSize.widthMultiply(context, 1),
                        controller: password,
                        hintText: 'Password',
                        suffix: InkWell(
                          onTap: () {
                            setState(() {
                              eye = !eye;
                            });
                          },
                          child: Icon(
                              eye ? Icons.visibility_off : Icons.visibility),
                        ),
                        obscureText: eye,
                      ),
                      passwordTextFormField(
                        context: context,
                        width: AppSize.widthMultiply(context, 1),
                        controller: confirmP,
                        hintText: 'Confirm Password',
                        suffix: InkWell(
                          onTap: () {
                            setState(() {
                              eye1 = !eye1;
                            });
                          },
                          child: Icon(
                              eye1 ? Icons.visibility_off : Icons.visibility),
                        ),
                        obscureText: eye1,
                      ),
                      SizedMedia.heightDivide(context, 16),
                      loader
                          ? const Center(child: CircularProgressIndicator())
                          : button200Fill(
                              context: context,
                              text: 'Continue',
                              call: () {
                                registration();
                              },
                            ),
                      SizedMedia.heightDivide(context, 14),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account  ? ",
                            style: AppText.montserrat50014pxc000000,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "Sign In",
                              style: AppText.montserrat70014pxcFD8913,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
