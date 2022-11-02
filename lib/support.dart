import 'dart:convert';
import 'dart:ui';
import 'package:frig/home_page.dart';
import 'package:frig/loading_bar.dart';
import 'package:frig/provider_list/profile_provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'custom_dialog.dart';

class support_s extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _support();
  }
}

class _support extends State<support_s> {
  bool values = false;

  var name;
  var email;
  var mobile;
  TextEditingController _msgController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  var user_id;


  void initState() {
    super.initState();
    // loading(context);
    Future.delayed(Duration(seconds: 2), () {});
    get_blogdetails(context);
    // isNumeric("8076799976");
  }

  get_blogdetails(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      user_id = prefs.getString("user_id");
      context.read<profile_provider>().profile_detail(user_id);
    });
  }

  @override
  Widget build(BuildContext context) {
    context.read<profile_provider>().profile_detail(user_id);
    // TODO: implement build
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
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.0), // here the desired height
            child: AppBar(
              centerTitle: true,
              title: Text("Support",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              // ...
            ),
          ),
          body: SingleChildScrollView(
            child:Consumer<profile_provider>(
            builder: (context,value,child) {
            _phoneController.text =  value.map["commandResult"]["data"]["Mobile"];
            name = value.map["commandResult"]["data"]["Name"];
            email = value.map["commandResult"]["data"]["Email"];
            print("_phoneController ${_phoneController.text}");
            return value.map.length == 0 && !value.error
            ? const CircularProgressIndicator(color: Colors.red,)
                : value.error
            ? const Text("Opps SOmething went wrong"):
            Column(
              children: [
                Container(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Padding(
                        padding: EdgeInsets.only(top: 20.0,left: 12,bottom: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Name",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white, width: 1.0),
                            ),
                            border: const OutlineInputBorder(),
                            hintText: 'Enter name',
                            hintStyle: TextStyle(
                                fontSize: 14
                            ),
                            labelText:value.map["commandResult"]["data"]["Name"]??"",
                            labelStyle: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize:18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),


                      Padding(
                        padding: EdgeInsets.only(top: 20.0,left: 12,bottom: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Email",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white, width: 1.0),
                            ),
                            border: const OutlineInputBorder(),
                            hintText: 'Enter email',
                            hintStyle: TextStyle(
                                fontSize: 14
                            ),
                            labelText: value.map["commandResult"]["data"]["Email"]??"",
                            labelStyle: TextStyle(
                              //fontWeight: FontWeight.bold,
                              fontSize:18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 20.0,left: 12,bottom: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Phone Number",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                        child: TextField(
                          controller:_phoneController,
                          style: TextStyle(
                            fontSize:18,
                            color: Colors.white,
                          ),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white, width: 1.0),
                            ),
                            border: const OutlineInputBorder(),
                            hintText: 'Enter phone no.',
                            hintStyle: TextStyle(
                                fontSize: 14
                            ),
                            //labelText:  value.map["commandResult"]["data"]["Mobile"]??"",
                            labelStyle: TextStyle(
                              //fontWeight: FontWeight.bold,
                              fontSize:18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 20.0,left: 12,bottom: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Your message",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                        child: TextField(
                          controller: _msgController,
                          style: TextStyle(
                            fontSize:16,
                            color: Colors.white,
                          ),
                          keyboardType: TextInputType.multiline,
                          maxLines: 6,

                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white, width: 1.0),
                            ),
                            border: const OutlineInputBorder(),
                            hintText: 'Enter message',
                            hintStyle: TextStyle(
                                fontSize: 14
                            ),
                            //labelText: "Phone number",
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 10),
                      //   child: Row(
                      //     children: <Widget>[
                      //       Checkbox(
                      //         value: this.values,
                      //         onChanged: (value) {
                      //           setState(() {
                      //             this.values = value!;
                      //           });
                      //         },
                      //       ),//SizedBox
                      //       Text(
                      //         'Remember me',
                      //         style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold),
                      //       ), //Text
                      //       //Checkbox
                      //     ], //<Widget>[]
                      //   ),
                      // ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 60),
                        child: Center(
                          child: InkWell(
                            onTap: (){
                              circle(context);
                              support(name, email, _phoneController.text, _msgController.text);
                              // showDialog(context: context,
                              //     builder: (BuildContext context){
                              //       return CustomDialogBox(
                              //         title: "Thank You!!",
                              //         descriptions: "Tutoro team will contact you soon!!",
                              //         text: "Done",
                              //         img: Image.asset("assets/image/img.png"),
                              //       );
                              //     }
                              // );
                            },
                            child: AnimatedContainer(
                              duration: Duration(seconds: 1),//empty container can use inside of widget
                              height: 50,
                              alignment: Alignment.center,
                              //changebtn?Icon(Icons.done,color: Colors.white,):
                              child:Text("Submit",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white,
                              ),
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xffEC1C24),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
            }
            )
          ),
        )
      ],
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0), // here the desired height
        child: AppBar(
          centerTitle: true,
          title: Text("Support",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          // ...
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            name==""?Container(color: Colors.white,): Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Padding(
                    padding: EdgeInsets.only(top: 20.0,left: 12,bottom: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Name",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'Enter name',
                        hintStyle: TextStyle(
                            fontSize: 14
                        ),
                        labelText: "$name",
                        labelStyle: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize:18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),


                  Padding(
                    padding: EdgeInsets.only(top: 20.0,left: 12,bottom: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Email",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'Enter email',
                        hintStyle: TextStyle(
                            fontSize: 14
                        ),
                        labelText: "$email",
                        labelStyle: TextStyle(
                          //fontWeight: FontWeight.bold,
                          fontSize:18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 20.0,left: 12,bottom: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Phone Number",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'Enter phone no.',
                        hintStyle: TextStyle(
                            fontSize: 14
                        ),
                        labelText: "$mobile",
                        labelStyle: TextStyle(
                          //fontWeight: FontWeight.bold,
                          fontSize:18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 20.0,left: 12,bottom: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Your message",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                    child: TextField(
                      controller: _msgController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 6,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'Enter message',
                        hintStyle: TextStyle(
                            fontSize: 14
                        ),
                        //labelText: "Phone number",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize:20,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 10),
                  //   child: Row(
                  //     children: <Widget>[
                  //       Checkbox(
                  //         value: this.values,
                  //         onChanged: (value) {
                  //           setState(() {
                  //             this.values = value!;
                  //           });
                  //         },
                  //       ),//SizedBox
                  //       Text(
                  //         'Remember me',
                  //         style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold),
                  //       ), //Text
                  //       //Checkbox
                  //     ], //<Widget>[]
                  //   ),
                  // ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 60),
                    child: Center(
                      child: InkWell(
                        onTap: (){
                          support(name, email, mobile, _msgController.text);
                          showDialog(context: context,
                              builder: (BuildContext context){
                                return CustomDialogBox(
                                  title: "Thank You!!",
                                  descriptions: "Tutoro team will contact you soon!!",
                                  text: "Done",
                                  img: Image.asset("assets/image/img.png"),
                                );
                              }
                          );
                        },
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),//empty container can use inside of widget
                          height: 50,
                          alignment: Alignment.center,
                          //changebtn?Icon(Icons.done,color: Colors.white,):
                          child:Text("Submit",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white,
                          ),
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xffEC1C24),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  void support(String name,String email,String mobile ,String message) async {
    String postUrl = "https://fintracon.in/mobile-authenticate/support.php";
    print("stringrequest");
    var request = new http.MultipartRequest(
        "POST", Uri.parse(postUrl));
    request.fields['Name'] = name;
    request.fields['Email'] = email;
    request.fields['Mobile'] = mobile;
    request.fields['Message'] = message;
    request.send().then((response) {
      Navigator.pop(context);
      http.Response.fromStream(response).then((onValue) {
        try {
          print("onValue${onValue.body}");
          Map mapRes = json.decode(onValue.body);
          var success= mapRes["commandResult"]["success"].toString();
          print("succccs $success");
          if(success == "1"){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>home_page()));
          }
          setState(() {
          });
        } catch (e) {
          print("response$e");
        }
      });
    });
  }
}
