import 'package:eventpro_web/components/dialog_widget.dart';
import 'package:eventpro_web/utils/dialog.dart';
import 'package:eventpro_web/view/side_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bottom_nav_bar_screens/event_screens/upcoming_events.dart';
import 'bottom_nav_bar_screens/profile_screen/view_model.dart/profile_view_model.dart';

class SidebarMenu extends StatefulWidget {
  @override
  State<SidebarMenu> createState() => _SidebarMenuState();
}

class _SidebarMenuState extends State<SidebarMenu> {
  List<String> sideBarOptions = [
    "Events",
    "Search",
    "Cards",
    "Profile",
  ];

  List<Icon> sideBarIcons = [
    const Icon(Icons.calendar_month_outlined),
    const Icon(Icons.search),
    const Icon(Icons.message),
    const Icon(Icons.person),
  ];
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    ProfileViewModel profileViewModel = context.watch<ProfileViewModel>();
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: sideBarOptions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      // Handle navigation to the home screen.
                      setState(() {
                        selectedIndex = index;
                      });
                      print(selectedIndex);
                      if (index == 0) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => const MyHomePage(
                                  pageOption: "UpcomingEvents",
                                )),
                          ),
                        );
                      } else if (index == 1) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => const MyHomePage(
                                  pageOption: "Search",
                                )),
                          ),
                        );
                      } else if (index == 2) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => const MyHomePage(
                                  pageOption: "Cards",
                                )),
                          ),
                        );
                      } else if (index == 3) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => const MyHomePage(
                                  pageOption: "Profile",
                                )),
                          ),
                        );
                      }
                    },
                    leading: sideBarIcons[index],
                    title: Text(sideBarOptions[index]),
                    tileColor: selectedIndex == index
                        ? Colors.grey[300]
                        : Colors.transparent,
                  );
                },
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Handle navigation to the home screen.
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Log Out'),
              onTap: () {
                showMyLogOutDialog(context, () {
                  // if (profileViewModel.formKey.currentState?.validate() ??
                  //     false) {
                  //   FocusScope.of(context).unfocus();
                    profileViewModel.logOut(
                      context: context,
                    );
                  // }
                });
              },
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
