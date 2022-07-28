import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'create_account.dart';
import 'otp_screen.dart';


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
                    padding: const EdgeInsets.only(top: 120.0,bottom: 10),
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

                  Padding(
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
                          Expanded(
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
                          ),
                        ],
                      ),
                    ),
                  ),

                  Offstage(
                    offstage: email_widget,   //true means gayab
                    child: phone_widget == true? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 10),
                      child: IntlPhoneField(
                        initialCountryCode: 'IN',
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                            labelStyle: TextStyle(
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
                        ),
                        onSubmitted: sendotp(),
                        onChanged: (phone) {
                          print(phone.completeNumber);
                        },
                        onCountryChanged: (country) {
                          print('Country changed to: ' + country.name);
                        },
                      ),
                    ):otp_enter(context),
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
                    padding: const EdgeInsets.only(left: 15,bottom: 20,right:15,top: 50),
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
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => otp_screen()));
                          },
                          child: Text("Send OTP",
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
                                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => create_account()), (route) => false,);
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

  sendotp() {

  }

  Widget otp_enter(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text("please enter the OTP send to 9976547899",style: TextStyle(
                fontSize: 13,
                fontFamily: 'lato',
                color: Colors.grey,
              ),),
              Icon(Icons.edit),
            ],
          ),

          SizedBox(
            height: 5,
          ),
          TextFormField(
            // controller: emailController,
            decoration: InputDecoration(
              hintText: "OTP",
              // labelText: "OTP",
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize:20,
                fontFamily: 'lato',
                color: Colors.grey,
              ),
              //prefixIcon: new Icon(Icons.email),
            ),
            validator: (text){
              return null;
            },
          ),

          SizedBox(
            height: 5,
          ),

          Align(
            alignment: Alignment.centerLeft,
            child: Text("resend OTP in 00:60",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'lato',
                color: Colors.grey,
              ),),
          ),

        ],
      ),
    );
  }
}