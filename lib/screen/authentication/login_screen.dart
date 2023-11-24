import 'package:carbon/helper/button.dart';
import 'package:carbon/helper/colors.dart';
import 'package:carbon/helper/size.dart';
import 'package:carbon/helper/text_form_field.dart';
import 'package:carbon/helper/text_style.dart';
import 'package:carbon/screen/authentication/forgot_password.dart';
import 'package:carbon/screen/authentication/sign_up_screen.dart';
import 'package:carbon/widget/bottom_nav_bar_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool eye = true;
  bool loader = false;
  login() async {
    if (email.text.trim().isNotEmpty && password.text.trim().isNotEmpty) {
      setState(() {
        loader = true;
      });
      try {
        final FirebaseAuth auth = FirebaseAuth.instance;
        final existingUser = await auth.signInWithEmailAndPassword(
            email: email.text.trim(), password: password.text.trim());
        if (existingUser != null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text(
              'Login Successfully',
              style: AppText.montserrat40012pxc000000,
            ),
            backgroundColor: AppColor.cFFFFFF,
          ));
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const BottomNavBarWidget()));
          setState(() {
            loader = false;
          });
        }
      } on FirebaseException catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            error.message.toString(),
            style: AppText.montserrat40012pxc000000,
          ),
          backgroundColor: AppColor.cFFFFFF,
        ));
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
              )),
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
                      signInTextFormField(
                          context: context,
                          width: AppSize.widthMultiply(context, 1),
                          controller: email,
                          hintText: 'Email address'),
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
                          obscureText: eye),
                      SizedMedia.heightDivide(context, 160),
                      Padding(
                        padding: EdgeInsets.only(
                            right: AppSize.widthDivide(context, 2.1)),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgotPassword()));
                          },
                          child: Text(
                            'Forgot Password ?',
                            style: AppText.montserrat50012pxc000000,
                          ),
                        ),
                      ),
                      SizedMedia.heightDivide(context, 16),
                      loader
                          ? const Center(child: CircularProgressIndicator())
                          : button200Fill(
                              context: context,
                              text: 'Continue',
                              call: () {
                                login();
                                // Navigator.pushReplacement(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             const BottomNavBarWidget()));
                              }),
                      SizedMedia.heightDivide(context, 14),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don’t have an account ? ",
                            style: AppText.montserrat50014pxc000000,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUp()));
                            },
                            child: Text(
                              "Sign Up",
                              style: AppText.montserrat70014pxcFD8913,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
