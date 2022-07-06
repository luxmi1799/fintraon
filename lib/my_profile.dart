import 'package:flutter/material.dart';

class profile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _profile();
  }
}

class _profile extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
              TextSpan(text: "My Wallet",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  )
              ),
            ],
          ),
        ),
        actions: [
             Padding(
               padding: const EdgeInsets.only(right: 8.0),
               child: Center(
                 child: Text("Edit Profile",style: TextStyle(
                   fontSize: 14,
                   fontWeight: FontWeight.bold,
                   color: Colors.white,
                 ),),
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
                        ),),
                      SizedBox(
                        height: 6,
                      ),
                      Text("xyz@gmail.com",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
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
                height: 70,
                decoration: BoxDecoration(
                  color: Color(0xffb6d2cb),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Icon(Icons.card_giftcard,color: Colors.deepPurple,size: 30,),

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
                                fontSize: 14,
                              ),),

                              SizedBox(
                                height: 3,
                              ),

                              Text("Share your friend get \$20 of free stocks",style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
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
                color: Color(0xff2f2e2e),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.symmetric(vertical: 20.0,horizontal: 12),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.support,color: Colors.white,size: 25,),
                            SizedBox(width: 4,),
                            Text("Support",style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
                        child: Container(
                          width: 200,
                          height: 2,
                          color: Color(0xff524f4f),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.miscellaneous_services,color: Colors.white,size: 25,),
                            SizedBox(width: 4,),
                            Text("Services",style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
                        child: Container(
                          width: 200,
                          height: 2,
                          color: Color(0xff524f4f),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.settings,color: Colors.white,size: 25,),
                            SizedBox(width: 4,),
                            Text("Setting",style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
                        child: Container(
                          width: 200,
                          height: 2,
                          color: Color(0xff524f4f),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.login,color: Colors.white,size: 25,),
                            SizedBox(width: 4,),
                            Text("Log Out",style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
                        child: Container(
                          width: 200,
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
              padding: const EdgeInsets.only(left: 10.0,right: 10,top: 40,bottom: 10),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color:Color(0xff151414),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Center(
                        child: Text("We'h love to hear your feedback  on threads,if you have any?",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
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
    );
  }
}

//Color(0xffb6d2cb)
//
// Color(0xffF5F5F5)