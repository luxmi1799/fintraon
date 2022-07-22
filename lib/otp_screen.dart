import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:frig/home_page.dart';


class otp_screen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _otp_screen();
  }
}

class _otp_screen extends State<otp_screen>{
  String phonenum = "8975423996";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
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
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 0,
          title: Text("Login / Signup",style: TextStyle(
              color: Colors.white
          ),),
          backgroundColor: Colors.transparent,
        ),
        body:  Column(
          children: [

            SizedBox(
              height: 40,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
              child: Center(
                child: Text("Enter Verification Code",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
              child: Center(
                child: Text("We have sent you a 6 digit verification code on",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Center(
                child: Text("+91 $phonenum",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 20),
              child: OtpTextField(
                numberOfFields: 6,
                borderColor: Color(0xffEC1C24),
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode){
                  showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Text("Verification Code"),
                          content: Text('Code entered is $verificationCode'),
                        );
                      }
                  );
                }, // end onSubmit
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 30),
              child: InkWell(
                onTap: (){

                  setState(() {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => home_page()));
                  });

                },
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),//empty container can use inside of widget
                  height: 50,
                  alignment: Alignment.center,
                  //changebtn?Icon(Icons.done,color: Colors.white,):
                  child:Text("Login",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.white,
                  ),
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xffEC1C24),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ]
    );
  }
}