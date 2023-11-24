import 'package:carbon/helper/colors.dart';
import 'package:carbon/helper/size.dart';
import 'package:carbon/helper/text_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../screen/pages/home_page/transportation_details.dart';

class TransportationWidget extends StatefulWidget {
  const TransportationWidget({super.key});

  @override
  State<TransportationWidget> createState() => _TransportationWidgetState();
}

class _TransportationWidgetState extends State<TransportationWidget> {
  // List name = [
  //   'Bicycle',
  //   'Electric Vehicle',
  //   'Walking',
  //   'CNG Vehicle',
  //   'Public Transportation'
  // ];
  // List image = [
  //   'images/bicycle.png',
  //   'images/electric.png',
  //   'images/walking.png',
  //   'images/cng.png',
  //   'images/public.png',
  // ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sustainable Transportation',
          style: AppText.montserrat60016pxc000000,
        ),
        SizedMedia.heightDivide(context, 40),
        SizedBox(
          height: AppSize.heightDivide(context, 3.4782),
          width: AppSize.widthMultiply(context, 1),

          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('sustainableTransportation')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(child: Text('Something went wrong'));
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.data!.docs.isEmpty) {
                return const Center(
                    child: Text(
                  'This category \n\n has no items yet !',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Acme',
                      letterSpacing: 1.5),
                ));
              }

              return ListView.builder(
                  // shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TransportationDetails(
                              imageUrl: snapshot.data!.docs[index]['imageURL'],
                              description: snapshot.data!.docs[index]
                                  ['description'],
                              topic: snapshot.data!.docs[index]['topic'],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            right: AppSize.widthDivide(context, 30)),
                        height: AppSize.heightDivide(context, 3.4782),
                        width: AppSize.widthDivide(context, 1.8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.cFFFFFF,
                          image: DecorationImage(
                            image: NetworkImage(
                                snapshot.data!.docs[index]['imageURL']),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Container(
                          margin: EdgeInsets.only(
                            top: AppSize.heightDivide(context, 4.5),
                            bottom: AppSize.heightDivide(context, 70),
                            left: AppSize.widthDivide(context, 36),
                            right: AppSize.widthDivide(context, 36),
                          ),
                          height: AppSize.heightDivide(context, 22.8571),
                          width: AppSize.widthDivide(context, 2.0454),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.c9ABAB6,
                          ),
                          child: Center(
                            child: Text(
                              snapshot.data!.docs[index]['topic'],
                              style: AppText.montserrat50013pxc000000,
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            },
          ),

          // child: ListView.builder(
          //     // shrinkWrap: true,
          //     // physics: const NeverScrollableScrollPhysics(),
          //     scrollDirection: Axis.horizontal,
          //     itemCount: name.length,
          //     itemBuilder: (context, index) {
          //       return GestureDetector(
          //
          //         onTap: (){},
          //
          //         child: Container(
          //           margin:
          //               EdgeInsets.only(right: AppSize.widthDivide(context, 30)),
          //           height: AppSize.heightDivide(context, 3.4782),
          //           width: AppSize.widthDivide(context, 1.8),
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(10),
          //             color: AppColor.cFFFFFF,
          //             image: DecorationImage(
          //                 image: AssetImage(image[index]), fit: BoxFit.cover),
          //           ),
          //           child: Container(
          //             margin: EdgeInsets.only(
          //               top: AppSize.heightDivide(context, 4.5),
          //               bottom: AppSize.heightDivide(context, 70),
          //               left: AppSize.widthDivide(context, 36),
          //               right: AppSize.widthDivide(context, 36),
          //             ),
          //             height: AppSize.heightDivide(context, 22.8571),
          //             width: AppSize.widthDivide(context, 2.0454),
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(10),
          //               color: AppColor.c9ABAB6,
          //             ),
          //             child: Center(
          //               child: Text(
          //                 name[index],
          //                 style: AppText.montserrat50013pxc000000,
          //               ),
          //             ),
          //           ),
          //         ),
          //       );
          //     }),
        )
      ],
    );
  }
}
