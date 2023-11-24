import 'dart:async';

import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../helper/colors.dart';
import '../../helper/text_style.dart';
import '../../widget/bottom_nav_bar_widget.dart';

class WasteCong extends StatefulWidget {
  final wasteCalculate;

  const WasteCong({super.key, required this.wasteCalculate});

  @override
  State<WasteCong> createState() => _WasteCongState();
}

class _WasteCongState extends State<WasteCong> {
  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);

  bool isPlaying = false;

  final controller = ConfettiController();

  double carbonValue = 0;

  startTimer() {
    Timer(const Duration(seconds: 5), () async {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => BottomNavBarWidget()));
    });
  }

  @override
  void initState() {
    controller.play();

    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Waste Value',
          style: AppText.montserrat60018pxc000000,
        ),
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Lottie.network(
                    'https://assets10.lottiefiles.com/packages/lf20_21759ndg.json', height: 200),
              ),
             Center(
               child: Text(
                 '${double.parse(widget.wasteCalculate).round().toString()} KG',
                 style: GoogleFonts.montserrat(
                     fontSize: 30,
                     fontWeight: FontWeight.w700,
                     color: AppColor.c6AEC5E,
                     shadows: [
                       Shadow(
                           color: Colors.black26,
                           offset: Offset(-2,2),
                           blurRadius: 4
                       )
                     ]
                 ),
                ),
             ),
              Center(
                child: Text(
                  'Your waste value is  ${double.parse(widget.wasteCalculate).round().toString()} KG',
                  style: GoogleFonts.montserrat(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: AppColor.c6AEC5E,
                      shadows: [
                        Shadow(
                            color: Colors.black26,
                            offset: Offset(-2,2),
                            blurRadius: 4
                        )
                      ]
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 150,
              ),
              Lottie.network(
                  'https://assets3.lottiefiles.com/packages/lf20_OFvr8Nvcmq.json')

            ],
          ),
          Positioned(
            top: 150,
            left: MediaQuery.of(context).size.width*0.4,
            child: Center(
              child: ConfettiWidget(
                confettiController: controller,
                shouldLoop: true,
                blastDirectionality: BlastDirectionality.explosive,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
