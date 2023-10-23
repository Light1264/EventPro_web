import 'package:eventpro_web/main.dart';
import 'package:eventpro_web/view/bottom_nav_bar_screens/event_screens/schedule_an_event.dart';
import 'package:eventpro_web/view/side_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/title_widget.dart';
import '../../side_bar.dart';
import 'component/upcoming_event_date.dart';
import 'component/upcoming_event_widget.dart';
import 'view_model/events_view_model.dart';

class UpComingEvents extends StatelessWidget {
  const UpComingEvents({super.key});

  @override
  Widget build(BuildContext context) {
    EventsViewModel _eventsViewModel = context.watch<EventsViewModel>();
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(
              //   height: 10,
              // ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 15, 0),
                child: Row(
                  children: [
                    CircleAvatar(
                      minRadius: 15,
                      backgroundColor: constant.appBlack,
                      child: const Icon(Icons.person),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.notifications,
                      size: 28,
                      color: constant.appColorDark,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    const TitleWidget(
                      topText: "UPCOMING",
                      bottomText: "EVENTS",
                    ),
                    const Spacer(),
                    CircleAvatar(
                      minRadius: 18,
                      backgroundColor: constant.appWhite,
                      child: Icon(
                        Icons.search,
                        size: 25,
                        color: constant.appColorDark,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 27,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: constant.appBlack,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          color: Color.fromARGB(255, 235, 209, 240),
                        ),
                        child: Image.asset("assets/flower.png"),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 18, 14, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "JULY'26",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: constant.appWhite,
                              ),
                            ),
                            Text(
                              "16 days left",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w300,
                                color: constant.appWhite,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 27,
              ),
              ...List.generate(
                _eventsViewModel.eventDetails.length,
                (int) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) => MyHomePage(
                                pageOption: "EventDetails",
                                eventDetails:
                                    _eventsViewModel.eventDetails[int],
                              )),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24),
                              child: Divider(
                                color: Color.fromARGB(255, 181, 181, 181),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 80, right: 24),
                              child: Divider(
                                color: constant.appBlack,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            UpcomingEventDate(
                              index: int,
                              eventDetails: _eventsViewModel.eventDetails[int],
                            ),
                            // UpcomingEventWidget(
                            //   index: int,
                            //   eventDetails: _eventsViewModel.eventDetails[int],
                            // ),
                            Flexible(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: ((context) => MyHomePage(
                                            pageOption: "EventDetails",
                                            eventDetails: _eventsViewModel
                                                .eventDetails[int],
                                          )),
                                    ),
                                  );
                                },
                                child: UpcomingEventWidget(
                                  index: int,
                                  eventDetails:
                                      _eventsViewModel.eventDetails[int],
                                ),
                              ),
                            ),
                          ],
                        ),
                        // ...List.generate(
                        //   int == 0 ? 1 : 0,
                        //   (int) {
                        //     return const Column(
                        //       children: [
                        //         Padding(
                        //           padding: EdgeInsets.fromLTRB(80, 8, 24, 5),
                        //           child: Divider(
                        //             color: Color.fromARGB(255, 169, 168, 168),
                        //           ),
                        //         ),
                        //         Padding(
                        //           padding: EdgeInsets.only(left: 80),
                        //           child: UpcomingEventWidget(),
                        //         ),
                        //       ],
                        //     );
                        //   },
                        // ),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: FloatingActionButton(
              elevation: 0,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => const MyHomePage(
                          pageOption: "ScheduleEvent",
                        )),
                  ),
                );
                // .then((value) => setState((){}));
              },
              backgroundColor: constant.appColorDark,
              child: Center(
                child: Icon(
                  Icons.add,
                  size: 50,
                  color: constant.appWhite,
                ),
              ),
            ),
          ),
        ),
      ],
    );
    //   floatingActionButton: FloatingActionButton(
    //     elevation: 0,
    //     onPressed: () {
    //       Navigator.of(context).push(
    //         MaterialPageRoute(
    //           builder: ((context) => const ScheduleEvent()),
    //         ),
    //       );
    //       // .then((value) => setState((){}));
    //     },
    //     backgroundColor: constant.appColorDark,
    //     child: Center(
    //       child: Icon(
    //         Icons.add,
    //         size: 50,
    //         color: constant.appWhite,
    //       ),
    //     ),
    //   ),
    // );
  }
}
