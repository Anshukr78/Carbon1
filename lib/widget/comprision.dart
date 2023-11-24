import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../helper/colors.dart';


class Comparision extends StatefulWidget {
  final carbonCalculate;
  const Comparision({super.key, required this.carbonCalculate});

  @override
  State<Comparision> createState() => _ComparisionState();
}

class _ComparisionState extends State<Comparision> {

  @override
  Widget build(BuildContext context) {
    List dataMap = [
      {
        "name" : 'Your carbon',
        "value" : widget.carbonCalculate
      },

      {
        "name" : 'Avg. India',
        "value" : 19000,
      },
      {
        "name" : 'Avg. world',
        "value" : 47000,
      }
    ];
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Carbon Footprint',
            style: GoogleFonts.croissantOne(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColor.c9ABAB6),
          ),

          Container(
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
                  width: 0.5,
                  dataSource: dataMap,
                  xValueMapper: (valueX, index) => valueX['name'],
                  yValueMapper: (valueX, index) => valueX['value'],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

