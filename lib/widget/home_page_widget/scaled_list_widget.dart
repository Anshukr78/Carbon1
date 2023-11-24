import 'package:carbon/helper/colors.dart';
import 'package:carbon/helper/size.dart';
import 'package:carbon/helper/text_style.dart';
import 'package:flutter/material.dart';
import 'package:scaled_list/scaled_list.dart';

class ScaledListWidget extends StatefulWidget {
  const ScaledListWidget({super.key});

  @override
  State<ScaledListWidget> createState() => _ScaledListWidgetState();
}

class _ScaledListWidgetState extends State<ScaledListWidget> {
  List colorList = [
    0xff513B56,
    0xff513B56,
    0xff513B56,
    0xff513B56,
    0xff513B56,
    0xff513B56,
    0xff513B56,
    0xff513B56,
    0xff513B56,
    0xff513B56,
  ];
  @override
  Widget build(BuildContext context) {
    return ScaledList(
      unSelectedCardHeightRatio: 0.35,
      showDots: false,
      itemBuilder: ((index, selectedIndex) {
        return GestureDetector(
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: ((context) =>
            //             ProductDetails(data: product[index]))));
          },
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppSize.widthDivide(context, 36),
                vertical: AppSize.heightDivide(context, 80)),
            height: selectedIndex == index
                ? AppSize.heightDivide(context, 2.8571)
                : AppSize.heightDivide(context, 3.0769),
            width: selectedIndex == index
                ? AppSize.widthDivide(context, 1.6216)
                : AppSize.widthDivide(context, 1.875),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color:
                  selectedIndex == index ? AppColor.cCCF2E9 : AppColor.cFFFFFF,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: selectedIndex == index
                      ? AppSize.heightDivide(context, 4.4444)
                      : AppSize.heightDivide(context, 4.8484),
                  // width: AppSize.widthMultiply(context, 1),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/product.png'),
                          fit: BoxFit.cover)),
                ),
                Container(
                  height: selectedIndex == index
                      ? AppSize.heightDivide(context, 10.5263)
                      : AppSize.heightDivide(context, 12.1212),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Product Name',
                        style: selectedIndex == index
                            ? AppText.montserrat60015pxc000000
                            : AppText.montserrat60014pxc000000,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Carbon',
                            style: selectedIndex == index
                                ? AppText.montserrat50014pxc000000
                                : AppText.montserrat50013pxc000000,
                          ),
                          Container(
                            height: selectedIndex == index
                                ? AppSize.heightDivide(context, 30.7692)
                                : AppSize.heightDivide(context, 33.3333),
                            width: selectedIndex == index
                                ? AppSize.widthDivide(context, 5)
                                : AppSize.widthDivide(context, 6.9230),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColor.c009177,
                            ),
                            child: Center(
                              child: Text(
                                "10%",
                                style: selectedIndex == index
                                    ? AppText.montserrat60014pxcFFFFFF
                                    : AppText.montserrat60013pxcFFFFFF,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
      itemCount: colorList.length,
      itemColor: (indexColor) {
        return Color(colorList[indexColor]);
      },
    );
  }
}
