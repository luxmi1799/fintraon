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
                 height: 200,
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

         // Align(
         //   alignment: Alignment.centerRight,
         //   child: Container(
         //     width: 90,
         //     height: 20,
         //     decoration: BoxDecoration(
         //       borderRadius: BorderRadius.circular(15),
         //       color: Colors.white,
         //     ),
         //     child: Align(
         //       alignment: Alignment.center,
         //       child: Text("Cryptocurrency",
         //         style: TextStyle(
         //             color: Colors.black,
         //             fontSize: 10
         //         ),),
         //     ),
         //   ),
         // ),

         Padding(
           padding: const EdgeInsets.all(10.0),
           child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [

                   Image.asset("assets/calender.png"),
                   SizedBox(
                     width: 5,
                   ),
                   Text("3 Sept 2020",
                     style: TextStyle(
                       color: Colors.white70,
                     ),
               ),

               // Container(
               //   width: 170,
               //   height: 50,
               //   decoration: BoxDecoration(
               //     color: Colors.white.withOpacity(0.3),
               //   ),
               //   child: Center(
               //     //alignment: Alignment.center,
               //     child:Text.rich(
               //       TextSpan(
               //         children: [
               //           TextSpan(text: " What is the future of ",
               //               style: TextStyle(
               //                 color: Colors.white,
               //                 fontSize: 16,
               //               )
               //           ),
               //           TextSpan(text: "cryptocurrencies? ",
               //               style: TextStyle(
               //                 color: Colors.white,
               //                 fontWeight: FontWeight.bold,
               //                 fontSize: 16,
               //               )
               //           ),
               //         ],
               //       ),
               //     ),
               //   ),
               // ),

             ],
           ),
         ),

               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Text(
                   "What is the future of cryptocurrencies?",
                   style: TextStyle(
                     fontSize: 21,
                     color: Color(0xffEC1C24),
                     fontWeight: FontWeight.bold
                   ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Text(
                   "The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                   style: TextStyle(
                     fontSize: 16,
                     color: Colors.white,
                   ),
                 ),
               ),

         Padding(
           padding: const EdgeInsets.all(10.0),
           child: Text(
             "when an unknown printer took a gallery of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum,It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
             style: TextStyle(
               fontSize: 16,
               color: Colors.white,
             ),
           ),
         ),
       ],
     ),
   );
  }
}