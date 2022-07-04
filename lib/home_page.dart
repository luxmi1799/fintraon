import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class home_page extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return _home_page();
  }
}

class _home_page extends State<home_page> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.black,
         appBar: PreferredSize(
         preferredSize: Size.fromHeight(10.0), // here the desired height
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
          )
         ),
       bottomNavigationBar: bottomNavigationBar,
       body: SingleChildScrollView(
         child: Column(
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
                               fontSize: 18,
                             ),),
                           SizedBox(
                             height: 6,
                           ),
                           Text("Welcome to Fintracon",
                             style: TextStyle(
                               color: Colors.white,
                               fontSize: 14,
                             ),)
                         ],
                       ),
                     ],
                   ),

                   Row(
                     children: [
                       SizedBox(
                         width: 20,
                           height: 20,
                           child: Icon(Icons.notifications,color: Colors.white,)
                       ),

                       SizedBox(
                         width: 6,
                       ),

                       SizedBox(
                           width: 20,
                           height: 20,
                           child: Icon(Icons.adjust,color: Colors.white,)
                       ),
                     ],
                   ),


                 ],
               ),
             ),

             Padding(
               padding: const EdgeInsets.all(10.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text("Explore Top Stocks ",
                     style: TextStyle(
                       color: Colors.white,
                       fontWeight: FontWeight.bold,
                       fontSize: 18,
                     ),),

                   Text("View all",
                     style: TextStyle(
                       color: Colors.white,
                       fontWeight: FontWeight.bold,
                       fontSize: 14,
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
                   borderRadius: BorderRadius.circular(25.0),
                   borderSide: BorderSide(
                   color: Colors.grey,
                   width: 2.0,
                 ),
               ),
                 ),
                 style: TextStyle(
                   color: Colors.white,
                 ),
               ),
             ),
           ],
         ),
       ),
     );
  }
  Widget get bottomNavigationBar {
    return ClipRRect(
      borderRadius:  BorderRadius.circular(25),
      child: BottomNavigationBar(
        backgroundColor: Colors.black.withOpacity(0.5),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.usb), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment_ind), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.multiline_chart), label: ''),
        ],
        unselectedItemColor: Colors.grey,
        selectedItemColor:Color(0xff1228E9),
        showUnselectedLabels: true,
      ),
    );
  }
}