import 'package:flutter/material.dart';

class WebWelcomeScreen extends StatefulWidget {
  const WebWelcomeScreen({super.key});

  @override
  State<WebWelcomeScreen> createState() => _WebWelcomeScreenState();
}

class _WebWelcomeScreenState extends State<WebWelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Image.asset(
            "assets/eventpro_logo.png",
            scale: 8,
          ),
        ),
        elevation: 1,
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                border: Border.all()
              ),
              child: Text(
                "About",
                
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                border: Border.all()
              ),
            ),
          ),
        ],
      ),
    );
  }
}
