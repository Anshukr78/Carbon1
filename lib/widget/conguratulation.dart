//Congratulations

import 'dart:async';

import 'package:carbon/helper/colors.dart';
import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../helper/size.dart';
import '../helper/text_style.dart';
import 'app_bar_widget.dart';
import 'bottom_nav_bar_widget.dart';

class CongratulationPage extends StatefulWidget {
  final double carbonCalculate;

  const CongratulationPage({super.key, required this.carbonCalculate});

  @override
  State<CongratulationPage> createState() => _CongratulationPageState();
}

class _CongratulationPageState extends State<CongratulationPage> {

  bool isPlaying = false;

  final controller = ConfettiController();

  double carbonValue = 0;


  startTimer() {
    Timer(const Duration(seconds: 5), () async {

     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> BottomNavBarWidget()));
    });
  }

  @override
  void initState() {

    setState(() {
      carbonValue = widget.carbonCalculate;
    });

    controller.play();

    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    List dataMap = [
      {
        "name" : 'Your',
        "value" : widget.carbonCalculate
      },

      {
        "name" : 'Average Indian',
        "value" : 19000,
      },
      {
        "name" : 'Average World',
        "value" : 47000,
      }
    ];

    return Scaffold(
      appBar : AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Carbon footprint',
          style: AppText.montserrat60018pxc000000,
        ),
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CircularSeekBar(
              //   width: double.infinity,
              //   height: 250,
              //   progress: widget.carbonCalculate / 600,
              //   barWidth: 8,
              //   startAngle: 45,
              //   sweepAngle: 270,
              //   strokeCap: StrokeCap.butt,
              //   progressGradientColors: const [Colors.red, Colors.orange, Colors.yellow, Colors.green, Colors.blue, Colors.indigo, Colors.purple],
              //   innerThumbRadius: 5,
              //   innerThumbStrokeWidth: 3,
              //   innerThumbColor: Colors.white,
              //   outerThumbRadius: 5,
              //   outerThumbStrokeWidth: 10,
              //   outerThumbColor: Colors.blueAccent,
              //   dashWidth: 1,
              //   dashGap: 2,
              //   animation: true,
              //   curves: Curves.bounceOut,
              //   valueNotifier: _valueNotifier,
              //   child: Center(
              //     child: ValueListenableBuilder(
              //         valueListenable: _valueNotifier,
              //         builder: (_, double value, __) => Column(
              //           mainAxisSize: MainAxisSize.min,
              //           children: [
              //             Text('${widget.carbonCalculate.round()}', style: TextStyle(color: Colors.black),),
              //             Text('progress'),
              //           ],
              //         )),
              //   ),
              // ),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: Lottie.network(
                    'https://assets10.lottiefiles.com/packages/lf20_21759ndg.json', height: 200),
              ),

              Center(
                child: Text(
                  '${widget.carbonCalculate.round()}',
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
                  'Carbon Footprint',
                  style: GoogleFonts.montserrat(
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                    color:  AppColor.c6AEC5E,
                    letterSpacing: 2,
                    shadows: [
                      Shadow(
                        color: Colors.black26,
                        offset: Offset(0,4),
                        blurRadius: 4
                      )
                    ]
                  ),
                ),
              ),
              const SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text('CO2 Statistics Carbon emission',
                  style: GoogleFonts.croissantOne(
                    fontSize: 20,
                      shadows: [
                        Shadow(
                            color: Colors.black26,
                            offset: Offset(-2,2),
                            blurRadius: 4
                        )
                      ]
                  ),),
              ),
              Container(
                width: double.infinity,
                child: SfCartesianChart(
                  enableSideBySideSeriesPlacement : false,
                  plotAreaBorderColor: Colors.transparent,
                  plotAreaBorderWidth: 0.0,
                  primaryYAxis: CategoryAxis(

                      majorGridLines: const MajorGridLines(
                          width: 0
                      )
                  ),
                  primaryXAxis: CategoryAxis(
                      majorGridLines: const MajorGridLines(
                          width: 0
                      )
                  ),
                  series:[
                    ColumnSeries(
                      gradient: LinearGradient(
                        colors: [
                          AppColor.c9ABAB6,
                          AppColor.cFFFFFF.withOpacity(0.60),
                        ],
                      ),
                      width: 0.3,
                      dataSource: dataMap,

                      xValueMapper: (valueX, index) => valueX['name'],
                      yValueMapper: (valueX, index) => valueX['value'],

                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 30.0),
              //   child: Text('Co2 Statistics',
              //     style: GoogleFonts.croissantOne(),),
              // ),
              // ListView.builder(
              //   itemCount: ,
              //     itemBuilder: (context, index){
              //
              //     }
              // )
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




    // return Scaffold(
    //   body: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Text(
    //         'Carbon Footprint',
    //         style: GoogleFonts.croissantOne(
    //             fontSize: 18,
    //             fontWeight: FontWeight.w500,
    //             color: AppColor.c9ABAB6),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.symmetric(vertical: 20.0),
    //         child: Text(
    //           widget.carbonCalculate.toString(),
    //           style: GoogleFonts.croissantOne(
    //             fontSize: 28,
    //             fontWeight: FontWeight.bold,
    //             color: AppColor.c000000
    //           ),
    //         ),
    //       ),
    //       Image.asset('images/cc.png'),
    //
    //       Text('Your country carbon footprint : - 19000',
    //         style: GoogleFonts.notoSans(
    //           fontSize: 18,
    //           fontWeight: FontWeight.w300,
    //           color: Colors.greenAccent
    //         ),
    //       ),
    //     ],
    //   ),
    // );


  }
}


class DataValue{
  DataValue(this.value, this.name);
  final String name;
  final double value;
}
