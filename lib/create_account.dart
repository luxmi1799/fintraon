import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frig/daily_shares_page.dart';
import 'package:frig/home_page.dart';
import 'package:frig/sign_in.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class create_account extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _create_account();
  }
}

class _create_account extends State<create_account> {
  bool _passwordVisible = true;
  bool isChecked = false;
  var getdata;
  var user_idd;
  var password;
  String phonenum = "";
  String deviceTokenToSendPushNotification = "";
  final emailcontroller = new TextEditingController();
  final namecontroller = new TextEditingController();
  final phonecontroller = new TextEditingController();


  void initState() {
    super.initState();
    // loading(context);
    Future.delayed(Duration(seconds: 2), () {
    });
    get_otp(context);
    getDeviceTokenToSendNotification();
    // isNumeric("8076799976");
  }



  get_otp(BuildContext context) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      //  Navigator.pop(context);
      phonenum = prefs.getString('mobile_number')!;
      password = prefs.getString('password')!;
      phonecontroller.text = phonenum;
    });
    print("phonem$phonenum");
  }

  Future<void> getDeviceTokenToSendNotification() async {
    final FirebaseMessaging _fcm = FirebaseMessaging.instance;
    final token = await _fcm.getToken();
    deviceTokenToSendPushNotification = token.toString();
    print("Token Value1 $deviceTokenToSendPushNotification");
  }

  @override
  Widget build(BuildContext context) {
     return Stack(
       children:
       [
         Container(
           width: double.maxFinite,
           height: MediaQuery.of(context).size.height,
           color: Colors.black,
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
         backgroundColor: Colors.black.withOpacity(0.7),
         appBar:  AppBar(
           centerTitle: true,
           leading: IconButton(
               icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
               onPressed: () {
                 setState(() {
                 });
               }),
           backgroundColor: Colors.transparent,
           elevation: 0.0,
         ),
         body: SingleChildScrollView(
           child: Column(
             children: [
               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 15),
                 child: Align(
                   alignment: Alignment.centerLeft,
                   child: Text("Don’t have an account?",
                   style: TextStyle(
                     color: Colors.white,
                     fontWeight: FontWeight.bold,
                     fontFamily: 'lato',
                     fontSize: 20,
                   ),),
                 ),
               ),

               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
                 child: IntlPhoneField(
                   controller: phonecontroller,
                  // enabled: false,
                   readOnly: true,
                   style: TextStyle(
                     color: Colors.white
                   ),
                   initialCountryCode: 'IN',
                   decoration: InputDecoration(
                     hintText: 'Phone Number',
                     hintStyle: TextStyle(
                         color: Colors.white,
                         fontFamily: 'lato',
                     ),
                     enabledBorder: OutlineInputBorder(
                       borderSide: const BorderSide(width: 1.5, color: Colors.grey),
                       borderRadius: BorderRadius.circular(15),
                     ),
                     focusedBorder: OutlineInputBorder(
                       borderSide: const BorderSide(width: 1.5, color: Colors.grey),
                       borderRadius: BorderRadius.circular(15),
                     ),
                   ),
                 //  onSubmitted: sendotp(),
                   onChanged: (phone) {
                     print(phone.completeNumber);
                   },
                   onCountryChanged: (country) {
                     print('Country changed to: ' + country.name);
                   },
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),

                 child: Form(
                   child: TextFormField(
                     style: TextStyle(
                       color: Colors.white
                     ),
                     controller: namecontroller,
                     decoration: InputDecoration(
                       focusedBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(15.0),
                         borderSide: BorderSide(
                           color: Colors.grey,
                         ),
                       ),
                       enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(15.0),
                         borderSide: BorderSide(
                           color: Colors.grey,
                           width: 2.0,
                         ),
                       ),
                       border: const OutlineInputBorder(),
                       hintText: 'enter name',
                       hintStyle: TextStyle(
                         color: Colors.white,
                         fontSize: 14

                       ),
                       labelText: "Name",
                       labelStyle: TextStyle(
                         fontSize:15,
                         fontFamily: 'lato',
                         color: Colors.white),
                       ),
                     ),
                   ),
                 ),

               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),

                 child: Form(
                   child: TextFormField(
                     style: TextStyle(
                         color: Colors.white
                     ),
                     controller: emailcontroller,
                     decoration: InputDecoration(
                       focusedBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(15.0),
                         borderSide: BorderSide(
                           color: Colors.grey,
                         ),
                       ),
                       enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(15.0),
                         borderSide: BorderSide(
                           color: Colors.grey,
                           width: 2.0,
                         ),
                       ),
                       border: const OutlineInputBorder(),
                       hintText: 'Email ID',
                       hintStyle: TextStyle(
                           color: Colors.white,
                           fontSize: 14
                       ),
                       labelText: "Email ID",
                       labelStyle: TextStyle(
                           fontSize:15,
                           fontFamily: 'lato',
                           color: Colors.white),
                   ),
                 ),
               ),
              ),

               // Padding(
               //   padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
               //
               //   child: Form(
               //     child: TextFormField(
               //       decoration: InputDecoration(
               //         focusedBorder: OutlineInputBorder(
               //           borderRadius: BorderRadius.circular(15.0),
               //           borderSide: BorderSide(
               //             color: Colors.grey,
               //           ),
               //         ),
               //         enabledBorder: OutlineInputBorder(
               //           borderRadius: BorderRadius.circular(15.0),
               //           borderSide: BorderSide(
               //             color: Colors.grey,
               //             width: 2.0,
               //           ),
               //         ),
               //         border: const OutlineInputBorder(),
               //         hintText: 'enter Password',
               //         hintStyle: TextStyle(
               //             color: Colors.white,
               //             fontSize: 14
               //         ),
               //         labelText: "Confirm Password",
               //         labelStyle: TextStyle(
               //             fontSize:15,
               //             color: Colors.white),
               //         suffixIcon: IconButton(
               //           icon: Icon(
               //             // Based on passwordVisible state choose the icon
               //             _passwordVisible
               //                 ? Icons.visibility
               //                 : Icons.visibility_off,
               //
               //              color: Colors.white,
               //           ),
               //           onPressed: () {
               //             // Update the state i.e. toogle the state of passwordVisible variable
               //             setState(() {
               //               _passwordVisible = !_passwordVisible;
               //             });
               //           },
               //         ),
               //       ),
               //     ),
               //   ),
               // ),



              /* Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                 child: Form(
                   child: TextFormField(
                     decoration: InputDecoration(
                       focusedBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(15.0),
                         borderSide: BorderSide(
                           color: Colors.grey,
                         ),
                       ),
                       enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(15.0),
                         borderSide: BorderSide(
                           color: Colors.grey,
                           width: 2.0,
                         ),
                       ),
                       border: const OutlineInputBorder(),
                       hintText: 'enter name',
                       hintStyle: TextStyle(
                           color: Colors.white,
                           fontSize: 14
                       ),
                       labelText: "Name On Card",
                       labelStyle: TextStyle(
                           fontSize:15,
                           color: Colors.white),
                     ),
                   ),
                 ),
               ),

               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                 child: Form(
                   child: TextFormField(
                     keyboardType: TextInputType.number,
                     decoration: InputDecoration(
                       focusedBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(15.0),
                         borderSide: BorderSide(
                           color: Colors.grey,
                         ),
                       ),
                       enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(15.0),
                         borderSide: BorderSide(
                           color: Colors.grey,
                           width: 2.0,
                         ),
                       ),
                       border: const OutlineInputBorder(),
                       hintText: 'enter name',
                       hintStyle: TextStyle(
                           color: Colors.white,
                           fontSize: 14
                       ),
                       labelText: "Card Number",
                       labelStyle: TextStyle(
                           fontSize:15,
                           color: Colors.white),
                     ),
                     obscureText: true,
                   ),
                 ),
               ),

               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                 child: Form(
                   child: TextFormField(
                     keyboardType: TextInputType.number,
                     decoration: InputDecoration(
                       focusedBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(15.0),
                         borderSide: BorderSide(
                           color: Colors.grey,
                         ),
                       ),
                       enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(15.0),
                         borderSide: BorderSide(
                           color: Colors.grey,
                           width: 2.0,
                         ),
                       ),
                       border: const OutlineInputBorder(),
                       hintText: 'enter date',
                       hintStyle: TextStyle(
                           color: Colors.white,
                           fontSize: 14
                       ),
                       labelText: "Expiration Date",
                       labelStyle: TextStyle(
                           fontSize:15,
                           color: Colors.white),
                     ),
                   ),
                 ),
               ),

               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     Expanded(
                       child: Padding(
                         padding: const EdgeInsets.all(0),
                         child: Form(
                           child: TextFormField(
                             keyboardType: TextInputType.number,
                             decoration: InputDecoration(
                               focusedBorder: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(15.0),
                                 borderSide: BorderSide(
                                   color: Colors.grey,
                                 ),
                               ),
                               enabledBorder: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(15.0),
                                 borderSide: BorderSide(
                                   color: Colors.grey,
                                   width: 2.0,
                                 ),
                               ),
                               border: const OutlineInputBorder(),
                               hintText: 'enter CVV',
                               hintStyle: TextStyle(
                                   color: Colors.white,
                                   fontSize: 14
                               ),
                               labelText: "CVV",
                               labelStyle: TextStyle(
                                   fontSize:15,
                                   color: Colors.white),
                             ),
                           ),
                         ),
                       ),
                     ),

                     SizedBox(
                       width: 8,
                     ),

                     Expanded(
                       child: Padding(
                         padding: const EdgeInsets.all(0),
                         child: Form(
                           child: TextFormField(
                             keyboardType: TextInputType.number,
                             decoration: InputDecoration(
                               focusedBorder: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(15.0),
                                 borderSide: BorderSide(
                                   color: Colors.grey,
                                 ),
                               ),
                               enabledBorder: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(15.0),
                                 borderSide: BorderSide(
                                   color: Colors.grey,
                                   width: 2.0,
                                 ),
                               ),
                               border: const OutlineInputBorder(),
                               hintText: 'enter code',
                               hintStyle: TextStyle(
                                   color: Colors.white,
                                   fontSize: 14
                               ),
                               labelText: "Coupan Code",
                               labelStyle: TextStyle(
                                   fontSize:15,
                                   color: Colors.white),
                             ),
                           ),
                         ),
                       ),
                     ),
                   ],
                 ),
               ),*/



               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
                 child: Row(
                   children: [
                     //  Expanded(
                     Checkbox(
                       checkColor: Colors.white,
                       fillColor: MaterialStateProperty.resolveWith(getColor),
                       value: isChecked,
                       onChanged: (bool? value) {
                         setState(() {
                           isChecked = value!;
                         });
                       },
                     ),
                     // ),
                     InkWell(
                       onTap: (){
                         print("rich");
                       },
                       child: RichText(
                         text: const TextSpan(
                             text: ' I agree the',
                             style: const TextStyle(
                                 color: Colors.white, fontSize: 18),
                             children: [
                               TextSpan(
                                 text: ' term and conditions',
                                 style: const TextStyle(
                                   color: Color(0xffEC1C24),
                                 ),
                               ),
                             ]),
                       ),
                     ),
                   ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(left: 20,bottom: 20,right: 20),
                 child: Align(
                   alignment: Alignment.bottomCenter,
                   child: Container(
                     width: MediaQuery.of(context).size.width * 0.9,
                     height: 50,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       color: Color(0xffEC1C24),
                     ),
                     child: TextButton(
                       onPressed: (){
                         signup_details(emailcontroller.text, phonenum, namecontroller.text,password , deviceTokenToSendPushNotification);
                        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => home_page()));
                       },
                       child: Text("SIGN UP",
                         textAlign: TextAlign.center,
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: 16,
                           fontWeight: FontWeight.bold,
                           backgroundColor:  Color(0xffEC1C24),
                         ),),
                       // color: Colors.white,
                     ),
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

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return  Color(0xffEC1C24);
    }
    return Colors.red;
  }

  signup_details(String email,String mobile , String name , String Password , String token ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String postUrl = "https://fintracon.in/mobile-authenticate/update-profile.php";
    print("stringrequest");
    var request = new http.MultipartRequest(
        "POST", Uri.parse(postUrl));
    request.fields['Email'] = email;
    request.fields['Name'] = name;
    request.fields['Mobile'] = mobile;
    request.fields['Password'] = Password;
    request.fields['device_token'] = token;
    request.send().then((response) {
      http.Response.fromStream(response).then((onValue) {
        try {
          Navigator.pop(context);
          print("onValue${onValue.body}");
          Map mapRes = json.decode(onValue.body);

          var success = mapRes["commandResult"]["success"];
          var msg = mapRes["commandResult"]["message"];

          if(success == 1){
            var email= mapRes["commandResult"]["data"]["email"];
            var name = mapRes["commandResult"]["data"]["name"];
            // var user_id = mapRes["commandResult"]["user_id"];
            print("useruser$user_idd");
            setState(() {
              getdata = email;
              prefs.setString("email",email);
              prefs.setString("name",name);
              userdata(user_idd);
            });
            //Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => home_page()));
          }
          else{
            Fluttertoast.showToast(
                msg: msg,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1
            );
          }
          print("getdatata$getdata)");

        } catch (e) {
          print("response$e");
        }
      });
    });
  }

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
          var emaildetail= mapRes["commandResult"]["data"]["Email"];
          var namedetail= mapRes["commandResult"]["data"]["Name"];
          var Mobile= mapRes["commandResult"]["data"]["Mobile"];
          setState(() {
            prefs.setString("email_id","$emaildetail");
            prefs.setString("name_user","$namedetail");
            prefs.setString("Mobile","$Mobile");
          });
          //   print("getdatata$email $name)");

        } catch (e) {
          print("response$e");
        }
      });
    });
  }
}