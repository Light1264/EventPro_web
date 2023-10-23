// import 'package:eventpro_web/main.dart';
// import 'package:eventpro_web/view/bottom_nav_bar_screens/cards_screen/all_cards_screen.dart';
// import 'package:eventpro_web/view/bottom_nav_bar_screens/event_screens/upcoming_events.dart';
// import 'package:eventpro_web/view/bottom_nav_bar_screens/profile_screen/profile_screen.dart';
// import 'package:eventpro_web/view/bottom_nav_bar_screens/search_screens/search_screen.dart';
// import 'package:flutter/material.dart';

// // ignore: must_be_immutable
// class BottomNavBar extends StatefulWidget {
//   BottomNavBar({
//     Key? key,
//     this.index,
//   }) : super(key: key);
//   int? index;

//   @override
//   State<BottomNavBar> createState() => _BottomNavBarState();
// }

// class _BottomNavBarState extends State<BottomNavBar> {
//   int current_index = 0;

//   void update_index(int value) {
//     setState(() {
//       current_index = value;
//     });
//   }

//   @override
//   initState() {
//     super.initState();
//     if (widget.index != null) {
//       current_index = widget.index!;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     //The list "screens" contains all pages to be accessed from the bottomNavBar
//     List<Widget> screens = [
//       const UpComingEvents(),
//       const SearchScreen(),
//       const AllCardsScreen(),
//       ProfileScreen()
//     ];

//     return Scaffold(
//       body: IndexedStack(
//         index: current_index,
//         children: screens,
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         enableFeedback: false,
//         backgroundColor: constant.appBackgroundColor,
//         type: BottomNavigationBarType.fixed,
//         currentIndex: current_index,
//         onTap: update_index,
//         showSelectedLabels: true,
//         showUnselectedLabels: false,
//         selectedFontSize: 15,
//         // unselectedFontSize: 5,
//         selectedItemColor: constant.appColorDark,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.calendar_month_outlined,
//               size: 25,
//               color: Color.fromRGBO(0, 0, 0, 0.5),
//             ),
//             activeIcon: Padding(
//               padding: EdgeInsets.only(bottom: 5, top: 3),
//               child: Icon(
//                 Icons.calendar_month_outlined,
//                 size: 27,
//               ),
//             ),
//             label: 'Event',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.search,
//               size: 25,
//               color: Color.fromRGBO(0, 0, 0, 0.5),
//             ),
//             activeIcon: Padding(
//               padding: EdgeInsets.only(bottom: 5, top: 3),
//               child: Icon(
//                 Icons.search,
//                 size: 27,
//               ),
//             ),
//             label: 'Search',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.message,
//               size: 25,
//               color: Color.fromRGBO(0, 0, 0, 0.3),
//             ),
//             activeIcon: Padding(
//               padding: EdgeInsets.only(bottom: 5, top: 3),
//               child: Icon(
//                 Icons.message,
//                 size: 27,
//               ),
//             ),
//             label: 'Wishes',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.person,
//               size: 25,
//               color: Color.fromRGBO(0, 0, 0, 0.4),
//             ),
//             activeIcon: Padding(
//               padding: EdgeInsets.only(bottom: 5, top: 3),
//               child: Icon(
//                 Icons.person,
//                 size: 30,
//               ),
//             ),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }
// }
