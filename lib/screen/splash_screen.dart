import 'dart:async';

import 'package:carbon/screen/authentication/login_screen.dart';

import 'package:carbon/widget/bottom_nav_bar_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimer() {
    Timer(
      const Duration(seconds: 2),
      () async {
        User? user = FirebaseAuth.instance.currentUser;

        if (user == null) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginScreen()));
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: ((context) => const BottomNavBarWidget()),
            ),
          );
        }
      },
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff272727),
      body: Center(
        child: SvgPicture.asset(
            'images/white_logo.svg',
        ),
      ),
    );
  }
}
