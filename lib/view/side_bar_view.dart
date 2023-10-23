import 'package:eventpro_web/view/bottom_nav_bar_screens/cards_screen/all_cards_screen.dart';
import 'package:eventpro_web/view/bottom_nav_bar_screens/event_screens/event_detail.dart';
import 'package:eventpro_web/view/bottom_nav_bar_screens/event_screens/schedule_an_event.dart';
import 'package:eventpro_web/view/bottom_nav_bar_screens/event_screens/upcoming_events.dart';
import 'package:eventpro_web/view/bottom_nav_bar_screens/profile_screen/profile_screen.dart';
import 'package:eventpro_web/view/bottom_nav_bar_screens/search_screens/search_screen.dart';
import 'package:eventpro_web/view/bottom_nav_bar_screens/search_screens/user_details.dart';
import 'package:eventpro_web/view/side_bar.dart';
import 'package:flutter/material.dart';

import 'bottom_nav_bar_screens/cards_screen/schedule_a _card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.pageOption, this.eventDetails, this.imgString});
  final String pageOption;
  final Map<String, String>? eventDetails;
  final Map<String, String>? imgString;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    // No need to access MediaQuery here.
  }

  @override
  Widget build(BuildContext context) {
    // Access MediaQuery in the build method when needed.
    bool isLargeScreen = MediaQuery.of(context).size.width >= 1000;
    // bool isSemiLargeScreen = MediaQuery.of(context).size.width >= 300;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Image.asset(
            "assets/eventpro_logo.png",
            scale: 8,
          ),
        ),
        elevation: 1,
        automaticallyImplyLeading: false,
        leading: isLargeScreen
            ? null // Hide the hamburger icon on larger screens.
            : IconButton(
                icon: Icon(Icons.menu), // Hamburger icon
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              ),
      ),
      drawer: isLargeScreen
          ? null
          : SidebarMenu(), // Hide the drawer on larger screens.
      body: Row(
        children: [
          isLargeScreen ? SidebarMenu() : SizedBox(),
          Expanded(child: homePageFunction(isLargeScreen)),
          isLargeScreen
              ? const SizedBox(
                  width: 300,
                )
              : const SizedBox(),
          // isSemiLargeScreen
          //   ? SizedBox(width: 150,):
          //   SizedBox()
        ],
      ),
    );
  }

  homePageFunction(isLargeScreen) {
    if (widget.pageOption == "UpcomingEvents") {
      return UpComingEvents();
    } else if (widget.pageOption == "Search") {
      return SearchScreen();
    } else if (widget.pageOption == "Cards") {
      return AllCardsScreen();
    } else if (widget.pageOption == "Profile") {
      return ProfileScreen();
    } else if (widget.pageOption == "EventDetails") {
      return EventDetails(
        eventDetails: widget.eventDetails,
      );
    } else if (widget.pageOption == "ScheduleEvent") {
      return ScheduleEvent();
    } else if (widget.pageOption == "UserDetails") {
      return UserDetails();
    } else if (widget.pageOption == "ScheduleCard") {
      return ScheduleACard(svgString: widget.imgString);
    }
  }
}
