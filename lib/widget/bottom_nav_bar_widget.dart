import 'package:carbon/helper/colors.dart';
import 'package:carbon/helper/size.dart';
import 'package:carbon/screen/pages/activity_page/activity.dart';
import 'package:carbon/screen/pages/calculate_page/calculate.dart';
import 'package:carbon/screen/pages/home_page/home.dart';
import 'package:carbon/screen/pages/profile_page/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({super.key});

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {


  // Position? position;
  // List<Placemark>? placeMark;
  // bool loader = false;
  // String completeAddress ='';
  // var lat, long;
  //
  // Future<Position?> locationGet()async {
  //   LocationPermission permission;
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //
  //     permission = await Geolocator.requestPermission();
  //
  //     if (permission == LocationPermission.deniedForever) {
  //
  //       return Future.error('Location Not Available');
  //     }
  //   }
  //   else {
  //
  //     permission = await Geolocator.requestPermission();
  //   }
  //   return await Geolocator.getCurrentPosition();
  // }
  //
  // getCurrentLocation() async{
  //
  //   await locationGet();
  //   Position newPosition = await Geolocator.getCurrentPosition(
  //     desiredAccuracy: LocationAccuracy.best,
  //   );
  //
  //   position = newPosition;
  //
  //   placeMark = await placemarkFromCoordinates(
  //       position!.latitude,
  //       position!.longitude
  //   );
  //   Placemark pMark = placeMark![0];
  //
  //  setState(() {
  //    completeAddress = '${pMark.subThoroughfare} ${pMark.thoroughfare}, ${pMark.subLocality} ${pMark.locality}, ${pMark.subAdministrativeArea}, ${pMark.administrativeArea} ${pMark.postalCode}, ${pMark.country}';
  //    lat = position!.latitude;
  //    long = position!.longitude;
  //  });
  //
  //
  //   uploadValue();
  //
  // }
  //
  // uploadValue()async{
  //   await FirebaseFirestore
  //       .instance
  //       .runTransaction(
  //           (transaction) async {
  //         DocumentReference documentReference = FirebaseFirestore
  //             .instance
  //             .collection(
  //             'users')
  //             .doc(FirebaseAuth.instance.currentUser!.uid);
  //
  //         DocumentSnapshot
  //         snapShotDataUpdate =
  //         await transaction
  //             .get(documentReference);
  //
  //         print(snapShotDataUpdate['id']);
  //         print('snapShotDataUpdate[]');
  //
  //         transaction
  //             .update(
  //             documentReference,
  //             {
  //               'carbonFootPrint': snapShotDataUpdate['carbonFootPrint']=='' ? '1600': snapShotDataUpdate['carbonFootPrint'],
  //               'location': completeAddress,
  //               'lan' : lat.toString(),
  //               'long' : long.toString(),
  //             });
  //       });
  //
  // }
  //
  //
  // @override
  // void initState() {
  //   getCurrentLocation();
  //   super.initState();
  // }


  int _index = 0;
  List page = const [
    HomePage(),
    CalculatePage(check: false),
    ActivityPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[_index],
      extendBody: true,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight:  Radius.circular(30),)
        ),

        padding: EdgeInsets.only(
          bottom: AppSize.heightDivide(context, 40),

        ),
        child: FloatingNavbar(
          items: [
            FloatingNavbarItem(
              customWidget: SvgPicture.asset(
                'images/home.svg',
                color: _index == 0 ? AppColor.c009177 : AppColor.cFFFFFF,
              ),
            ),
            FloatingNavbarItem(
              customWidget: SvgPicture.asset(
                'images/calculate.svg',
                color: _index == 1 ? AppColor.c009177 : AppColor.cFFFFFF,
              ),
            ),
            FloatingNavbarItem(
              customWidget: SvgPicture.asset(
                'images/activity.svg',
                color: _index == 2 ? AppColor.c009177 : AppColor.cFFFFFF,
              ),
            ),
            FloatingNavbarItem(
              customWidget: SvgPicture.asset(
                'images/profile.svg',
                color: _index == 3 ? AppColor.c009177 : AppColor.cFFFFFF,
              ),
            ),
          ],
          currentIndex: _index,
          onTap: (val) {
            setState(() {
              _index = val;
            });
          },
          borderRadius: 30,
          backgroundColor: AppColor.c009177,
          iconSize: 30,
          selectedItemColor: AppColor.c009177,
          selectedBackgroundColor: AppColor.cFFFFFF,
          unselectedItemColor: AppColor.cFFFFFF,
          width: AppSize.widthMultiply(context, 0.99),
          elevation: 60,

          itemBorderRadius: 10,
          padding: EdgeInsets.symmetric(
            vertical: AppSize.heightDivide(context, 80),
          ),
        ),
      ),
    );
  }
}
