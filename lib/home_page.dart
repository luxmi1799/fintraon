import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frig/home_activity.dart';
import 'package:frig/home_page_page.dart';
import 'package:frig/my_profile.dart';
import 'package:frig/new_home_page.dart';
import 'package:frig/new_page.dart';
import 'package:frig/portfolio.dart';
import 'package:frig/wallet.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';


class home_page extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return _home_page();
  }
}

class _home_page extends State<home_page> with TickerProviderStateMixin{
  late TabController _tabController;
  int _currentIndex = 0;

  List<Widget> tabs = [
    //home_activity(),
    page_home(),
    news(),
    portfolio(),
    profile(),
    //wallet(),
  ];



  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 1,
      length: 5,
      vsync: this,
    );
  }
  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
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
      /* bottomNavigationBar: MotionTabBar(
         initialSelectedTab: "Portfolio",
         labels: const ["Home", "News", "Portfolio", "Profile"],
         icons: const [Icons.home, Icons.newspaper, Icons.monetization_on_rounded, Icons.people_alt],

         // optional badges, length must be same with labels
         tabSize: 50,
         tabBarHeight: 55,
         textStyle: const TextStyle(
           fontSize: 12,
           color: Colors.white,
           fontWeight: FontWeight.w500,
         ),
         tabIconColor: Color(0xffEC1C24),
         tabIconSize: 28.0,
         tabIconSelectedSize: 26.0,
         tabSelectedColor: Color(0xffEC1C24),
         tabIconSelectedColor: Colors.white,
         tabBarColor:  Color(0xFFffffff).withOpacity(0.02),
         onTabItemSelected: (int value) {
           setState(() {
             _tabController.index = value;
           });
         },
       ),*/
       bottomNavigationBar: CurvedNavigationBar(
         height: 60,
         color:Color(0xffEC1C24),
         backgroundColor:Colors.black ,
         items: <Widget>[
           Icon(Icons.home_filled,color: Colors.white,),
           Icon(Icons.newspaper,color: Colors.white,),
           Icon(Icons.monetization_on_rounded,color: Colors.white,),
           Icon(Icons.manage_accounts,color: Colors.white,),
           //Icon(Icons.account_balance_wallet,color: Colors.white,),
         ],
         letIndexChange: (index) => true,
         onTap: (index) {
           setState(() {
             _currentIndex = index;
           });
         },
       ),
       // body: TabBarView(
       //   physics: NeverScrollableScrollPhysics(), // swipe navigation handling is not supported
       //   controller: _tabController,
       //   // ignore: prefer_const_literals_to_create_immutables
       //   children: <Widget>[
       //     page_home(),
       //     //new_home(),
       //     //home_activity(),
       //     news(),
       //     portfolio(),
       //     profile(),
       //     wallet(),
       //   ],
       // ),
       //bottomNavigationBar: _buildBlurEffect(),
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