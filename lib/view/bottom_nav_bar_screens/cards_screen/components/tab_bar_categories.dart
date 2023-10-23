import 'package:eventpro_web/main.dart';
import 'package:eventpro_web/view/bottom_nav_bar_screens/cards_screen/schedule_a%20_card.dart';
import 'package:eventpro_web/view/side_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/size_config.dart';

class TabBarCategories extends StatelessWidget {
  TabBarCategories(
      {super.key, required this.itemCount, required this.imgString});
  int itemCount;
  List<Map<String, String>> imgString;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    bool isLargeScreen = MediaQuery.of(context).size.width >= 1500;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isLargeScreen ? 6 : 3, // Number of columns
      ),
      itemCount: itemCount, // Number of items in the grid
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => MyHomePage(
                            pageOption: "ScheduleCard",
                            imgString: imgString[index],
                          )
                      // ScheduleACard(svgString: imgString[index])
                      ),
                ),
              );
            },
            child: Container(
                width: double.infinity,
                height: 105,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.transparent,
                  image: DecorationImage(
                    image: AssetImage(
                      imgString[index]["wishCard"].toString(),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      "assets/wish_card_next_button.png",
                      scale: isLargeScreen ? getProportionateScreenHeight(8): getProportionateScreenHeight(6),
                    ),
                  ),
                )),
          ),
        );
      },
    );
  }
}
