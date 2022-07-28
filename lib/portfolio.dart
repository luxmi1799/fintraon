import 'dart:convert';

import 'package:flutter/material.dart';

class portfolio extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return _package();
  }
}

class _package extends State<portfolio> {
  String myStringWithLinebreaks = "Line 1\nLine 2";
  int price = 500;
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
        Scaffold(
        //backgroundColor: Color(0xff909090),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Stack(
                  children: [
                    Container(
                      height: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage("assets/newsdetail.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
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
                padding:  EdgeInsets.only(left: 10.0,right: 10),
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 340,
                    child: ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, position) {
                        return  Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Card(
                            color: Colors.white.withOpacity(0.1),
                            child: Container(
                              width: 290,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/money.png"),
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
                                            child: Text("${10*(position+1)} Trading",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'lato',
                                              fontSize: 20,
                                            ),),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text("₹ ${price*(position+1)} For ${position+1} day",style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
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
                                            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
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
                                                      padding: const EdgeInsets.only(top: 4.0),
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
                                                  padding: const EdgeInsets.only(top: 12.0),
                                                  child: Container(
                                                      width: MediaQuery.of(context).size.width,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(5),
                                                        gradient: LinearGradient(
                                                          colors: [
                                                            const Color(0xFFEC1C24),
                                                            const Color(0xFFF1424F),
                                                          ],
                                                          begin: Alignment.topCenter,
                                                          end: Alignment.bottomCenter,
                                                        ),
                                                      ),
                                                      child:
                                                      InkWell(
                                                        onTap: (){

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
        ),
      ),
     ]
    );
  }
}


//Container(
//                 height: 200,
//                 child: Scaffold(
//                     backgroundColor: Colors.yellow,
//                     body: Center(
//                       child: Stack(
//                         alignment: Alignment.topCenter,
//                         clipBehavior: Clip.none,
//                         children: [
//                           Card(
//                             color: Colors.white,
//                             child: Container(
//                               height: 300,
//                               width: 300,
//                             ),
//                           ),
//                           Positioned(
//                             top: -50,
//                             child: Container(
//                               height: 100,
//                               width: 100,
//                               // color: Colors.yellow,
//                               decoration: BoxDecoration(
//                                   shape: BoxShape.circle, color: Colors.yellow),
//                             ),
//                           ),
//                           Positioned(
//                             top: -40,
//                             child: Container(
//                               height: 80,
//                               width: 80,
//                               // color: Colors.yellow,
//                               decoration: BoxDecoration(
//                                   shape: BoxShape.circle, color: Colors.white),
//                             ),
//                           )
//                         ],
//                       ),)),
//               ),