import 'package:carbon/helper/button.dart';
import 'package:carbon/helper/colors.dart';
import 'package:carbon/helper/size.dart';
import 'package:carbon/helper/text_form_field.dart';
import 'package:carbon/helper/text_style.dart';
import 'package:carbon/screen/authentication/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController email = TextEditingController();
  bool loader = false;
  forgot() async {
    if (email.text.trim().isNotEmpty) {
      setState(() {
        loader = true;
      });
      try {
        final FirebaseAuth auth = FirebaseAuth.instance;
        await auth.sendPasswordResetEmail(email: email.text.trim());

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
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
                      SizedMedia.heightDivide(context, 11),
                      loader
                          ? const Center(child: CircularProgressIndicator())
                          : button200Fill(
                              context: context,
                              text: 'Continue',
                              call: () {
                                forgot();
                              }),
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
