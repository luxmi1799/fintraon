import 'dart:math';
import 'package:animated_widgets/widgets/scale_animated.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frig/home_page.dart';
import 'package:frig/login.dart';
import 'package:lottie/lottie.dart';


const double _shadowHeight = 4;
double _position = 4;

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> with TickerProviderStateMixin {
  final double _height = 55 - _shadowHeight;
  late AnimationController _lottieAnimation;
  var expanded = false;
  double _bigFontSize = kIsWeb ? 234 : 178;
  final transitionDuration = Duration(seconds: 1);

  double initialHeight = 150;
  double initialImageHeight = 150;
  double expandedImageHeight = 200;
  bool enabled = false;
  void poopAnimationIn() async {
    setState(() {
      initialImageHeight = expandedImageHeight;
    });
    await Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        initialImageHeight = initialHeight;
      });
    });
  }

  @override
  void initState() {
    _lottieAnimation = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    Future.delayed(Duration(seconds: 1))
        .then((value) => setState(() => expanded = true))
        .then((value) => Duration(seconds: 2))
        .then(
          (value) => Future.delayed(Duration(seconds: 1)).then(
            (value) => _lottieAnimation.forward().then(
              (value) => Navigator.of(context)
              .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => login()), (route) => false),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      alignment: Alignment.center,
      children:
      [
        Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(children: [
                  Container(
                    width: double.maxFinite,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  Opacity(
                      opacity: 1,
                      child: Image.asset(
                        'assets/backg.png',
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        fit: BoxFit.cover,
                      )
                  ),
                ]),
              ],
            )
        ),

        Scaffold(
           backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 120,
                  ),
                  ScaleAnimatedWidget.tween(
                    enabled: true,
                    duration: Duration(milliseconds: 1000),
                    scaleDisabled: 0.5,
                    scaleEnabled: 1,

                    //your widget
                    child: Container(
                      height: 150,
                      width: 150,
                      child: Image.asset("assets/logo.png")
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedDefaultTextStyle(
                        duration: transitionDuration,
                        curve: Curves.fastOutSlowIn,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: !expanded ? _bigFontSize : 45,
                          fontFamily: 'kompot',
                          fontWeight: FontWeight.w600,
                        ),
                        child: Text(
                          "F"
                        )
                      ),
                      AnimatedCrossFade(
                        firstCurve: Curves.fastOutSlowIn,
                        crossFadeState: !expanded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                        duration: transitionDuration,
                        firstChild: Container(),
                        secondChild: _logoRemainder(),
                        alignment: Alignment.centerLeft,
                        sizeCurve: Curves.easeInOut,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),




        Offstage(
          offstage: true,
          child: Positioned(
            left: 20,
            right: 20,
            bottom: 20,
            child:Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTapUp: (_) {
                  setState(() {
                    _position = 4;
                  });
                },
                onTapDown: (_) {
                  setState(() {
                    _position = 0;
                  });
                },
                onTapCancel: () {
                  setState(() {
                    _position = 4;
                  });
                },
                child: Container(
                  height: _height + _shadowHeight,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        child: Container(
                          height: _height,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                            color: Color(0xffEC1C24).withOpacity(0.5),
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                        ),
                      ),
                      AnimatedPositioned(
                        curve: Curves.easeIn,
                        bottom: _position,
                        duration: Duration(milliseconds: 70),
                        child: Container(
                          height: _height,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                            color: Color(0xffEC1C24),
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'GET STARTED',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'lato',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ]
    );
  }

  Widget _logoRemainder() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "intracon",
          style: TextStyle(
            color: Colors.white,
            fontSize: 45,
            fontFamily: 'kompot',
            fontWeight: FontWeight.w600,
          ),
        ),
        LottieBuilder.asset(
          'assets/coin.json',
          onLoaded: (composition) {
            _lottieAnimation..duration = composition.duration;
          },
          frameRate: FrameRate.max,
          repeat: false,
          animate: false,
          height: 100,
          width: 100,
          controller: _lottieAnimation,
        )
      ],
    );
  }
//
// Widget _logoAbbreviated() {
//   return Container(
//     // color: Colors.blue,
//     height: 150,
//     child: Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [],
//     ),
//   );
// }
//
// Widget _logoExtended() {
//   return Container(
//     height: 150,
//     child: Row(
//       // mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         Expanded(
//           child: Text(
//             "HOWTIME",
//             // textAlign: TextAlign.center,
//             maxLines: 1,
//             style: Theme.of(context).textTheme.headline3!.merge(GoogleFonts.montserrat()),
//           ),
//         ),
//         LottieBuilder.asset(
//           'assets/food.json',
//           onLoaded: (composition) {
//             _lottieAnimation..duration = composition.duration;
//           },
//           frameRate: FrameRate.max,
//           repeat: false,
//           animate: false,
//           height: 100,
//           width: 100,
//           controller: _lottieAnimation,
//         )
//       ],
//     ),
//   );
// }
}