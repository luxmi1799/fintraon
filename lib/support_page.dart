import 'package:flutter/material.dart';
import 'package:frig/support_activity.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gradient_borders/gradient_borders.dart';


class support_page extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
      return _support_page();
  }
}

class _support_page extends State<support_page> {
  @override
  Widget build(BuildContext context) {
    return Stack(
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
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
            leading: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios, color: Colors.white,),
            ),
            title: const Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: "Support",
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
                Center(
                  child: Text("Contact Us",style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w800
                  ),),
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                    color: Colors.transparent,
                    child:Container(
                      width: MediaQuery.of(context).size.width *.9,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: const GradientBoxBorder(
                            gradient: LinearGradient(colors: [Colors.blue, Colors.red]),
                            width: 4,
                          ),
                          borderRadius: BorderRadius.circular(6)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.email,size: 30,color: Colors.white,),
                          Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),

                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text("Email Us",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color:Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20
                                  ),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text("fintracon44@gmail.com",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color:Colors.white,
                                      fontWeight: FontWeight.w200,
                                      fontSize: 15
                                  ),),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                ),

                SizedBox(
                  height: 20,
                ),
                InkWell(
                  child: Card(
                      color: Colors.transparent,
                      child:Container(
                        width: MediaQuery.of(context).size.width *.9,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: const GradientBoxBorder(
                              gradient: LinearGradient(colors: [Colors.blue, Colors.red]),
                              width: 4,
                            ),
                            borderRadius: BorderRadius.circular(6)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.call,size: 30,color: Colors.white,),
                            Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text("Call Us",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        color:Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20
                                    ),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text("+91 7900430044",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        color:Colors.white,
                                        fontWeight: FontWeight.w200,
                                        fontSize: 15
                                    ),),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
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