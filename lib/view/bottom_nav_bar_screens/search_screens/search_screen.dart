import 'package:eventpro_web/components/app_textfield.dart';
import 'package:eventpro_web/main.dart';
import 'package:eventpro_web/view/bottom_nav_bar_screens/search_screens/user_details.dart';
import 'package:eventpro_web/view/side_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../event_screens/view_model/events_view_model.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    EventsViewModel searchViewModel = context.watch<EventsViewModel>();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                "FIND PROFESSIONALS",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: constant.appBlack,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            AppTextField(
              textFieldHeight: 50,
              fillColor: constant.appWhite,
              boxShadow: false,
              textInputType: TextInputType.name,
              textFieldController: searchViewModel.search,
              hintText: "Search here",
              prefixIcon: const Icon(
                Icons.search,
                size: 20,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Icon(
                    Icons.search,
                    size: 25,
                    color: constant.appGrey,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: constant.appGrey,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 26,
            ),
            ...List.generate(
              10,
              (int) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) => const MyHomePage(pageOption: "UserDetails",)),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                          minRadius: 23,
                          backgroundColor: constant.appBlack,
                          child: Icon(
                            Icons.person,
                            color: constant.appBackgroundColor,
                          ),
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Nara Berry",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: constant.appBlack,
                              ),
                            ),
                            Text(
                              "Event Planner & Artist",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: constant.appGrey,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
