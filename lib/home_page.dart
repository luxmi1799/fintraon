import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frig/home_activity.dart';
import 'package:frig/my_profile.dart';
import 'package:frig/wallet.dart';

class home_page extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return _home_page();
  }
}

class _home_page extends State<home_page> {
  int _currentIndex = 0;
  List<Widget> tabs = [
    home_activity(),
    Text("3333"),
    home_activity(),
    profile(),
    wallet(),
  ];
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
       bottomNavigationBar: _buildBlurEffect(),
       body:tabs[_currentIndex],
     );
  }

  Widget _buildBlurEffect() {
    return CustomNavigationBar(
      iconSize: 30.0,
      selectedColor:Color(0xff1228E9),
      strokeColor: Colors.white,
      unSelectedColor: Colors.grey[600],
      backgroundColor: Colors.white60,
      borderRadius: Radius.circular(20.0),
      blurEffect: true,
      opacity: 0.8,
      items: [
        CustomNavigationBarItem(
          title: Text("Home",
            style: TextStyle(
            fontSize: 10,
            color: Colors.white
          ),),
          icon: Icon(Icons.assignment_ind),
          ),
        CustomNavigationBarItem(
          title: Text("News",
            style: TextStyle(
                fontSize: 10,
                color: Colors.white
            ),),
          icon: Icon(Icons.assignment_ind),
        ),
        CustomNavigationBarItem(
          title: Text("Portfolio",
            style: TextStyle(
                fontSize: 10,
                color: Colors.white
            ),),
          icon: Icon(Icons.assignment_ind),
        ),
        CustomNavigationBarItem(
          title: Text("Profile",
            style: TextStyle(
                fontSize: 10,
                color: Colors.white
            ),),
          icon: Icon(Icons.assignment_ind),
        ),
        CustomNavigationBarItem(
          title: Text("Wallets",
            style: TextStyle(
                fontSize: 10,
                color: Colors.white
            ),),
          icon: Icon(Icons.assignment_ind),
        ),

      ],
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      isFloating: true,
    );
  }
}