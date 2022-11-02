import 'dart:convert';
import 'package:animated_widgets/widgets/rotation_animated.dart';
import 'package:animated_widgets/widgets/shake_animated_widget.dart';
import 'package:flutter/material.dart';
import 'package:frig/home_activity.dart';
import 'package:frig/provider_list/profile_provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dot_pagination_swiper/dot_pagination_swiper.dart';

List<String> imgList = [
  "assets/a1.png",
  "assets/a2.png",
  "assets/a3.png",
  "assets/a4.png"
];

class portfolio extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return _package();
  }
}

class _package extends State<portfolio> {
  String myStringWithLinebreaks = "Line 1\nLine 2";
  int price = 500;
  int addprice = 250;
  var PaymentStatus;
  var user_id;
  bool enabled = true;
  var _controller = ScrollController();
  ScrollPhysics _physics = ClampingScrollPhysics();

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xff12c2e9), Color(0xffc471ed) , Color(0xfff64f59)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));


  @override
  void initState() {
    super.initState();
    get_blogdetails(context);
  }

  get_blogdetails(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      PaymentStatus = prefs.getString("PaymentStatus");
      user_id = prefs.getString("user_id");
      context.read<profile_provider>().profile_detail(user_id);
    });
    print("PaymentStatus $PaymentStatus");
  }

  @override
  Widget build(BuildContext context) {
    context.read<profile_provider>().profile_detail(user_id);
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
        Scaffold(
        //backgroundColor: Color(0xff909090),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          leading: InkWell(
              onTap: (){
                setState(() {

                });
                //Navigator.of(context).push(MaterialPageRoute(builder: (context) => edit_profile()));
              },
              child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
          backgroundColor: Colors.transparent,
          title: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: "Packages",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: 'lato',
                        fontWeight: FontWeight.bold
                    )
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          //physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: RefreshIndicator(
            onRefresh: () async {
              context.read<profile_provider>().profile_detail(user_id);
            }, child: Consumer<profile_provider>(
              builder: (context,value,child) {
                return value.map.length == 0 && !value.error
                    ? const CircularProgressIndicator(color: Colors.red,)
                    : value.error
                    ? const Text("Opps SOmething went wrong")
                    : value.map["commandResult"]["data"]["PaymentStatus"]=="0"?Center(child: Container(
                  child: Text(" This page is Locked Please Registration Fees First",
                    textAlign: TextAlign.center,
                    style: TextStyle(  fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()..shader = linearGradient),),
                ),): Column(
                  children: [
                     int.parse(value.map["commandResult"]["data"]["WalletCoin"])>0?Column(
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
                                              // details = true;
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
                     ): Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Stack(
                            children: [
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
                              // Container(
                              //   height: 150,
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(10),
                              //     image: DecorationImage(
                              //       image: AssetImage("assets/b9.jpg"),
                              //       fit: BoxFit.cover,
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Available Packages",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: 'lato',
                                  fontSize: 25
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: 25.0,right: 10),
                          child: Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 320,
                              child: ListView.builder(
                                itemCount: 3,
                                scrollDirection: Axis.horizontal,
                                physics: ScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, position) {
                                  return  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Card(
                                      color: Colors.white.withOpacity(0.0001),
                                      child: Container(
                                        width: MediaQuery.of(context).size.width*0.7,
                                        decoration: BoxDecoration(
                                          image:  new DecorationImage(
                                            image: ExactAssetImage('assets/red.png'),
                                            fit: BoxFit.cover,
                                          ),
                                          //color: Colors.white.withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(12),
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                                color: Color(0xffEC1C24).withOpacity(0.1),
                                                //blurRadius: .0,
                                                offset: Offset(4, 4)
                                            )
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 12.0,left: 12,right: 12),
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Image.asset("assets/rupeecoin.gif",width: 60,height: 30,fit: BoxFit.cover,),
                                                SizedBox(
                                                  height: 7,
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      width: 7,
                                                    ),
                                                    Center(
                                                      child: Text("₹ ${price+(addprice*position)}",
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.bold,
                                                          fontFamily: 'lato',
                                                          fontSize: 18,
                                                        ),),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Text(" For ${position+2} day",style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 20,
                                                      fontFamily: 'lato',
                                                    ),),
                                                    SizedBox(
                                                      height: 6,
                                                    ),
                                                    // Text("For ${position+1} day",style: TextStyle(
                                                    //   color: Colors.white,
                                                    //   fontWeight: FontWeight.bold,
                                                    //   fontSize: 16,
                                                    // ),),
                                                  ],
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context).size.width,
                                                  height: 2,
                                                  color: Color(0xff524f4f),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(5.0),
                                                  child: Container(
                                                    height: 150,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 0),
                                                      child: Column(
                                                        children: [
                                                          ListTile(
                                                              title: Text("",
                                                                style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 13,
                                                                  fontFamily: 'lato',
                                                                ),),
                                                              subtitle:
                                                              Padding(
                                                                padding: const EdgeInsets.only(top: 0.0),
                                                                child: Column(
                                                                    children: LineSplitter.split(myStringWithLinebreaks).map((o) {
                                                                      return Padding(
                                                                        padding: const EdgeInsets.all(2.5),
                                                                        child: Row(
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          children: <Widget>[
                                                                            SizedBox(height: 4,),
                                                                            Text("-> ",style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontFamily: 'lato',
                                                                            ),),
                                                                            Expanded(
                                                                              child: Text(o,style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontFamily: 'lato',
                                                                              ),),
                                                                            )
                                                                          ],
                                                                        ),
                                                                      );
                                                                    }).toList()),
                                                              )),
                                                          Padding(
                                                            padding: const EdgeInsets.only(top: 6.0),
                                                            child: Container(
                                                                width: MediaQuery.of(context).size.width,
                                                                height: 40,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(25),
                                                                    color: Colors.transparent,
                                                                    border: Border.all(color: Color(0xffEC1C24).withOpacity(0.6),width: 2)
                                                                ),
                                                                child:
                                                                InkWell(
                                                                  onTap: (){
                                                                    int amount;
                                                                    if(position == 0){
                                                                      amount = price + (addprice*position);
                                                                      registration_status(user_id,amount.toString(), "Package", "2");
                                                                      launch("https://paytm.me/BgvN-yF");
                                                                    }
                                                                    else if(position == 1){
                                                                      amount = price + (addprice*position);
                                                                      registration_status(user_id,amount.toString(), "Package", "3");
                                                                      launch("https://paytm.me/KCE6-yz");
                                                                    }
                                                                    else if(position == 2){
                                                                      amount = price + (addprice*position);
                                                                      registration_status(user_id,amount.toString(), "Package", "4");
                                                                      launch("https://paytm.me/u-qzNyF");
                                                                    }
                                                                    //Navigator.push(context, MaterialPageRoute(builder: (context) => home_activity()));

                                                                  },
                                                                  child: Center(
                                                                    child: Text("BUY",style: TextStyle(
                                                                        fontWeight: FontWeight.bold,
                                                                        fontSize: 17,
                                                                        fontFamily: 'lato',
                                                                        color: Colors.white
                                                                    ),),
                                                                  ),
                                                                )
                                                            ),
                                                          ),
                                                        ],
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
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }
          ),
          ),
         /* child: PaymentStatus == "0"?Center(child: Container(
            child: Text("  This page is Locked Please Registration Fees First",style: TextStyle(  fontSize: 30.0,
                fontWeight: FontWeight.bold,
                foreground: Paint()..shader = linearGradient),),
          ),):
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Stack(
                  children: [
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
                    // Container(
                    //   height: 150,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     image: DecorationImage(
                    //       image: AssetImage("assets/b9.jpg"),
                    //       fit: BoxFit.cover,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Available Packages",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'lato',
                        fontSize: 25
                    ),
                  ),
                ),
              ),


              Padding(
                padding:  EdgeInsets.only(left: 25.0,right: 10),
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 320,
                    child: ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, position) {
                        return  Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Card(
                            color: Colors.white.withOpacity(0.0001),
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.7,
                              decoration: BoxDecoration(
                                image:  new DecorationImage(
                                  image: ExactAssetImage('assets/red.png'),
                                  fit: BoxFit.cover,
                                ),
                                  //color: Colors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Color(0xffEC1C24).withOpacity(0.1),
                                      //blurRadius: .0,
                                      offset: Offset(4, 4)
                                  )
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 12.0,left: 12,right: 12),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/rupeecoin.gif",width: 60,height: 30,fit: BoxFit.cover,),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 7,
                                          ),
                                          Center(
                                            child: Text("₹ ${price+(addprice*position)}",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'lato',
                                              fontSize: 18,
                                            ),),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(" For ${position+2} day",style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            fontFamily: 'lato',
                                          ),),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          // Text("For ${position+1} day",style: TextStyle(
                                          //   color: Colors.white,
                                          //   fontWeight: FontWeight.bold,
                                          //   fontSize: 16,
                                          // ),),
                                        ],
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 2,
                                        color: Color(0xff524f4f),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Container(
                                          height: 150,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 0),
                                            child: Column(
                                              children: [
                                                ListTile(
                                                    title: Text("",
                                                      style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 13,
                                                      fontFamily: 'lato',
                                                    ),),
                                                    subtitle:
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 0.0),
                                                      child: Column(
                                                          children: LineSplitter.split(myStringWithLinebreaks).map((o) {
                                                            return Padding(
                                                              padding: const EdgeInsets.all(2.5),
                                                              child: Row(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: <Widget>[
                                                                  SizedBox(height: 4,),
                                                                  Text("-> ",style: TextStyle(
                                                                    color: Colors.white,
                                                                    fontFamily: 'lato',
                                                                  ),),
                                                                  Expanded(
                                                                    child: Text(o,style: TextStyle(
                                                                      color: Colors.white,
                                                                      fontFamily: 'lato',
                                                                    ),),
                                                                  )
                                                                ],
                                                              ),
                                                            );
                                                          }).toList()),
                                                    )),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 6.0),
                                                  child: Container(
                                                      width: MediaQuery.of(context).size.width,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(25),
                                                        color: Colors.transparent,
                                                        border: Border.all(color: Color(0xffEC1C24).withOpacity(0.6),width: 2)
                                                      ),
                                                      child:
                                                      InkWell(
                                                        onTap: (){
                                                           int amount;
                                                          if(position == 0){
                                                            amount = price + (addprice*position);
                                                            registration_status(user_id,amount.toString(), "Package", "1");
                                                            launch("https://paytm.me/BgvN-yF");
                                                          }
                                                          else if(position == 1){
                                                            amount = price + (addprice*position);
                                                            registration_status(user_id,amount.toString(), "Package", "2");
                                                            launch("https://paytm.me/KCE6-yz");
                                                          }
                                                          else if(position == 2){
                                                            amount = price + (addprice*position);
                                                            registration_status(user_id,amount.toString(), "Package", "3");
                                                            launch("https://paytm.me/u-qzNyF");
                                                          }
                                                          //Navigator.push(context, MaterialPageRoute(builder: (context) => home_activity()));

                                                        },
                                                        child: Center(
                                                          child: Text("BUY",style: TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 17,
                                                              fontFamily: 'lato',
                                                              color: Colors.white
                                                          ),),
                                                        ),
                                                      )
                                                  ),
                                                ),
                                              ],
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
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ), */
        ),
      ),
     ]
    );
  }

  registration_status(String user_id,String amount,String payment_type , String coin ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String postUrl = "https://fintracon.in/mobile-authenticate/make-payment.php";
    print("stringrequest");
    var request = new http.MultipartRequest(
        "POST", Uri.parse(postUrl));

    request.fields['user_id'] = user_id;
    request.fields['amount'] = amount;
    request.fields['payment_type'] = payment_type;
    request.fields['coin'] = coin;

    request.send().then((response) {
      http.Response.fromStream(response).then((onValue) {
        try {
          print("onValue1${onValue.body}");
          Map mapRes = json.decode(onValue.body);
          setState(() {

          });
        } catch (e) {
          print("response$e");
        }
      });
    });
  }

}
