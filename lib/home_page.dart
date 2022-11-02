import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frig/home_activity.dart';
import 'package:frig/home_page_page.dart';
import 'package:frig/my_profile.dart';
import 'package:frig/new_home_page.dart';
import 'package:frig/new_page.dart';
import 'package:frig/portfolio.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:frig/wallet.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';

import 'Notificationservice/local_notification_service.dart';


class home_page extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return _home_page();
  }
}

class _home_page extends State<home_page> with TickerProviderStateMixin{
  late TabController _tabController;
  int _currentIndex = 0;
  var user_id;
  var PaymentStatus;
  String deviceTokenToSendPushNotification = "";

  List<Widget> tabs = [
    //home_activity(),
    page_home(),
    news(),
    portfolio(),
    profile(),
    //wallet(),
  ];

  userdata(String UserId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String postUrl = "https://fintracon.in/mobile-authenticate/userById.php";
    print("stringrequest");
    var request = new http.MultipartRequest(
        "POST", Uri.parse(postUrl));
    request.fields['UserId'] = UserId;
    request.send().then((response) {
      http.Response.fromStream(response).then((onValue) {
        try {
          print("onValue1${onValue.body}");
          Map mapRes = json.decode(onValue.body);
          setState(() {
            PaymentStatus = mapRes["commandResult"]["data"]["PaymentStatus"];
            var namedetail= mapRes["commandResult"]["data"]["Name"];
            prefs.setString("nameuser","$namedetail");
            prefs.setString("PaymentStatus",PaymentStatus);
            this.userdata(user_id);
          });
        } catch (e) {
          print("response$e");
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    get_blogdetails(context);
    _tabController = TabController(
      initialIndex: 1,
      length: 5,
      vsync: this,
    );
    // 1. This method call when app in terminated state and you get a notification
    // when you click on notification app open from terminated state and you can get notification data in this method

    FirebaseMessaging.instance.getInitialMessage().then(
          (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("New Notification");
          if (message.data['_id'] != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => profile(
                 // id: message.data['_id'],
                ),
              ),
            );
          }
        }
      },
    );
    // 2. This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
          (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");
          LocalNotificationService.createanddisplaynotification(message);

        }
      },
    );
    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
          (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['_id']}");
        }
      },
    );
  }

  Future<void> getDeviceTokenToSendNotification() async {
    final FirebaseMessaging _fcm = FirebaseMessaging.instance;
    final token = await _fcm.getToken();
    deviceTokenToSendPushNotification = token.toString();
    print("Token Value $deviceTokenToSendPushNotification");
  }

  get_blogdetails(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      user_id = prefs.getString("user_id");
     this.userdata(user_id);
    });
    print("blodid $user_id");
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    getDeviceTokenToSendNotification();
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
           PaymentStatus == "0"?Stack(
             children: [
               Icon(Icons.newspaper, color: Colors.black,),
               Positioned(
                   top: -1,
                   right: -4,
                   child: Icon(Icons.lock, color: Colors.white,size: 17,)),
             ],
           ):Icon(Icons.newspaper, color: Colors.white,),
           // Icon(
           //   PaymentStatus == "0"?Icons.lock:Icons.newspaper,
           //   color: Colors.white,),
           PaymentStatus == "0"?Stack(
             children: [
               Icon(Icons.monetization_on_rounded, color: Colors.black,),
               Positioned(
                   top: -1,
                   right: -4,
                   child: Icon(Icons.lock, color: Colors.white,size: 17,)),
             ],
           ):Icon(Icons.monetization_on_rounded,color: Colors.white,),
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