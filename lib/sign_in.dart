import 'package:flutter/material.dart';
import 'package:frig/home_page.dart';

import 'create_account.dart';

class sign_in extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _create_account();
  }
}

class _create_account extends State<sign_in> {
  bool _passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
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
          automaticallyImplyLeading: false,
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
                padding: const EdgeInsets.only(top: 50.0),
                child: Center(
                  child: SizedBox(
                    width: 300,
                    child: Image.asset("assets/logoname.png",
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 70.0,left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Let’s Sign You In",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3.0,horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Welcome back, you’ve been missed!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

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
                      labelText: "Email",
                      labelStyle: TextStyle(
                          fontSize:15,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

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
                      hintText: 'enter Password',
                      hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 14
                      ),
                      labelText: "Password",
                      labelStyle: TextStyle(
                          fontSize:15,
                          color: Colors.white),
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.white,
                          // color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 4),
                child: Center(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Forgot Your Password",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),),
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.only(left: 20,bottom: 20,right: 20,top: 100),
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
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => home_page()));
                      },
                      child: Text("LOG IN",
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

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0.0),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => create_account()));
                  },
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: "Don't have an account",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              )
                          ),
                          TextSpan(
                            text: ' SignUp',
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
     ]
    );
  }
}