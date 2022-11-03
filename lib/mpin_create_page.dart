import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frig/loading_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'create_account.dart';
import 'home_page.dart';



// ignore: use_key_in_widget_constructors
class mpin extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return PinCodeVerificationScreen(
        phoneNumber:
        "+8801376221100");
  }
}

class PinCodeVerificationScreen extends StatefulWidget {
  final String? phoneNumber;


  const PinCodeVerificationScreen({
    Key? key,
    this.phoneNumber,
  }) : super(key: key);

  @override
  _PinCodeVerificationScreenState createState() =>
      _PinCodeVerificationScreenState();
}

class _PinCodeVerificationScreenState extends State<PinCodeVerificationScreen> {
  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";
  String new_acc = "";
  var otp_val;
  var getdata;
  String enterotp ="";
  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    get_otp(context);
    super.initState();
  }



  get_otp(BuildContext context) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      //  Navigator.pop(context);
      new_acc = prefs.getString("new_account")!;
      otp_val = prefs.getString("otp_found");
      //isNumeric(phonenum);
    });

  }
  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.maxFinite,
          height: MediaQuery
              .of(context)
              .size
              .height,
          color: Colors.black.withOpacity(0.5),
        ),
        Opacity(
            opacity: 1,
            child: Image.asset(
              'assets/backg.png',
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              fit: BoxFit.cover,
            )
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: GestureDetector(
            onTap: () {},
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                children: <Widget>[
                  const SizedBox(height: 30),
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
                  const SizedBox(height: 8),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Create MPIN to Login',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22,color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                    child: RichText(
                      text: TextSpan(
                          text: "Enter the code sent to ",
                          children: [
                            TextSpan(
                                text: "${widget.phoneNumber}",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15)),
                          ],
                          style:
                          const TextStyle(color: Colors.black54, fontSize: 15)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: formKey,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 30),
                        child: PinCodeTextField(
                          appContext: context,
                          pastedTextStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          length: 6,
                          obscureText: true,
                          obscuringCharacter: '*',
                          // obscuringWidget: const FlutterLogo(
                          //   size: 24,
                          // ),
                          blinkWhenObscuring: true,
                          animationType: AnimationType.fade,
                          validator: (v) {
                            if (v!.length < 3) {
                              return "MPIN cannot be less than 6 digit";
                            } else {
                              return null;
                            }
                          },
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            inactiveFillColor: Colors.white,
                            activeColor: Colors.red,
                            inactiveColor: Colors.red,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 50,
                            fieldWidth: 40,
                            activeFillColor: Colors.white,
                          ),
                          cursorColor: Colors.black,
                          animationDuration: const Duration(milliseconds: 300),
                          enableActiveFill: true,
                          errorAnimationController: errorController,
                          controller: textEditingController,
                          keyboardType: TextInputType.number,
                          boxShadows: const [
                            BoxShadow(
                              offset: Offset(0, 1),
                              color: Colors.black12,
                              blurRadius: 10,
                            )
                          ],
                          onCompleted: (v) {
                            debugPrint("Completed");
                          },
                          // onTap: () {
                          //   print("Pressed");
                          // },
                          onChanged: (value) {
                            debugPrint(value);
                            setState(() {
                              currentText = value;
                            });
                          },
                          beforeTextPaste: (text) {
                            debugPrint("Allowing to paste $text");
                            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                            //but you can show anything you want here, like your pop up saying wrong paste format or etc
                            return true;
                          },
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(
                      hasError ? "*Please fill up all the cells properly" : "",
                      style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Didn't receive the code? ",
                        style: TextStyle(color: Colors.black54, fontSize: 15),
                      ),
                    ],
                  ),
                  Container(
                    margin:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                    child: ButtonTheme(
                      height: 50,
                      child: TextButton(
                        onPressed: () {
                          formKey.currentState!.validate();
                          // conditions for validating
                          if (currentText.length != 6 ) {
                            errorController!.add(ErrorAnimationType
                                .shake); // Triggering error shake animation
                            setState(() => hasError = true);
                          } else {
                            setState(
                                  () {
                                    circle(context);
                                    match_otp(context);
                                hasError = false;
                                //snackBar("OTP Verified!!");
                              },
                            );
                          }
                        },
                        child: Center(
                            child: Text(
                             new_acc=="new_account"?"Sign Up".toUpperCase():"Login".toUpperCase(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Color(0xFFEC1C24),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                        ]),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                            child: TextButton(
                              child: const Text("Clear",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),),
                              onPressed: () {
                                textEditingController.clear();
                              },
                            )),
                        Flexible(
                            child: TextButton(
                              child: const Text("",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),),
                              onPressed: () {
                                setState(() {
                                  textEditingController.text = "123456";
                                });
                              },
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
  match_otp(BuildContext context) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
      print("correct");
      if(new_acc == "new_account"){
        Navigator.pop(context);
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => create_account()));
        prefs.setString('password',currentText);
        prefs.remove('new_account');
      }
      else{
        if(otp_val.toString() == currentText) {
          Navigator.pop(context);
          prefs.setBool("isLoggedIn", true);
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => home_page()), (
              route) => false
          );
        }
        else{
          Navigator.pop(context);
          Fluttertoast.showToast(
              msg: "OTP is invalid",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1
          );
          print("otp_val$otp_val .....$enterotp");
        }
        //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => home()));
      }
  }
}