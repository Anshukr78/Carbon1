import 'package:carbon/helper/colors.dart';
import 'package:carbon/helper/size.dart';
import 'package:carbon/helper/text_form_field.dart';
import 'package:carbon/helper/text_style.dart';
import 'package:carbon/widget/app_bar_widget.dart';
import 'package:carbon/widget/expansion_tile_widget.dart';
import 'package:flutter/material.dart';

class FAQs extends StatefulWidget {
  const FAQs({super.key});

  @override
  State<FAQs> createState() => _FAQsState();
}

class _FAQsState extends State<FAQs> {
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.cF1F7F2,
      appBar: appBarWidget(
        context: context,
        title: 'Get Help',
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: AppSize.heightMultiply(context, 1),
          child: Column(
            children: [
              searchTextFormField(context: context, controller: search),
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return faqsExpansionTileWidget(context);
                  },
                  separatorBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSize.widthDivide(context, 25)),
                      child: Divider(
                        thickness: 1,
                        color: AppColor.c000000w10,
                      ),
                    );
                  },
                  itemCount: 6)
            ],
          ),
        ),
      ),
    );
  }
}
