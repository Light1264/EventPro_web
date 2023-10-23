import 'package:eventpro_web/view/bottom_nav_bar_screens/cards_screen/components/tab_bar_categories.dart';
import 'package:eventpro_web/view/bottom_nav_bar_screens/cards_screen/view-model/card_view-model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../main.dart';

enum Category { birthdays, weddings, valentine, condolences }

class AllCardsScreen extends StatefulWidget {
  const AllCardsScreen({super.key});

  @override
  State<AllCardsScreen> createState() => _AllCardsScreenState();
}

late TabController tabController;

class _AllCardsScreenState extends State<AllCardsScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    CardsViewModel cardsViewModel = context.watch<CardsViewModel>();
    return DefaultTabController(
      length: 4,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 44,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Text(
                    "Put a smile on someones face\nwith our customized cards",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: constant.appBlack,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.camera_alt,
                    color: constant.appColorDark,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TabBar(
              enableFeedback: false,
              isScrollable: true,
              controller: tabController,
              onTap: (index) {
                tabController.animateTo(
                  index,
                  duration: const Duration(seconds: 2),
                  curve: Curves.easeInOut,
                );
              },
              //padding: EdgeInsets.zero,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 2,
              indicatorColor: constant.appColorDark,
              labelPadding: EdgeInsets.zero,
              indicatorPadding: EdgeInsets.zero,
              tabs: [
                for (Category item in Category.values)
                  Tab(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        item.name,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: constant.appBlack,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  TabBarCategories(
                    itemCount: cardsViewModel.wishCards.length,
                    imgString: cardsViewModel.wishCards,
                  ),
                  TabBarCategories(
                    itemCount: cardsViewModel.wishCards.length,
                    imgString: cardsViewModel.wishCards,
                  ),
                  TabBarCategories(
                    itemCount: cardsViewModel.wishCards.length,
                    imgString: cardsViewModel.wishCards,
                  ),
                  TabBarCategories(
                    itemCount: cardsViewModel.wishCards.length,
                    imgString: cardsViewModel.wishCards,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
