import 'package:eventpro_web/main.dart';
import 'package:flutter/material.dart';

class AllPost extends StatelessWidget {
  const AllPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constant.appBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Text(
                  "ALL POSTS",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: constant.appBlack,
                  ),
                ),
                const SizedBox(height: 30,),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
