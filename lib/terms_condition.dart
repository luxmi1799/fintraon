import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_html/flutter_html.dart';

class terms_detail_page extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _service_detail_page();
  }
}

class _service_detail_page extends State<terms_detail_page> {

  var id;
  var details;

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xff12c2e9), Color(0xffc471ed) , Color(0xfff64f59)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));


  @override
  void initState() {
    super.initState();
    service_detail("1");
  }


  Future<void> service_detail(String id) async {
    String postUrl = "https://fintracon.in/mobile-authenticate/page.php";
    print("stringrequest");
    var request = new http.MultipartRequest(
        "POST", Uri.parse(postUrl));
    request.fields['id'] = id;
    request.send().then((response) {
      http.Response.fromStream(response).then((onValue) {
        Map mapRes = json.decode(onValue.body);
        if(response.statusCode ==200) {
          try {
            setState(() {
              details = mapRes["commandResult"]["data"]["Detail"];
            });
          } catch (e) {
            print("response$e");

          }
        }
        else{
        }
      });
    });
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
          appBar:  AppBar(
            backgroundColor: Colors.transparent,
            leading: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios),
            ),
            title:  Row(
              children: [
                Row(
                  // mainAxisSize: MainAxisSize.min,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/logo.png",width: 50,),

                    SizedBox(
                      width: 8,
                    ),


                    Text(
                      "Fintracon",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: 'kompot',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: details!=null?Column(
              children: [

                SizedBox(
                  height: 20,
                ),

                Center(child: Text(details["Heading"],
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()..shader = linearGradient),
                ),
                ),

                SizedBox(
                  height: 40,
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Html(data:"${details["Description"]}",
                    style: {
                      "body": Style(
                        fontSize: FontSize(16.0),
                        textAlign: TextAlign.justify,
                        // fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    },
                  ),
                ),
              ],
            ):Center(child: CircularProgressIndicator(),),
          ),
        ),
      ],
    );
  }
}