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

          ],
        ),
      ),
    );
  }
}

//Color(0xffb6d2cb)