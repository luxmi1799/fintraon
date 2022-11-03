import 'package:flutter/material.dart';
import 'package:frig/mpin_animation.dart';

class mpinpage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return _mpinpage();
  }
}

class _mpinpage extends State<mpinpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
            Container(
              width: double.maxFinite,
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              color: Colors.black.withOpacity(0.5),
            ),
            Opacity(
                opacity: 1,
                child: Image.asset(
                  'assets/backg.png',
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
                  fit: BoxFit.cover,
                )
            ),
            //SafeArea(child: Center(child: mpinanimation())),
          ],
        )
    );
  }
}