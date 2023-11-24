import 'package:carbon/model/userModel.dart';
import 'package:carbon/screen/chat/chat_details.dart';
import 'package:flutter/material.dart';

import '../../helper/colors.dart';
import '../../helper/size.dart';
import '../../helper/text_style.dart';



class ChatWidget extends StatelessWidget {
  final UserModel userModel;
  const ChatWidget({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatDetails(userModel: userModel,)));
      },
      child: Container(
        color: Colors.transparent,
        height: AppSize.heightDivide(context, 13),
        //width: double.infinity,
        child: Row(
          children: [
            Expanded(
              flex :10,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.widthDivide(context, 12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(AppSize.heightMultiply(context, 0.3)),
                      child: SizedBox(
                          height: 45,
                          width: 45,
                          child: userModel.photoUrl.isEmpty ? Icon(Icons.account_circle_rounded, size: 50, color: AppColor.cD9D9D9w40,) : Image.network(userModel.photoUrl,
                            fit: BoxFit.fill,
                          )
                      ),
                    ),
                    SizedMedia.widthDivide(context, AppSize.widthDivide(context, 12)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${userModel.first_name} ${userModel.last_name}', style: AppText.montserrat50015pxc000000,),
                        const SizedBox(height: 2,),
                        Text('Good to go.', style: AppText.montserrat40012pxc000000,)
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Text('Sun', style: AppText.montserrat40012pxc000000,))
          ],
        ),
      ),
    );
  }
}
