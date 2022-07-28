import 'package:flutter/material.dart';

import 'edit_profile.dart';

class profile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _profile();
  }
}

class _profile extends State<profile> {
  bool edit = false;
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
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          leading: InkWell(
              onTap: (){
                setState(() {
                });

              },
              child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
          backgroundColor: Colors.transparent,
          title: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: "My Profile",
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
          actions: [
               Padding(
                 padding: const EdgeInsets.only(right: 10.0),
                 child: InkWell(
                   onTap: (){
                     Navigator.of(context).push(MaterialPageRoute(builder: (context) => edit_profile()));
                   },
                   child: Center(
                     child: Text("Edit Profile",style: TextStyle(
                       fontSize: 16,
                       fontWeight: FontWeight.bold,
                       color: Colors.white,
                       fontFamily: 'lato',
                     ),),
                   ),
                 ),
               )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 12),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/home_pro.png',
                        width: 65,
                        height: 65,
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
                        Text("Sudeep!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'lato',
                          ),),
                        SizedBox(
                          height: 6,
                        ),
                        Text("xyz@gmail.com",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'lato',
                          ),)
                      ],
                    ),
                  ],
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 85,
                  decoration: BoxDecoration(
                    color: Color(0xffF3FBED),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           Image.asset("assets/refreral.png"),

                            SizedBox(
                              width: 7,
                            ),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Referral Code",style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  fontFamily: 'lato',
                                ),),

                                SizedBox(
                                  height: 3,
                                ),

                                Text("Share your friend get \$20 of free stocks",style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                  fontFamily: 'lato',
                                ),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Card(
                  color: Color(0xffffffff).withOpacity(0.08),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 12),
                  child: Container(
                    height: MediaQuery.of(context).size.width*0.65,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.support,color: Colors.white,size: 25,),
                              SizedBox(width: 4,),
                              Text("Support",style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontFamily: 'lato',
                                fontWeight: FontWeight.bold,
                              ),)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.8,
                            height: 2,
                            color: Color(0xff524f4f),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.miscellaneous_services,color: Colors.white,size: 25,),
                              SizedBox(width: 4,),
                              Text("Services",style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'lato',
                              ),)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.8,
                            height: 2,
                            color: Color(0xff524f4f),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.settings,color: Colors.white,size: 25,),
                              SizedBox(width: 4,),
                              Text("Setting",style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'lato',
                              ),)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 2,
                            color: Color(0xff524f4f),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.login,color: Colors.white,size: 25,),
                              SizedBox(width: 4,),
                              Text("Log Out",style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'lato',
                              ),)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 2,
                            color: Color(0xff524f4f),
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20.0,right: 20,top: 40,bottom: 10),
                child: Container(
                  height: 85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color:Color(0xff151414),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                            children:[
                              Image.asset("assets/img_1.png"),
                              Image.asset("assets/img.png")
                         ]),
                        SizedBox(
                            width: MediaQuery.of(context).size.width *0.5,
                            child: Text("We'h love to hear your feedback  on threads,if you have any?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'lato',
                              ),
                            ),
                          ),
                        Icon(Icons.arrow_forward_ios,color: Colors.white,size: 20,)

                      ],
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

//Color(0xffb6d2cb)
//
// Color(0xffF5F5F5)