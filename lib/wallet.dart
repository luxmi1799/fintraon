import 'package:flutter/material.dart';

class wallet extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return _wallet();
  }
}

class _wallet extends State<wallet> {
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
                 padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 12),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     ClipOval(
                       child: Image.asset(
                         'assets/home_pro.png',
                         width: 60,
                         height: 60,
                         fit: BoxFit.cover,
                       ),
                     ),

                     Row(
                       children: [
                         Image.asset("assets/addmoney.png"),
                         Text(" Add Money",style: TextStyle(
                           fontWeight: FontWeight.bold,
                           color: Colors.white,
                           fontSize: 18,
                         ),)
                       ],
                     ),
                   ],
                 ),
               ),

               Padding(
                 padding: const EdgeInsets.all(20.0),
                 child: Container(
                        width: MediaQuery.of(context).size.width,
                         height: 120 ,
                        decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(8)
                       ),
                       child: Padding(
                         padding: const EdgeInsets.all(30.0),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: <Widget>[

                             Text("Available Balance",
                             style: TextStyle(
                              // fontWeight: FontWeight.bold,
                               color: Colors.black,
                               fontSize: 19
                              ),
                             ),

                             SizedBox(
                               height: 8,
                             ),

                             Text("₹ 5648.00",
                               style: TextStyle(
                                   fontWeight: FontWeight.bold,
                                   color: Colors.black,
                                   fontSize: 22
                               ),
                             ),
                           ],
                         ),
                       ),
                     ),
               ),


               Padding(
                 padding: const EdgeInsets.only(left: 10.0,right: 10,top: 30),
                 child: Container(
                   width: MediaQuery.of(context).size.width,
                   child: ListView.builder(
                     itemCount: 5,
                     scrollDirection: Axis.vertical,
                     physics: ScrollPhysics(),
                     shrinkWrap: true,
                     itemBuilder: (context, position) {
                       return  Padding(
                         padding: const EdgeInsets.all(10.0),
                         child: Container(
                           width: MediaQuery.of(context).size.width,
                           height: 60,
                           decoration: BoxDecoration(
                               color: Color(0xffffffff).withOpacity(0.1),
                             borderRadius: BorderRadius.circular(10)
                           ),
                           child: Padding(
                             padding: const EdgeInsets.all(10.0),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Text("₹ 500",style: TextStyle(
                                   color: Colors.white,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 18,
                                 ),),
                                 Text("Debit",style: TextStyle(
                                   color: Colors.white,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 18,
                                 ),),
                               ],
                             ),
                           ),
                         ),
                       );
                     },
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