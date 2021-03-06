import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frig/home_activity.dart';
import 'package:frig/my_profile.dart';
import 'package:frig/new_page.dart';
import 'package:frig/portfolio.dart';
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
    news(),
    portfolio(),
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: CustomNavigationBar(
        iconSize: 30.0,
        selectedColor:Color(0xffEC1C24),
        strokeColor: Colors.white,
        unSelectedColor: Colors.white,
        backgroundColor: Color(0xffffffff).withOpacity(0.1),
        borderRadius: Radius.circular(10.0),
        blurEffect: true,
        opacity: 0.8,
        items: [
          CustomNavigationBarItem(
            title: Text("Home",
              style: TextStyle(
              fontSize: 10,
              fontFamily: 'lato',
              color: Colors.white
            ),),
            icon: Icon(Icons.home_filled),
            ),
          CustomNavigationBarItem(
            title: Text("News",
              style: TextStyle(
                  fontSize: 10,
                  fontFamily: 'lato',
                  color: Colors.white
              ),),
            icon: Icon(Icons.newspaper),
          ),
          CustomNavigationBarItem(
            title: Text("Portfolio",
              style: TextStyle(
                  fontSize: 10,
                  fontFamily: 'lato',
                  color: Colors.white
              ),),
            icon: Icon(Icons.monetization_on_rounded),
          ),
          CustomNavigationBarItem(
            title: Text("Profile",
              style: TextStyle(
                  fontSize: 10,
                  fontFamily: 'lato',
                  color: Colors.white
              ),),
            icon: Icon(Icons.person),
          ),
          CustomNavigationBarItem(
            title: Text("Wallets",
              style: TextStyle(
                  fontSize: 10,
                  fontFamily: 'lato',
                  color: Colors.white
              ),),
            icon: Icon(Icons.account_balance_wallet),
          ),

        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        isFloating: true,
      ),
    );
  }
}

//https://www.figma.com/file/8CzEQCaygRDFMHOC2AGikS/Fintracon?node-id=0%3A1