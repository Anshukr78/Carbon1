import 'package:carbon/helper/colors.dart';
import 'package:carbon/helper/size.dart';
import 'package:carbon/widget/app_bar_widget.dart';
import 'package:carbon/widget/home_page_widget/swipe_widget.dart';
import 'package:flutter/material.dart';

class GreenEnergyGuide extends StatefulWidget {
  const GreenEnergyGuide({super.key});

  @override
  State<GreenEnergyGuide> createState() => _GreenEnergyGuideState();
}

class _GreenEnergyGuideState extends State<GreenEnergyGuide> {
  List<Map<String, dynamic>> mapList = [
    {
      'image': 'images/guide.png',
      'title': 'Green Energy',
      'text':
          'With the rising worries about climate change and the destruction caused by non-renewable energy sources to the environment, people are looking for alternative sources of energy.It is high time that we all become familiar with and understand the importance of green energy. This guide gives you extensive knowledge of green energy, its significance, and the options you can choose.\nThis is in contrast to traditional energy sources such as fossil fuels such as coal, gas, and oil, which emit harmful greenhouse gases into the atmosphere and significantly contribute to climate change.'
    },
    {
      'image': 'images/guide.png',
      'title': 'Solar Energy',
      'text':
          'Solar energy is one of the most popular types of green energy. It involves harnessing the power of the sun to generate electricity. This is done through solar panels, which convert sunlight into electricity. Solar energy is clean, renewable, and widely available, making it an attractive option for many people.'
    },
    {
      'image': 'images/guide.png',
      'title': 'Wind Energy',
      'text':
          "Wind energy is another popular yet clean and renewable form of green energy. It involves harnessing the power of the wind to generate electricity. This is done through wind turbines, which convert the wind's kinetic energy into electrical energy."
    },
    {
      'image': 'images/guide.png',
      'title': 'Hydro Energy',
      'text':
          "Hydro energy involves harnessing the power of moving water to generate electricity. This is done through hydroelectric power plants, which convert the kinetic energy of moving water into electrical energy. Hydro energy is a reliable source of green energy and can be found in many parts of the world."
    },
    {
      'image': 'images/guide.png',
      'title': 'BioEnergy',
      'text':
          "Bioenergy involves using organic matter, for instance, crops, wood, or waste, to generate energy. This organic matter is burned to release heat, which can be used to generate electricity or power heating systems. Bioenergy is a form of renewable energy that can help reduce the amount of waste that ends up in landfills."
    },
    {
      'image': 'images/guide.png',
      'title': 'Geothermal Energy',
      'text':
          "Finally, geothermal energy involves harnessing the heat from the earth to generate electricity. This is done through geothermal power plants, which tap into the heat stored in the earth's crust to produce electricity. Geothermal energy is also a clean and renewable source of green energy that can be found in different parts of the world."
    },
    {
      'image': 'images/guide.png',
      'title': '',
      'text':
          "Green energy enables you to reduce your impact on the environment.\n\nif you are serious and want to help reduce your carbon footprint, investing in green energy is a great way to start."
    },
  ];

  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.cF1F7F2,
        appBar: appBarWidget(
          context: context,
          title: 'Green Energy Guide',
        ),
        body: SizedBox(
          height: AppSize.heightMultiply(context, 0.8),
          child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  pageIndex = value;
                });
              },
              itemCount: mapList.length,
              itemBuilder: (context, index) {
                return SwipeWidget(
                  map: mapList[index],
                  swipe: mapList.length == index + 1,
                );
              }),
        ));
  }
}
