import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';


const double _shadowHeight = 4;
double _position = 4;

class edit_profile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _edit_profile();
  }
}

class _edit_profile extends State<edit_profile> {
  final double _height = 55 - _shadowHeight;
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
            title: Text("Edit Profile",
                style: TextStyle(
                color: Colors.white,
                  fontFamily: 'lato',
                fontWeight: FontWeight.bold,
                fontSize: 22,
                ),),
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
                  padding: const EdgeInsets.all(15.0),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/home_pro.png',
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
                  child: IntlPhoneField(
                    initialCountryCode: 'IN',
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(
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
                        hintText: 'enter email',
                        hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 14
                        ),
                        labelText: "Email Id",
                        labelStyle: TextStyle(
                            fontSize:15,
                            fontFamily: 'lato',
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),

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
                        hintText: 'enter address',
                        hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 14
                        ),
                        labelText: "Address",
                        labelStyle: TextStyle(
                            fontSize:15,
                            fontFamily: 'lato',
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20,bottom: 20,right: 20,top: 50),
                  child:  GestureDetector(
                    onTapUp: (_) {
                      setState(() {
                        _position = 4;
                      });
                    },
                    onTapDown: (_) {
                      setState(() {
                        _position = 0;
                      });
                    },
                    onTapCancel: () {
                      setState(() {
                        _position = 4;
                      });
                    },
                    child: Container(
                      height: _height + _shadowHeight,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            child: Container(
                              height: _height,
                              width: MediaQuery.of(context).size.width * 0.8,
                              decoration: BoxDecoration(
                                color: Color(0xffEC1C24).withOpacity(0.5),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16),
                                ),
                              ),
                            ),
                          ),
                          AnimatedPositioned(
                            curve: Curves.easeIn,
                            bottom: _position,
                            duration: Duration(milliseconds: 70),
                            child: Container(
                              height: _height,
                              width: MediaQuery.of(context).size.width * 0.8,
                              decoration: BoxDecoration(
                                color: Color(0xffEC1C24),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(4),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  'Submit',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: 'lato',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
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
}