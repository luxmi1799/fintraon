import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frig/provider_list/daily-shares_provider.dart';
import 'package:frig/provider_list/profile_provider.dart';
import 'package:hover_effect/hover_effect.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

List image= ["assets/Google.png","assets/Microsoft.png","assets/Nike.png","assets/Spotify_icon.png","assets/twitter.png"];
List title = ["Google","Microsoft","Nike","Spotify","Twitter"];

class share_details extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _home_page();
  }
}

class _home_page extends State<share_details> {
  bool details = false;
  bool enabled = true;
  var user_id;
  var shareid;
  var sharedetail;
  var _controller = ScrollController();
  ScrollPhysics _physics = ClampingScrollPhysics();

  @override
  void initState() {
    super.initState();
    context.read<daily_shares_provider>().daily_shares_list();
    get_blogdetails(context);
    _controller.addListener(() {
      if (_controller.position.pixels <= 56)
        setState(() => _physics = ClampingScrollPhysics());
      else
        setState(() => _physics = BouncingScrollPhysics());
    });
  }

  get_blogdetails(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      user_id = prefs.getString("user_id");
      shareid = prefs.getString("shareId");
      context.read<profile_provider>().profile_detail(user_id);
      share_details(shareid);
    });
  }

  Future<void> share_details(String shareid) async {
    String postUrl = "https://fintracon.in/mobile-authenticate/share-details.php";
    print("stringrequest");
    var request = new http.MultipartRequest(
        "POST", Uri.parse(postUrl));
    request.fields['id'] = shareid;
    request.send().then((response) {
      http.Response.fromStream(response).then((onValue) {
        if(response.statusCode ==200) {
          try {
            Map resposemap   = json.decode(onValue.body);
            setState(() {
              sharedetail = resposemap["commandResult"]["data"]["ShareDetail"];
            });
          } catch (e) {
            print("response$e");
          }
        }
        else{

        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    context.read<daily_shares_provider>().daily_shares_list();
    context.read<profile_provider>().profile_detail(user_id);
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
        Scaffold(
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
                child: InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                    child: Icon(Icons.arrow_back_ios,color: Colors.white,))),
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
            child: sharedetail!=null?Column(
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
                                    child: ClipOval(child: Image.network(sharedetail["Image"],width: 40,height: 40,fit: BoxFit.fill,))),
                              ]
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(sharedetail["Heading"],style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          // Text("(spotify)",
                          //     style: TextStyle(
                          //       color: Colors.grey,
                          //       fontSize: 13,
                          //     )),
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
                              child: Text(
                                sharedetail["Profit"],style: TextStyle(
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
                                TextSpan(text: "\₹ ${sharedetail["CurrentPrice"]}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold
                                    )
                                ),
                                // TextSpan(text: ".90",
                                //     style: TextStyle(
                                //         color: Colors.grey[600],
                                //         fontSize: 18,
                                //         fontWeight: FontWeight.bold
                                //     )
                               // ),
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
                                    TextSpan(text: sharedetail["ProfitPrice"],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold
                                        )
                                    ),
                                    TextSpan(text: "",
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
                                    TextSpan(text: sharedetail["Price"],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold
                                        )
                                    ),
                                    TextSpan(text:"",
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

                                      Text("\₹ "+sharedetail["CurrentPrice"],
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

                                      Text("\₹ "+sharedetail["ProfitPrice"],
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

                                      Text("\₹ "+ sharedetail["LowestPrice"],
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
                                        child: Text("Profit Ratio",
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

                                      Text(sharedetail["ProfitRatio"],
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
                                        child: Text("Avg. Profit %",
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

                                      Text(sharedetail["Profit"],
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
                                        child: Text("Avg. Loss %",
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

                                      Text(sharedetail["Loss"],
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
            ):Center(child: CircularProgressIndicator(),),
          ),
        )
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