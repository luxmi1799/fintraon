import 'package:animated_widgets/widgets/rotation_animated.dart';
import 'package:animated_widgets/widgets/shake_animated_widget.dart';
import 'package:flutter/material.dart';




List title = ["Intraday Trading Consultant","Future and Options Segment Opening","Demat Account","Professional Consultancy"];

List subtitle = ["FINTRACON is working as a market expert and offering Intraday trading recommendations to our interes...",
                 " The derivatives market mainly started to evade portfolios, but late market contributors have been k...",
                 "A Demat Account holds securities and shares automatically or in a dematerialised structure. It is an...",
                  "A Demat Account holds securities and shares automatically or in a dematerialised structure. It is an..."
                ];

List h_icon = [Icons.work,Icons.lightbulb,Icons.waving_hand_outlined,Icons.density_small];

class page_home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _page_home();
  }
}

class _page_home extends State<page_home>{
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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

        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Row(
            children: [
              Row(
                // mainAxisSize: MainAxisSize.min,
               //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/logo.png",width: 50,),

                  SizedBox(
                    width: 8,
                  ),


                  Text(
                    "Fintracon",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontFamily: 'kompot',
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),


        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height *.29,
              decoration: BoxDecoration(
              gradient: LinearGradient(
              colors: [
              const Color(0xFF000000),
              const Color(0xFFE51B1F),
              const Color(0xFFEC1C24),
              ],
             begin: Alignment.topCenter,
             end: Alignment.bottomCenter,
              // begin: const FractionalOffset(0.0, 0.0),
              // end: const FractionalOffset(1.0, 0.0),
            // stops: [0.0, 1.0],
             tileMode: TileMode.mirror
              ),
                //color: Color(0xffEC1C24),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                ),
              ),
              child:Padding(
                padding:  EdgeInsets.symmetric(horizontal: 55.0,vertical: 50),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Hey There ! \n Sudeep Sharma",style: TextStyle(
                    fontFamily: "lato",
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),),
                ),
              ),
              alignment: Alignment.topCenter,
            ),

            // Padding(
            //   padding:  EdgeInsets.symmetric(horizontal: 55.0,vertical: 50),
            //   child: Align(
            //     alignment: Alignment.centerLeft,
            //     child: Text("Hey There ! \n Sudeep Sharma",style: TextStyle(
            //       fontFamily: "lato",
            //       fontSize: 22,
            //       fontWeight: FontWeight.w400,
            //       color: Colors.white,
            //     ),),
            //   ),
            // ),

            Padding(
              padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height *.29),
              child: Container(
                width: MediaQuery.of(context).size.width *0.65,
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black,width: 0.5),
                    borderRadius: BorderRadius.circular(40)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 70,
                      child: Text(" My \n Stock",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: "lato",
                            fontWeight: FontWeight.w500
                        ),),
                    ),

                    Container(
                      height: 70,
                      width: 1,
                      color: Colors.black,
                    ),


                    SizedBox(
                      width: 70,
                      child: Text("Explore ours services",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: "lato",
                            fontWeight: FontWeight.w500
                        ),),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),

        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Padding(
                //   padding: const EdgeInsets.only(left: 10.0),
                //   child: Row(
                //     children: [
                //       Row(
                //         mainAxisSize: MainAxisSize.min,
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           Image.asset("assets/logo.png",width: 50,height: 50,),
                //
                //           SizedBox(
                //             width: 8,
                //           ),
                //
                //
                //           Text(
                //             "Fintracon",
                //             style: TextStyle(
                //               color: Colors.white,
                //               fontSize: 22,
                //               fontFamily: 'kompot',
                //               fontWeight: FontWeight.w600,
                //             ),
                //           ),
                //
                //         ],
                //       ),
                //     ],
                //   ),
                // ),

                // Padding(
                //   padding:  EdgeInsets.symmetric(horizontal: 55.0,vertical: MediaQuery.of(context).size.height *.1),
                //   child: Text("Hey There ! \n Sudeep Sharma",style: TextStyle(
                //     fontFamily: "lato",
                //     fontSize: 22,
                //     fontWeight: FontWeight.w400,
                //     color: Colors.white,
                //   ),),
                // ),


              /*  Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: MediaQuery.of(context).size.width *0.65,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black,width: 0.5),
                          borderRadius: BorderRadius.circular(40)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 70,
                            child: Text(" My \n Stock",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: "lato",
                              fontWeight: FontWeight.w500
                            ),),
                          ),

                          Container(
                            height: 60,
                            width: 1,
                            color: Colors.black,
                          ),


                          SizedBox(
                            width: 70,
                            child: Text("Explore ours services",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: "lato",
                                  fontWeight: FontWeight.w500
                              ),),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),*/

                Padding(
                  padding:  EdgeInsets.only(left: 20.0,top: MediaQuery.of(context).size.height *0.4),
                  child: Text("View all our services here",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: "lato",
                      fontSize: 19,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20),
                  child: Container(
                    height: 300,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                               width: MediaQuery.of(context).size.width*0.55,
                               height: 300,
                               decoration: BoxDecoration(
                                 color: Colors.white,
                                 borderRadius: BorderRadius.circular(25)
                               ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 110,
                                    child: Icon(h_icon[index],size: 50,color: Colors.black,),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width*0.55,
                                    height: 170,
                                    decoration: BoxDecoration(
                                        boxShadow: [BoxShadow(
                                          color: Colors.grey,
                                          //blurRadius: 5.0,
                                        ),],
                                      gradient: LinearGradient(
                                          colors: [
                                            const Color(0xFF000000),
                                            const Color(0xff2c2b2b),
                                            const Color(0xFF363636),
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          // begin: const FractionalOffset(0.0, 0.0),
                                          // end: const FractionalOffset(1.0, 0.0),
                                          // stops: [0.0, 1.0],
                                          tileMode: TileMode.clamp
                                      ),
                                      //color: Colors.red,
                                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)), //
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 15),
                                          child: Text(title[index],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontFamily: "lato",
                                            fontWeight: FontWeight.w800,
                                          ),),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 0),
                                          child: Text(
                                            subtitle[index],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontFamily: "lato",
                                            ),),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}