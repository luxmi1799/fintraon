import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frig/mpin_create_page.dart';
import 'package:frig/sign_up.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'create_account.dart';
import 'loading_bar.dart';
import 'otp_screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: _login(),
    );
    // TODO: implement build
  }

}

class _login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _login_body();
  }
}

class _login_body extends State<_login> {
  bool phone = true;
  bool email = false;
  bool phone_widget = true;
  bool email_widget = false;
  var getdata;
  TextEditingController _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: Stack(
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
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0,bottom: 10),
                    child: Center(
                      child:Container(
                        width: 150,
                        height: 80,
                        child: Image.asset("assets/logo.png",
                          // fit:BoxFit.fill,
                        ),
                      ),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: Center(
                      child: Text("Login to continue",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'lato',
                          fontSize: 28,
                        ),),
                    ),
                  ),

                  Offstage(
                    offstage: true,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25.0,horizontal: 15),
                      child: Container(
                        height: 60,
                        color: Colors.black,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 50,
                                child: FlatButton(
                                  onPressed: (){

                                    setState(() {
                                      phone = true;
                                      email = false;
                                      email_widget=false;
                                    });

                                  },
                                  color: phone==true? Color(0xffEC1C24):Colors.grey[200],
                                  child: Text("Mobile No.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color:  phone==true? Colors.white:Colors.black,
                                      fontSize: 15,
                                      fontFamily: 'lato',
                                      fontWeight: FontWeight.bold,
                                      backgroundColor:phone==true? Color(0xffEC1C24):Colors.grey[200],
                                    ),),
                                ),
                              ),
                            ),
                            /*Expanded(
                              child: Container(
                                height: 50,
                                child: FlatButton(
                                  onPressed: (){
                                    setState(() {
                                      email = true;
                                      phone=false;
                                    });
                                    setState(() {
                                      email_widget = true;
                                    });
                                  },
                                  color:email==true?Color(0xffEC1C24):Colors.grey[200],
                                  child: Text("Email Id",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: email==true? Colors.white:Colors.black,
                                      fontSize: 15,
                                      fontFamily: 'lato',
                                      fontWeight: FontWeight.bold,
                                      backgroundColor:email==true? Color(0xffEC1C24):Colors.grey[200],
                                    ),),
                                ),
                              ),
                            ),*/
                          ],
                        ),
                      ),
                    ),
                  ),

                  Offstage(
                    offstage: email_widget,   //true means gayab
                    child: phone_widget == true? Padding(
                      padding: const EdgeInsets.only(top: 55.0,bottom: 5,right: 15,left: 15),
                      child: IntlPhoneField(
                        controller: _phoneController,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16
                        ),
                        enabled: true,
                        initialCountryCode: 'IN',
                        dropdownIcon: Icon(Icons.arrow_drop_down,color: Colors.white,),
                        decoration: InputDecoration(
                          hintText: 'Phone Number',
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontFamily: 'lato',
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 1.5, color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 1.5, color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          errorBorder:OutlineInputBorder(
                          borderSide: const BorderSide(width: 1.5, color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                       // onSubmitted: send_mobile_otp(_phoneController.text),
                        onChanged: (phone) {
                          print(phone.completeNumber);
                        },
                        onCountryChanged: (country) {
                          print('Country changed to: ' + country.name);
                        },
                      ),
                    ):null,
                  ),

                  Offstage(
                    offstage: !email_widget,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        // controller: emailController,
                        decoration: InputDecoration(
                            label: Text("Email ID"),
                            hintText: "Email ID",
                           // labelText: "email",
                            hintStyle: TextStyle(
                              fontSize:20,
                              color: Colors.white,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 1.5, color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 1.5, color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          // labelText: "OTP",
                          labelStyle: TextStyle(
                            fontSize:20,
                            color: Colors.white,
                            fontFamily: 'lato',
                          ),
                          //prefixIcon: new Icon(Icons.email),
                        ),
                        validator: (text){
                          return null;
                        },
                      ),
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(left: 15,bottom: 20,right:15,top: 10),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: MediaQuery.of(context).size.width ,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffEC1C24),
                        ),
                        child: FlatButton(
                          onPressed: (){
                            circle(context);
                            send_mobile_otp(_phoneController.text);
                          //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => otp_screen()));
                          },
                          child: Text("Login with MPIN",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'lato',
                              fontWeight: FontWeight.bold,
                              backgroundColor:  Color(0xffEC1C24),
                            ),),
                          // color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 10),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("New to Fintracon ?",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'lato',
                              color: Colors.white,
                            ),
                          ),
                          InkWell(

                            onTap: (){

                              setState(() {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => sign_up()));
                              });
                              //
                            },
                            child: Text(" Signup",
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'lato',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
        ),
          ),
       ]
      ),
    );
  }

  send_mobile_otp(String mobile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String postUrl = "https://fintracon.in/mobile-authenticate/login.php";
    print("stringrequest");
    var request = new http.MultipartRequest(
        "POST", Uri.parse(postUrl));
    request.fields['Mobile'] = mobile;
    request.send().then((response) {
      http.Response.fromStream(response).then((onValue) {
        try {
          Navigator.pop(context);
          print("onValue${onValue.body}");
          Map mapRes = json.decode(onValue.body);
          var success = mapRes["commandResult"]["success"];
          var msg = mapRes["commandResult"]["message"];

          if(success == 1){
            var otpdetail= mapRes["commandResult"]["data"]["password"];
            var user_id= mapRes["commandResult"]["data"]["user_id"];
            print("user_id$user_id");
            setState(() {
              getdata = otpdetail;
              prefs.setString("new_account", " ");
              prefs.setString("mobile_number",mobile);
              prefs.setString("otp_found",getdata);
              prefs.setString("user_id",user_id);
            });
            userdata(user_id);
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => mpin()));
          }
          else{
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(8.0)), //this right here
                    child: Container(
                      height: 160,
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width:340.0,
                            height: 50,
                            child: FlatButton(
                              onPressed: (){},
                              child: Text("Invalid Number",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  backgroundColor:  Color(0xffEC1C24),
                                ),),
                              color: Color(0xffEC1C24),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),

                          Center(
                            child: Text("Your login credentials is incorrect ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 110,
                                height: 50,
                                child: RaisedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    "Relogin",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  color:  Colors.white,
                                ),
                              ),

                              SizedBox(
                                width: 110,
                                height: 50,
                                child: RaisedButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => sign_up()));
                                    // Navigator.pushNamed(context, Myroutes.practical_home);
                                  },
                                  child: Text(
                                    "Create Account",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  color: Colors.white,
                                ),
                              ),
                              // ),


                            ],
                          ),
                          // SizedBox(
                          //   width: 320.0,
                          //   child: RaisedButton(
                          //     onPressed: () {},
                          //     child: Text(
                          //       "Save",
                          //       style: TextStyle(color: Colors.white),
                          //     ),
                          //     color: const Color(0xFF1BC0C5),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  );
                });
            // showDialog(
            //     context: context,
            //     builder: (BuildContext context) {
            //       return AlertDialog(
            //         title: Text("Mobile number not valid"),
            //         content: Text("Please check number / Register Your number first"),
            //         actions: <Widget>[
            //           FlatButton(
            //             child: Text("Close"),
            //             onPressed: () {
            //               Navigator.of(context).pop();
            //             },
            //           )
            //         ],
            //       );
            //     }
            // );


            // Fluttertoast.showToast(
            //     msg: msg,
            //     toastLength: Toast.LENGTH_LONG,
            //     gravity: ToastGravity.CENTER,
            //     timeInSecForIosWeb: 1
            // );
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