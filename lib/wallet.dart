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
                       Text("Add Money",style: TextStyle(
                         fontWeight: FontWeight.bold,
                         color: Colors.white,
                         fontSize: 18,
                       ),)
                     ],
                   ),
                 ],
               ),
             ),

             Align(
               alignment: Alignment.centerLeft,
               child: Card(
                 color: Colors.black,
                 shape: RoundedRectangleBorder(
                   side: BorderSide(color: Colors.black, width: 1),
                   borderRadius: BorderRadius.circular(10),
                 ),
                 margin: EdgeInsets.symmetric(vertical: 20.0,horizontal: 12),
                 child: Container(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[

                       Text("Available Balance",
                       style: TextStyle(
                         fontWeight: FontWeight.bold,
                         color: Colors.white,
                         fontSize: 13
                        ),
                       ),

                       SizedBox(
                         height: 6,
                       ),

                       Text("₹5648.00",
                         style: TextStyle(
                             fontWeight: FontWeight.bold,
                             color: Colors.white,
                             fontSize: 20
                         ),
                       ),
                     ],
                   ),
                 ),
               ),
             ),

             Padding(
               padding: const EdgeInsets.only(left: 10.0,right: 10,top: 50),
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
                         height: 40,
                         decoration: BoxDecoration(
                           color: Colors.grey[600],
                           borderRadius: BorderRadius.circular(10)
                         ),
                         child: Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text("₹500",style: TextStyle(
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
     );
  }
}