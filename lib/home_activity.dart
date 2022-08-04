import 'package:animated_widgets/widgets/rotation_animated.dart';
import 'package:animated_widgets/widgets/shake_animated_widget.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:hover_effect/hover_effect.dart';


List image= ["assets/Google.png","assets/Microsoft.png","assets/Nike.png","assets/Spotify_icon.png","assets/twitter.png"];
List title = ["Google","Microsoft","Nike","Spotify","Twitter"];

class home_activity extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _home_page();
  }
}

class _home_page extends State<home_activity> {
  bool details = false;
  bool enabled = true;
  var _controller = ScrollController();
  ScrollPhysics _physics = ClampingScrollPhysics();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.position.pixels <= 56)
        setState(() => _physics = ClampingScrollPhysics());
      else
        setState(() => _physics = BouncingScrollPhysics());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:
      [
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
        details ==false?Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(30.0), // here the desired height
            child: AppBar(
              centerTitle: true,
              elevation: 0,
              leading: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Container(
                     width: 35,
                     height: 35,
                    child: Image.asset("assets/logo.png")),
              ),
              backgroundColor: Colors.transparent,
            )
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ClipOval(
                          child: Image.asset(
                            'assets/home_pro.png',
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Hi, Sudeep!",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'lato',
                                fontSize: 18,
                              ),),
                            SizedBox(
                              height: 6,
                            ),
                            Text("Welcome to Fintracon",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'lato',
                                fontSize: 14,
                              ),)
                          ],
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Row(
                        children: [
                          ShakeAnimatedWidget(
                            enabled: this.enabled,
                            duration: Duration(milliseconds: 1500),
                            shakeAngle: Rotation.deg(z: 40),
                            curve: Curves.linear,
                            child:Image.asset("assets/bell.gif",width: 32,height: 32,fit: BoxFit.cover,)
                          ),

                          SizedBox(
                            width: 6,
                          ),

                          // SizedBox(
                          //     width: 20,
                          //     height: 20,
                          //     child: Icon(Icons.adjust,color: Colors.white,)
                          // ),
                        ],
                      ),
                    ),


                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Explore Top Stocks ",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'lato',
                        fontSize: 18,
                      ),),

                    Text("View all",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        fontFamily: 'lato',
                      ),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search company , stocks...',
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                    border:OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        borderSide: BorderSide(color: Colors.grey)),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                        color: Color(0xffEC1C24),
                        width: 2.0,
                      ),
                    )
                  ),
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'lato',
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 10.0,right: 10,top: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    controller: _controller,
                    physics: _physics,
                    itemCount: 5,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, position) {
                      return  Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                // SizedBox(
                                //     width:30,
                                //     height: 30,
                                //     child:
                                Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      SizedBox(
                                          width:40,
                                          height: 40,
                                          child: Image.asset(image[position])),
                                      // SizedBox(
                                      //     width:25,
                                      //     height: 25,
                                      //     child: Image.asset("assets/twitbird.png"))
                                    ]
                                ),

                                SizedBox(
                                  width: 8,
                                ),
                                // ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(title[position],style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'lato',
                                        fontWeight: FontWeight.bold,
                                      )),
                                    ),
                                    Text(" Twitter inc.",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 13,
                                          fontFamily: 'lato',
                                        )),

                                  ],
                                ),
                              ],
                            ),

                            InkWell(
                                onTap: (){
                                  setState(() {
                                    details = true;
                                  });
                                  //Navigator.of(context).push(MaterialPageRoute(builder: (context) => edit_profile()));
                                },
                                child: Icon(Icons.remove_red_eye,color: Colors.white,))
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ):stock_details(context),
      ]
    );
  }

  Widget stock_details(BuildContext context){
    String doller = "\$";
    Offset _offset = Offset.zero;
    return Scaffold(
      backgroundColor: Colors.transparent,
        appBar: AppBar(
        centerTitle: true,
        leading: InkWell(
            onTap: (){
              setState(() {
                details = false;
              });
              //Navigator.of(context).push(MaterialPageRoute(builder: (context) => edit_profile()));
            },
            child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
        backgroundColor: Colors.transparent,
        title: Text.rich(
                  TextSpan(
                     children: [
                    TextSpan(text: "Stock Details",
                       style: TextStyle(
                       color: Colors.white,
                       fontSize: 22,
                       fontWeight: FontWeight.bold
                      )
                  ),
               ],
              ),
            ),
        ),
       body: SingleChildScrollView(
       child: Column(
         children: [

           Padding(
             padding: const EdgeInsets.all(10.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Row(
                   children: [
                     // SizedBox(
                     //     width:30,
                     //     height: 30,
                     //     child:
                     Stack(
                         alignment: Alignment.center,
                         children: [
                           SizedBox(
                               width:45,
                               height: 45,
                               child: Image.asset("assets/Spotify_icon.png")),
                         ]
                     ),
                     SizedBox(
                       width: 5,
                     ),
                     Align(
                       alignment: Alignment.centerLeft,
                       child: Text(" SPOT",style: TextStyle(
                         color: Colors.white,
                         fontSize: 16,
                         fontWeight: FontWeight.bold,
                       )),
                     ),
                     SizedBox(
                       width: 3,
                     ),
                     Text("(spotify)",
                         style: TextStyle(
                           color: Colors.grey,
                           fontSize: 13,
                         )),
                   ],
                 ),

                 Container(
                   width: 50,
                   height: 20,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                     color: Colors.grey[600],
                   ),
                   child: Row(
                     children: [

                       Icon(Icons.arrow_drop_up,color: Colors.white,),
                       Center(
                         child: Text("0.95%",style: TextStyle(
                           fontWeight: FontWeight.bold,
                           fontSize: 8,
                           color: Colors.white
                         ),),
                       )
                     ],
                   ),
                 ),
               ],
             ),
           ),

           Padding(
             padding: const EdgeInsets.all(10.0),
             child: Row(
               children: [
                 Container(
                   height: 65.0,
                   width: 1.9,
                   color: Color(0xffEC1C24),
                   margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                 ),
                 SizedBox(
                   width: 7,
                 ),

                 Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text.rich(
                       TextSpan(
                         children: [
                           WidgetSpan(child: Container(width: 20,height: 40,)),
                           TextSpan(text: "\$ 226",
                               style: TextStyle(
                                   color: Colors.white,
                                   fontSize: 23,
                                   fontWeight: FontWeight.bold
                               )
                           ),
                           TextSpan(text: ".90",
                               style: TextStyle(
                                   color: Colors.grey[600],
                                   fontSize: 18,
                                   fontWeight: FontWeight.bold
                               )
                           ),
                         ],
                       ),
                     ),
                     SizedBox(
                       height: 7,
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         Text.rich(
                           TextSpan(
                             children: [
                               WidgetSpan(child: Center(child: Image.asset('assets/rupeecoin.gif',width: 50,height: 30,fit: BoxFit.cover,))),
                               TextSpan(text: "224",
                                   style: TextStyle(
                                       color: Colors.white,
                                       fontSize: 18,
                                       fontWeight: FontWeight.bold
                                   )
                               ),
                               TextSpan(text: ".90",
                                   style: TextStyle(
                                       color: Colors.grey[600],
                                       fontSize: 14,
                                       fontWeight: FontWeight.bold
                                   )
                               ),
                             ],
                           ),
                         ),
                         SizedBox(
                           width: 7,
                         ),
                         Text.rich(
                           TextSpan(
                             children: [
                               WidgetSpan(child:Image.asset("assets/upward.gif",width: 45,height: 20,fit: BoxFit.cover,)),
                               TextSpan(text: "2,02",
                                   style: TextStyle(
                                       color: Colors.white,
                                       fontSize: 16,
                                       fontWeight: FontWeight.bold
                                   )
                               ),
                               TextSpan(text: "(Today)",
                                   style: TextStyle(
                                       color: Colors.grey[600],
                                       fontSize: 14,
                                       fontWeight: FontWeight.bold
                                   )
                               ),
                             ],
                           ),
                         ),
                       ],
                     ),
                   ],
                 ),


               ],
             ),
           ),


           Padding(
             padding: const EdgeInsets.only(left: 12.0,top: 50,bottom: 15),
             child: Align(
               alignment: Alignment.centerLeft,
               child: Text("Statistics",
                 style: TextStyle(
                   fontWeight: FontWeight.bold,
                   color: Colors.white,
                   fontSize: 24
                 ),
               ),
             ),
           ),

           // Card(
           //   color: Colors.white,
           //   shape: RoundedRectangleBorder(
           //     side: BorderSide(color: Colors.white, width: 1),
           //     borderRadius: BorderRadius.circular(10),
           //   ),
           //   margin: EdgeInsets.all(20.0),
           //   child: Container(
           //     child: Column(
           //       children: <Widget>[
           //
           //         Padding(
           //           padding: const EdgeInsets.symmetric(vertical: 15.0),
           //           child: Row(
           //             mainAxisAlignment: MainAxisAlignment.spaceAround,
           //             children: [
           //               Column(
           //                 mainAxisAlignment: MainAxisAlignment.center,
           //                 crossAxisAlignment: CrossAxisAlignment.center,
           //                 children: [
           //                   Padding(
           //                     padding: const EdgeInsets.only(top: 8.0),
           //                     child: Text("Open",
           //                       style: TextStyle(
           //                         color: Colors.grey[600],
           //                         fontSize: 13,
           //                         fontWeight: FontWeight.bold,
           //
           //                       ),
           //                     ),
           //                   ),
           //
           //                   SizedBox(
           //                     height: 10,
           //                   ),
           //
           //                   Text("224.5",
           //                     style: TextStyle(
           //                       color: Colors.black,
           //                       fontSize: 16,
           //                       fontWeight: FontWeight.bold,
           //                     ),
           //                   )
           //                 ],
           //               ),
           //
           //               Column(
           //                 mainAxisAlignment: MainAxisAlignment.center,
           //                 children: [
           //                   Padding(
           //                     padding: const EdgeInsets.only(top: 8.0),
           //                     child: Text("High",
           //                       style: TextStyle(
           //                         color: Colors.grey[600],
           //                         fontSize: 13,
           //                         fontWeight: FontWeight.bold,
           //
           //                       ),
           //                     ),
           //                   ),
           //
           //                   SizedBox(
           //                     height: 10,
           //                   ),
           //
           //                   Text("224.5",
           //                     style: TextStyle(
           //                       color: Colors.black,
           //                       fontSize: 16,
           //                       fontWeight: FontWeight.bold,
           //                     ),
           //                   )
           //                 ],
           //               ),
           //
           //               Column(
           //                 mainAxisAlignment: MainAxisAlignment.center,
           //                 children: [
           //                   Padding(
           //                     padding: const EdgeInsets.only(top: 8.0),
           //                     child: Text("Low",
           //                       style: TextStyle(
           //                         color: Colors.grey[600],
           //                         fontSize: 13,
           //                         fontWeight: FontWeight.bold,
           //                       ),
           //                     ),
           //                   ),
           //
           //                   SizedBox(
           //                     height: 10,
           //                   ),
           //
           //                   Text("224.5",
           //                     style: TextStyle(
           //                       color: Colors.black,
           //                       fontSize: 16,
           //                       fontWeight: FontWeight.bold,
           //                     ),
           //                   )
           //                 ],
           //               ),
           //
           //
           //             ],
           //           ),
           //         ),
           //
           //         Padding(
           //           padding: const EdgeInsets.symmetric(vertical: 15.0),
           //           child: Row(
           //             mainAxisAlignment: MainAxisAlignment.spaceAround,
           //             children: [
           //               Column(
           //                 mainAxisAlignment: MainAxisAlignment.center,
           //                 children: [
           //                   Padding(
           //                     padding: const EdgeInsets.only(top: 8.0),
           //                     child: Text("Volume",
           //                       style: TextStyle(
           //                         color: Colors.grey[600],
           //                         fontSize: 13,
           //                         fontWeight: FontWeight.bold,
           //
           //                       ),
           //                     ),
           //                   ),
           //
           //                   SizedBox(
           //                     height: 10,
           //                   ),
           //
           //                   Text("224.5",
           //                     style: TextStyle(
           //                       color: Colors.black,
           //                       fontSize: 16,
           //                       fontWeight: FontWeight.bold,
           //                     ),
           //                   )
           //                 ],
           //               ),
           //
           //               Column(
           //                 mainAxisAlignment: MainAxisAlignment.center,
           //                 children: [
           //                   Padding(
           //                     padding: const EdgeInsets.only(top: 8.0),
           //                     child: Text("Avg. Volume",
           //                       style: TextStyle(
           //                         color: Colors.grey[600],
           //                         fontSize: 13,
           //                         fontWeight: FontWeight.bold,
           //
           //                       ),
           //                     ),
           //                   ),
           //
           //                   SizedBox(
           //                     height: 10,
           //                   ),
           //
           //                   Text("224.5",
           //                     style: TextStyle(
           //                       color: Colors.black,
           //                       fontSize: 16,
           //                       fontWeight: FontWeight.bold,
           //                     ),
           //                   )
           //                 ],
           //               ),
           //
           //               Column(
           //                 mainAxisAlignment: MainAxisAlignment.center,
           //                 children: [
           //                   Padding(
           //                     padding: const EdgeInsets.only(top: 8.0),
           //                     child: Text("Market Cap",
           //                       style: TextStyle(
           //                         color: Colors.grey[600],
           //                         fontSize: 13,
           //                         fontWeight: FontWeight.bold,
           //
           //                       ),
           //                     ),
           //                   ),
           //
           //                   SizedBox(
           //                     height: 10,
           //                   ),
           //
           //                   Text("224.5",
           //                     style: TextStyle(
           //                       color: Colors.black,
           //                       fontSize: 16,
           //                       fontWeight: FontWeight.bold,
           //                     ),
           //                   )
           //                 ],
           //               ),
           //
           //
           //             ],
           //           ),
           //         ),
           //
           //       ],
           //     ),
           //   ),
           // ),

           Container(
             width: MediaQuery.of(context).size.width,
             margin: EdgeInsets.all(20.0),
             height: 180,
             child: HoverCard(
               builder: (context, hovering) {
                 return  Container(
                   color: Color(0xFFE9E9E9),
                   child: Column(
                     children: <Widget>[

                       Padding(
                         padding: const EdgeInsets.symmetric(vertical: 15.0),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               crossAxisAlignment: CrossAxisAlignment.center,
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.only(top: 8.0),
                                   child: Text("Open",
                                     style: TextStyle(
                                       color: Colors.grey[600],
                                       fontSize: 13,
                                       fontWeight: FontWeight.bold,

                                     ),
                                   ),
                                 ),

                                 SizedBox(
                                   height: 10,
                                 ),

                                 Text("224.5",
                                   style: TextStyle(
                                     color: Colors.black,
                                     fontSize: 16,
                                     fontWeight: FontWeight.bold,
                                   ),
                                 )
                               ],
                             ),

                             Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.only(top: 8.0),
                                   child: Text("High",
                                     style: TextStyle(
                                       color: Colors.grey[600],
                                       fontSize: 13,
                                       fontWeight: FontWeight.bold,

                                     ),
                                   ),
                                 ),

                                 SizedBox(
                                   height: 10,
                                 ),

                                 Text("224.5",
                                   style: TextStyle(
                                     color: Colors.black,
                                     fontSize: 16,
                                     fontWeight: FontWeight.bold,
                                   ),
                                 )
                               ],
                             ),

                             Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.only(top: 8.0),
                                   child: Text("Low",
                                     style: TextStyle(
                                       color: Colors.grey[600],
                                       fontSize: 13,
                                       fontWeight: FontWeight.bold,
                                     ),
                                   ),
                                 ),

                                 SizedBox(
                                   height: 10,
                                 ),

                                 Text("224.5",
                                   style: TextStyle(
                                     color: Colors.black,
                                     fontSize: 16,
                                     fontWeight: FontWeight.bold,
                                   ),
                                 )
                               ],
                             ),


                           ],
                         ),
                       ),

                       Padding(
                         padding: const EdgeInsets.symmetric(vertical: 15.0),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.only(top: 8.0),
                                   child: Text("Volume",
                                     style: TextStyle(
                                       color: Colors.grey[600],
                                       fontSize: 13,
                                       fontWeight: FontWeight.bold,

                                     ),
                                   ),
                                 ),

                                 SizedBox(
                                   height: 10,
                                 ),

                                 Text("224.5",
                                   style: TextStyle(
                                     color: Colors.black,
                                     fontSize: 16,
                                     fontWeight: FontWeight.bold,
                                   ),
                                 )
                               ],
                             ),

                             Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.only(top: 8.0),
                                   child: Text("Avg. Volume",
                                     style: TextStyle(
                                       color: Colors.grey[600],
                                       fontSize: 13,
                                       fontWeight: FontWeight.bold,

                                     ),
                                   ),
                                 ),

                                 SizedBox(
                                   height: 10,
                                 ),

                                 Text("224.5",
                                   style: TextStyle(
                                     color: Colors.black,
                                     fontSize: 16,
                                     fontWeight: FontWeight.bold,
                                   ),
                                 )
                               ],
                             ),

                             Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.only(top: 8.0),
                                   child: Text("Market Cap",
                                     style: TextStyle(
                                       color: Colors.grey[600],
                                       fontSize: 13,
                                       fontWeight: FontWeight.bold,

                                     ),
                                   ),
                                 ),

                                 SizedBox(
                                   height: 10,
                                 ),

                                 Text("224.5",
                                   style: TextStyle(
                                     color: Colors.black,
                                     fontSize: 16,
                                     fontWeight: FontWeight.bold,
                                   ),
                                 )
                               ],
                             ),


                           ],
                         ),
                       ),

                     ],
                   ),
                 );
               },
               depth: 12,
               depthColor: Colors.grey,
               shadow: BoxShadow(color: Color(0xffEC1C24), blurRadius: 30, spreadRadius: -20, offset: Offset(0, 30)),
             ),
           ),
         ],
       ),
      ),
    );
  }

  Widget _dialogContent() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 300,
          color: Color(0xffF5F5F5),

        ),
      ),
    );
  }
}