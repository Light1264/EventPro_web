import 'package:eventpro_web/services/local/local_cache.dart';
import 'package:eventpro_web/utils/constants.dart';
import 'package:eventpro_web/utils/locator.dart';
import 'package:eventpro_web/view/auth_screens/sign_up_screen.dart';
import 'package:eventpro_web/view/auth_screens/view_model/sign_in_view_model.dart';
import 'package:eventpro_web/view/bottom_nav_bar_screens/bottom_nav_bar.dart';
import 'package:eventpro_web/view/bottom_nav_bar_screens/cards_screen/view-model/card_view-model.dart';
import 'package:eventpro_web/view/bottom_nav_bar_screens/event_screens/upcoming_events.dart';
import 'package:eventpro_web/view/bottom_nav_bar_screens/event_screens/view_model/events_view_model.dart';
import 'package:eventpro_web/view/bottom_nav_bar_screens/profile_screen/view_model.dart/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'base_view_model.dart';
import 'view/auth_screens/view_model/auth_view_model.dart';
import 'view/onboarding_screens/onboarding_screen1.dart';
import 'view/side_bar_view.dart';
import 'view/sign_up_as/view_model/sign_up_as_view_model.dart';

Constants constant = Constants();
final LocalCache _localCache = locator();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignUpAsViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => EventsViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => CardsViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => BaseViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignInViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => EventsViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'EventPro',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: 
        // SignUpScreen()
        // const MyHomePage(pageOption: "UpcomingEvents",)
        _localCache.getToken() != null
            ? const MyHomePage(
                  pageOption: "UpcomingEvents",
                )
            : const SignUpScreen(),
      ),
    );
  }
}
