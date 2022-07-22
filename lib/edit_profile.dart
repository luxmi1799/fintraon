import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';


class edit_profile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _edit_profile();
  }
}

class _edit_profile extends State<edit_profile> {
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
                          color: Colors.white
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
                  padding: const EdgeInsets.only(left: 20,bottom: 20,right: 20,top: 50),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffEC1C24),
                      ),
                      child: FlatButton(
                        onPressed: (){

                        },
                        child: Text("Submit",
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
}