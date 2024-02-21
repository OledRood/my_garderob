import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_garderob/colors/garderob_colors.dart';

import '../resources/image_clother.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({super.key});

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GarderobColors.wbackground,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    height: 80,
                    width: double.infinity,
                    child: Image.asset(ImageClother.hat, fit: BoxFit.contain),
                  ),
                  SizedBox(height: 5),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 180,
                      width: double.infinity,
                      child: Image.asset(ImageClother.tShort, fit: BoxFit.contain),

                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 100),
                    width: double.infinity,
                    child: Image.asset(ImageClother.jeans, fit: BoxFit.cover,),
                  ),
                  SizedBox(height: 5),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 120),
                    height: 100,
                    width: double.infinity,
                    child: Image.asset(ImageClother.shoose, fit: BoxFit.contain),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
