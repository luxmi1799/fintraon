import 'package:flutter/material.dart';

class news_details extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return _details();
  }
}

class _details extends State<news_details> {
  @override
  Widget build(BuildContext context) {
   return SingleChildScrollView(
     child: Column(
       children: [
         Padding(
           padding: const EdgeInsets.all(10.0),
           child: Stack(
             children: [
               Container(
                 height: 120,
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

         Align(
           alignment: Alignment.centerRight,
           child: Container(
             width: 90,
             height: 20,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(15),
               color: Colors.white,
             ),
             child: Align(
               alignment: Alignment.center,
               child: Text("Cryptocurrency",
                 style: TextStyle(
                     fontWeight: FontWeight.bold,
                     color: Colors.black,
                     fontSize: 10
                 ),),
             ),
           ),
         ),

         Row(
           children: [

           ],
         ),
       ],
     ),
   );
  }
}