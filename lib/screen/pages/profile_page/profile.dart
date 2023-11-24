import 'package:carbon/helper/colors.dart';
import 'package:carbon/helper/size.dart';
import 'package:carbon/helper/text_style.dart';
import 'package:carbon/screen/pages/profile_page/certificate.dart';
import 'package:carbon/screen/pages/profile_page/change_password.dart';
import 'package:carbon/screen/pages/profile_page/faqs.dart';
import 'package:carbon/screen/pages/profile_page/personal_details.dart';
import 'package:carbon/screen/pages/profile_page/privacy_policy.dart';
import 'package:carbon/screen/pages/profile_page/reward.dart';
import 'package:carbon/screen/pages/profile_page/terms_condiition.dart';
import 'package:carbon/screen/splash_screen.dart';
import 'package:carbon/widget/app_bar_widget.dart';
import 'package:carbon/widget/list_tile_widget.dart';
import 'package:carbon/widget/profile_page_widget.dart/container_widget.dart';
import 'package:carbon/widget/profile_page_widget.dart/profile_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:iconify_flutter/icons/charm.dart';
import 'package:iconify_flutter/icons/gg.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:iconify_flutter/icons/ri.dart';

import '../../../helper/delete.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool loader = false;

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return DeleteConfirmationDialog(
          onConfirm: () {
            _deleteAccount();
          },
        );
      },
    );
  }

  void _deleteAccount() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        await user.delete();
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SplashScreen()));
      } catch (e) {
        // Handle any errors that occur during deletion
        print('Error deleting account: $e');
        // Show error alert or display an error message
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColor.cF1F7F2,
      appBar: bottomNavBarAppBarWidget(
          context: context, title: 'Profile', leading: () {}, check: false),
      body: loader
          ? const Center(
              child: CircularProgressIndicator(
                //color: AppColor.c9ABAB6,
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.widthDivide(context, 30),
                ),
                child: Column(
                  children: [
                    const ProfileWidget(),
                    profileContainerWidget(
                      context: context,
                      text: 'My Account',
                      bgColor: AppColor.cFFFFFF,
                      child: Column(
                        children: [
                          ProfileListTileWidget(
                            icon: Ph.user,
                            next: true,
                            title: 'Personal Details',
                            call: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PersonalDetails()));
                            },
                          ),
                          ProfileListTileWidget(
                            icon: Ri.lock_password_line,
                            next: true,
                            title: 'Change Password',
                            call: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ChangePassword()));
                            },
                          ),
                          // ProfileListTileWidget(
                          //     icon: Charm.north_star,
                          //     next: true,
                          //     title: 'Certificate',
                          //     call: () {
                          //       Navigator.push(
                          //           context,
                          //           MaterialPageRoute(
                          //               builder: (context) => const Certificate()));
                          //     }),
                          ProfileListTileWidget(
                            icon: Ri.award_line,
                            next: true,
                            title: 'Reward',
                            call: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Reward()));
                            },
                          ),
                        ],
                      ),
                    ),
                    profileContainerWidget(
                      context: context,
                      text: 'About Us',
                      bgColor: AppColor.cFFFFFF,
                      child: Column(
                        children: [
                          ProfileListTileWidget(
                            icon: Carbon.ibm_cloud_pak_security,
                            next: true,
                            title: 'Privacy Policy',
                            call: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PrivacyPolicy(),
                                ),
                              );
                            },
                          ),
                          ProfileListTileWidget(
                            icon: Gg.file_document,
                            next: true,
                            title: 'Terms & Conditions',
                            call: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const TermsCondition(),
                                ),
                              );
                            },
                          ),
                          ProfileListTileWidget(
                            icon: Bi.info_lg,
                            next: true,
                            title: 'FAQs',
                            call: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const FAQs(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    profileContainerWidget(
                      context: context,
                      text: '',
                      bgColor: AppColor.cFFFFFF,
                      child: Column(
                        children: [
                          ProfileListTileWidget(
                              icon: Mdi.logout,
                              next: false,
                              title: 'Logout',
                              call: () {


                                setState(() {
                                  loader = true;
                                });
                                FirebaseAuth.instance.signOut();

                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SplashScreen()));
                                setState(() {
                                  loader = false;
                                });
                              }),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: AppSize.heightDivide(context, 40),
                          horizontal: AppSize.widthDivide(context, 6)),
                      child: Divider(
                        thickness: 1,
                        color: AppColor.cCCF2E9,
                      ),
                    ),
                    Text(
                      'Warning Zone !',
                      style: AppText.montserrat40012pxc000000w70,
                    ),
                    profileContainerWidget(
                      context: context,
                      text: '',
                      bgColor: AppColor.c9ABAB6,
                      child: Column(
                        children: [
                          ProfileListTileWidget(
                              icon: Ri.delete_bin_6_line,
                              next: false,
                              title: 'Delete My Account',
                              call: () {
                                _showConfirmationDialog(context);
                              }),
                        ],
                      ),
                    ),
                    SizedMedia.heightDivide(context, 10)
                  ],
                ),
              ),
            ),
    );
  }
}
