import 'package:carbon/helper/colors.dart';
import 'package:carbon/helper/size.dart';
import 'package:carbon/widget/app_bar_widget.dart';
import 'package:carbon/widget/home_page_widget/swipe_widget.dart';
import 'package:flutter/material.dart';

class SustainableLifestyleTips extends StatefulWidget {
  const SustainableLifestyleTips({super.key});

  @override
  State<SustainableLifestyleTips> createState() =>
      _SustainableLifestyleTipsState();
}

class _SustainableLifestyleTipsState extends State<SustainableLifestyleTips> {
  List<Map<String, dynamic>> mapList = [
    {
      'image': 'images/tips.png',
      'title': 'Sustainable LifeStyle',
      'text':
          'Climate change, air pollution, world hunger, and water scarcity are among the most pressing global problems. The toot of the problem is that most of us, unfortunately, do not live sustainably.\nThe carbon footprint indicates how many raw materials we use and how many pollutants we cause with our consumption.Sustainable living is a philosophy to reduce personal and societal environmental impact.\n\nOur tips will help you to do this. Have fun!'
    },
    {
      'image': 'images/tips.png',
      'title': 'Sustainable Eating',
      'text':
          'The most effective way to improve your ecological footprint is to avoid or reduce the consumption of animal-based foods.\nSeasonal foods from your region travel less miles and are therefore more climate-friendly and cheaper.\nSustainable living or living green also means wasting less.Use a shopping list to buy what you really need.\nSustainability includes social responsibility as well as ecology.If you buy organic, you reduce your carbon footprint and support environmentally friendly food production.'
    },
    {
      'image': 'images/tips.png',
      'title': 'Sustainable Commuting',
      'text':
          "Fly less,with air travel you undeniably boost your carbon footprint. Because no means of transport is more harmful to the climate than air travel.When flying: pack light. More weight = more fuel = more CO2 emissions\n\nBike instead of driving:car traffic is not only a burden on cities, but on our climate as a whole. In cities, it is easier to move in an environmentally friendly way. Public transport and rail connections make it possible. The healthiest way, of course, is to bike. It helps you stay fit and protects the environment. If you want to buy a car yourself, find out about environmentally-friendly models."
    },
    {
      'image': 'images/tips.png',
      'title': 'Reduce plastic waste',
      'text':
          "Plastic packaging is everywhere, from food to toys, cosmetics to electronics. These tips will help you reduce plastic waste: Buy unpackaged things whenever possible, for example at an unpackaged shop. If you can't avoid it, dispose of plastic directly when shopping in the yellow bins at the shops or in the yellow bins at home. For liquid packagings, such as all-purpose cleaners, look for the'EU Ecolabel' label."
    },
    {
      'image': 'images/tips.png',
      'title': 'Save paper and electricity',
      'text':
          "You can also work sustainably in the office and at school: Save paper and print out as little as possible. Use recycled paper for printers and notes.\n\nYou can improve your carbon footprint enormously by switching to renewable energy sources for your electricity. Comparison portals help you find the best providers."
    },
    {
      'image': 'images/tips.png',
      'title': '',
      'text':
          "Our list of tips for sustainable living is very extensive. You can't possibly implement everything, but every action helps. Some things have a bigger, some a smaller effect on the environment and climate change. Sometimes it's easier for you to live ecologically, sometimes you don't have the energy to change anything. But that is just fine, after all, we are all humans.\n\nOur mission is 'creating tomorrow' - for a liveable and sustainable future."
    },
  ];

  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.cF1F7F2,
        appBar: appBarWidget(
          context: context,
          title: 'Sustainable Lifestyle Tips',
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
