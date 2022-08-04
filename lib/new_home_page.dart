import 'package:animated_widgets/widgets/rotation_animated.dart';
import 'package:animated_widgets/widgets/shake_animated_widget.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dot_pagination_swiper/dot_pagination_swiper.dart';
import 'package:wave/wave.dart';
import 'package:wave/config.dart';



List<String> imgList = [
  "assets/b8.jpg",
  "assets/b2.jpg",
  "assets/b7.jpg",
  "assets/b4.jpg"
];

List new_s = ["assets/1.png","assets/2.png","assets/3.png","assets/4.png"];
List text = ["Get Stock","Get Consultant"];

List<String> imgList1 = [
  "",
  ""
  // "https://media.istockphoto.com/photos/digitally-enhanced-shot-of-a-graph-showing-the-ups-and-downs-shares-picture-id1322201350?b=1&k=20&m=1322201350&s=170667a&w=0&h=Cp62gZiaccwtTOwzFsdUnvyDq8JC91WMloyqfjtTx-U=",
  // "https://m.foolcdn.com/media/dubs/original_images/Intro_slide_-_digital_stock_chart_going_up_-_source_getty.jpg",
];

class new_home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return _new_home();
  }
}

class _new_home extends State<new_home> {

  final List<Widget> imageSliders = text.map((item) => Container(
      child: Container(
        height: 80,
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration( //decoration for the outer wrapper
          color: Colors.red[800],
          borderRadius: BorderRadius.circular(10), //border radius exactly to ClipRRect
          boxShadow:[
            // BoxShadow(
            //   color: Colors.grey.withOpacity(0.5), //color of shadow
            //   spreadRadius: 5, //spread radius
            //   blurRadius: 7, // blur radius
            //   offset: Offset(0, 2), // changes position of shadow
            //   //first paramerter of offset is left-right
            //   //second parameter is top to down
            // ),
            //you can set more BoxShadow() here
          ],
        ) ,
        child: ClipRRect( //to clip overflown positioned containers.
          borderRadius: BorderRadius.circular(10),
          //if we set border radius on container, the overflown content get displayed at corner.
          child:Container(

              child: Stack(children: <Widget>[ //Stack helps to overlap widgets
                Positioned( //positioned helps to position widget wherever we want.
                    top:-20, left:-50, //position of the widget
                    child:Container(
                        height:200,
                        width:200,
                        decoration:BoxDecoration(
                            shape:BoxShape.circle,
                            color:Colors.red.withOpacity(0.5) //background color with opacity
                        )
                    )
                ),

                Positioned(
                    left:-80,top:-50,
                    child:Container(
                        height:150,
                        width:150,
                        decoration:BoxDecoration(
                            shape:BoxShape.circle,
                            color:Colors.redAccent.withOpacity(0.5)
                        )
                    )
                ),

                Positioned(  //main content container postition.
                  child: Container(
                      height:120,
                      alignment: Alignment.center,
                      child:Text("${text[0]}", style: TextStyle(
                        color:Colors.white, fontSize:20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "lato"
                      ),
                        textAlign: TextAlign.center,
                      )
                  ),
                )
              ],)
          ),
        ),
      ),
  ))
      .toList();

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
              // 'assets/giphy.gif',
               width: MediaQuery.of(context).size.width,
               height: MediaQuery.of(context).size.height,
               fit: BoxFit.cover,
             )
         ),

         Scaffold(
           backgroundColor: Colors.transparent,
           body: SingleChildScrollView(
             child: Column(
               children: [
                 Padding(
                   padding: const EdgeInsets.only(left: 10.0),
                   child: Row(
                     children: [
                       Row(
                         mainAxisSize: MainAxisSize.min,
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Image.asset("assets/logo.png",width: 50,height: 50,),

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

                       Spacer(),

                       Padding(
                         padding: const EdgeInsets.only(right: 8.0),
                         child: Row(
                           mainAxisSize: MainAxisSize.min,
                           children: [
                             ShakeAnimatedWidget(
                                 enabled: true,
                                 duration: Duration(milliseconds: 1500),
                                 shakeAngle: Rotation.deg(z: 40),
                                 curve: Curves.linear,
                                 child:Image.asset("assets/bell.gif",width: 32,height: 32,fit: BoxFit.fitHeight,)
                             ),
                             Image.asset("assets/call.gif",width: 50,height: 50,fit: BoxFit.fitHeight,)

                           ],
                         ),
                       ),
                     ],
                   ),
                 ),

                 Padding(
                   padding: const EdgeInsets.symmetric(vertical: 5.0),
                   child: Container(
                     height: 180,
                     child: DotPaginationSwiper.builder(
                       itemCount: imgList.length,
                       itemBuilder: (context, i) =>
                           ClipRRect(
                               borderRadius: BorderRadius.circular(4),
                               child: Image.asset(imgList[i], fit: BoxFit.cover,)),
                       // ),
                     ),
                   ),
                 ),

                 // Stack(
                 //   alignment: Alignment.center,
                 //   children: [
                 //     WaveWidget(
                 //       config: CustomConfig(
                 //         gradients: [
                 //           [Colors.red, Color(0xEEF44336)],
                 //           [Colors.redAccent, Color(0x77E57373)],
                 //           [Colors.orange, Color(0x66FF9800)],
                 //           [Colors.yellow, Color(0x55FFEB3B)]
                 //         ],
                 //         durations: [35000, 19440, 10800, 6000],
                 //         heightPercentages: [0.20, 0.23, 0.25, 0.30],
                 //        // blur: MaskFilter.blur(BlurStyle.solid, 10),
                 //         gradientBegin: Alignment.bottomLeft,
                 //         gradientEnd: Alignment.topRight,
                 //       ),
                 //       // colors: [
                 //       //   Colors.white70,
                 //       //   Colors.white54,
                 //       //   Colors.white30,
                 //       //   Colors.white24,
                 //       // ],
                 //       // durations: [
                 //       //   32000,
                 //       //   21000,
                 //       //   18000,
                 //       //   5000,
                 //       // ],
                 //       waveAmplitude: 0,
                 //       //  heightPercentages: [0.25, 0.26, 0.28, 0.31],
                 //       backgroundColor: Colors.blue,
                 //       size: Size(
                 //         100,
                 //         100,
                 //       ),
                 //     ),
                 //     Text("data")
                 //   ],
                 // ),


                 Padding(
                   padding: const EdgeInsets.symmetric(vertical:15.0,horizontal: 10),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       Chip(
                         label: Container(
                             width: 60,
                             height: 20,
                             child: Text('1000',style: TextStyle(
                               color: Colors.white
                             ),)),
                         avatar: Image.asset(
                           "assets/rupeebg.png",
                         ),
                         backgroundColor: Colors.black,
                         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                       ),

                       SizedBox(
                         width: 20,
                       ),

                       Chip(
                         label: Container(
                             width: 60,
                             height: 20,
                             child: Text('10000',style: TextStyle(
                               color: Colors.white
                             ),)),
                         avatar: Image.asset(
                           "assets/rupeecoin.gif",
                         ),
                         backgroundColor: Colors.black,
                         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                       ),
                     ],
                   ),
                 ),

                 /*Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 7),
                   child: Row(
                     // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [

                       Expanded(
                         child: InkWell(
                           onTap: (){
                           },
                           child: Container(
                             //width:200,
                             decoration: BoxDecoration(
                               color: Colors.transparent,
                               borderRadius: BorderRadius.circular(8),
                               border: Border.all(color: Colors.white,width: 0.7),
                               boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 1)],
                             ),
                             child: ClipRRect(
                               borderRadius: BorderRadius.circular(8),
                               child: Container(
                                 padding: EdgeInsets.all(20),
                                 decoration: BoxDecoration(
                                   color: Colors.black,
                                   borderRadius: BorderRadius.all(
                                     Radius.circular(10.0),
                                     // radius
                                   ),
                                   // border: Border(
                                   //   left: BorderSide(color: Colors.indigo, width: 5),
                                   // ),
                                 ),
                                 child: Column(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   crossAxisAlignment: CrossAxisAlignment.start ,
                                   children: <Widget>[
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [
                                         Column(
                                           mainAxisAlignment: MainAxisAlignment.start,
                                           crossAxisAlignment: CrossAxisAlignment.start ,
                                           children: [
                                             Align(
                                                 alignment: Alignment.centerLeft,
                                                 child: Text("Get Stock",
                                                   textAlign: TextAlign.left,
                                                   style: TextStyle(
                                                     color: Colors.white,
                                                     fontWeight: FontWeight.bold,
                                                     fontSize: 12,
                                                   ),
                                                 )),

                                             Padding(
                                                 padding: EdgeInsets.only(top: 8),
                                                 child: Text("Details",
                                                   textAlign: TextAlign.left,
                                                   style: TextStyle(
                                                       color: Colors.white,
                                                       fontSize: 10
                                                   ),
                                                 )),

                                           ],
                                         ),
                                         // SizedBox(
                                         //   width: 20,
                                         // ),
                                        // Image.asset("assets/image/college.png", fit: BoxFit.cover),
                                       ],
                                     ),

                                   ],
                                 ),
                               ),
                             ),
                           ),
                         ),
                       ),

                       SizedBox(
                         width: 10,
                       ),
                       Expanded(
                         child: InkWell(
                           onTap: (){
                           },
                           child: Container(
                             //width:200,
                             decoration: BoxDecoration(
                               color: Colors.transparent,
                               borderRadius: BorderRadius.circular(8),
                               border: Border.all(color: Colors.white,width: 0.7),
                               boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 1)],
                             ),
                             child: ClipRRect(
                               borderRadius: BorderRadius.circular(8),
                               child: Container(
                                 padding: EdgeInsets.all(20),
                                 decoration: BoxDecoration(
                                   color: Colors.black,
                                   borderRadius: BorderRadius.all(
                                     Radius.circular(10.0),
                                     // radius
                                   ),
                                   // border: Border(
                                   //   left: BorderSide(color: Colors.indigo, width: 5),
                                   // ),
                                 ),
                                 child: Column(
                                   mainAxisSize: MainAxisSize.min,
                                   children: <Widget>[
                                     Row(
                                       //  mainAxisSize: MainAxisSize.min,
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [
                                         Column(
                                           mainAxisAlignment: MainAxisAlignment.start,
                                           crossAxisAlignment: CrossAxisAlignment.start ,
                                           children: [
                                             Align(
                                                 alignment: Alignment.centerLeft,
                                                 child: Text("Get Consultant",
                                                   style: TextStyle(
                                                     color: Colors.white,
                                                     fontWeight: FontWeight.bold,
                                                     fontSize: 12,

                                                   ),
                                                 )),

                                             Padding(
                                                 padding: EdgeInsets.only(top: 8),
                                                 child: Text("Details",
                                                   style: TextStyle(
                                                       color: Colors.white,
                                                       fontSize: 10
                                                   ),
                                                 )),

                                           ],
                                         ),
                                         // SizedBox(
                                         //   width: 20,
                                         // ),
                                       //  Image.asset("assets/image/Vector.png", fit: BoxFit.cover),

                                       ],
                                     ),

                                   ],
                                 ),
                               ),
                             ),
                           ),
                         ),
                       ),

                     ],
                   ),
                 ),*/

                 Padding(
                   padding: const EdgeInsets.all(0.0),
                   child: CarouselSlider(
                     options: CarouselOptions(
                       autoPlay: true,
                       aspectRatio: 2.3,
                       //enlargeCenterPage: true,
                     ),
                     items: imageSliders,
                   ),
                 ),

                 Padding(
                   padding: const EdgeInsets.only(top: 10.0,left: 13),
                   child: Align(
                     alignment: Alignment.centerLeft,
                     child: Text("News Update",
                       style: TextStyle(
                         fontSize: 21,
                         fontWeight: FontWeight.bold,
                         color: Colors.white,
                       ),
                     ),
                   ),
                 ),

                 Container(
                   margin: EdgeInsets.all(0.0),
                   height: 160.0,
                   child:
                   ListView.builder(
                     scrollDirection: Axis.horizontal,
                     shrinkWrap: true,
                     itemCount:  4,
                     itemBuilder: (BuildContext context, int index) {
                       return InkWell(
                         onTap: () async {
                         //  SharedPreferences prefs = await SharedPreferences.getInstance();
                           setState(()
                           {

                           });
                           Future.delayed(Duration(seconds: 1));
                         //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => blog_details()));
                         },
                         child: Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 5.0),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                               Padding(
                                 padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                 child: ClipRRect(
                                   borderRadius: BorderRadius.circular(13), // Image border
                                   child: SizedBox.fromSize(
                                     size: Size.fromRadius(50), // Image radius
                                     child:Image.asset(new_s[index], fit: BoxFit.cover,height: 60,),
                                   ),
                                 ),
                               ),
                               SizedBox(
                                 width: 5,
                               ),
                               Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 crossAxisAlignment: CrossAxisAlignment.start ,
                                 children: [
                                   SizedBox(
                                     width:100,
                                     child: Text("Stock Market",
                                       softWrap: true,
                                       maxLines: 2,
                                       overflow: TextOverflow.ellipsis,
                                       textAlign: TextAlign.justify,
                                       style: TextStyle(
                                           fontSize: 15,
                                           color: Colors.white,
                                           fontWeight: FontWeight.bold
                                       ),),
                                   ),

                                   // Align(
                                   //   alignment: Alignment.centerLeft,
                                   //   child: Text("A young doctor journey",
                                   //     // textAlign: TextAlign.left,
                                   //     style: TextStyle(
                                   //         fontSize: 12,
                                   //         color: Colors.grey,
                                   //         fontWeight: FontWeight.bold
                                   //     ),),
                                   // ),

                                   SizedBox(
                                     height: 5,
                                   ),

                                   SizedBox(
                                     width: 100,
                                     child: Align(
                                       alignment: Alignment.centerLeft,
                                       child: Text("This reprsents ShortDescription",
                                           //textAlign: TextAlign.justify,
                                           softWrap: true,
                                           style: TextStyle(
                                             fontSize: 11,
                                             color: Colors.grey,
                                           ),
                                           maxLines: 3,
                                           overflow: TextOverflow.ellipsis
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                             ],
                           ),
                         ),
                       );
                     },
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