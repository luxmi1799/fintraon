import 'dart:convert';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class news_details extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return _details();
  }
}

class _details extends State<news_details> {

  var blodid;
  var blogdetail;

  void initState() {
    super.initState();
    // loading(context);
    Future.delayed(Duration(seconds: 2), () {
    });
    get_blogdetails(context);
    // isNumeric("8076799976");
  }

  get_blogdetails(BuildContext context) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      blodid = prefs.getString("BlogId");
      blog_details(blodid);
    });
    print("blodid $blodid");
  }

  @override
  Widget build(BuildContext context) {
   return SingleChildScrollView(
     child: blogdetail!=null?Column(
       children: [
         Padding(
           padding: const EdgeInsets.all(10.0),
           child: Stack(
             children: [
               Container(
                 height: 200,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10),
                   image: DecorationImage(
                     image: NetworkImage(blogdetail["Image"]),
                     fit: BoxFit.cover,
                   ),
                 ),
               ),
             ],
           ),
         ),

         // Align(
         //   alignment: Alignment.centerRight,
         //   child: Container(
         //     width: 90,
         //     height: 20,
         //     decoration: BoxDecoration(
         //       borderRadius: BorderRadius.circular(15),
         //       color: Colors.white,
         //     ),
         //     child: Align(
         //       alignment: Alignment.center,
         //       child: Text("Cryptocurrency",
         //         style: TextStyle(
         //             color: Colors.black,
         //             fontSize: 10
         //         ),),
         //     ),
         //   ),
         // ),

         Padding(
           padding: const EdgeInsets.all(10.0),
           child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [

                   Image.asset("assets/calender.png"),
                   SizedBox(
                     width: 5,
                   ),
                   Text("${blogdetail["BlogDate"]}",
                     style: TextStyle(
                       color: Colors.white70,
                       fontFamily: 'lato',
                     ),
               ),

               // Container(
               //   width: 170,
               //   height: 50,
               //   decoration: BoxDecoration(
               //     color: Colors.white.withOpacity(0.3),
               //   ),
               //   child: Center(
               //     //alignment: Alignment.center,
               //     child:Text.rich(
               //       TextSpan(
               //         children: [
               //           TextSpan(text: " What is the future of ",
               //               style: TextStyle(
               //                 color: Colors.white,
               //                 fontSize: 16,
               //               )
               //           ),
               //           TextSpan(text: "cryptocurrencies? ",
               //               style: TextStyle(
               //                 color: Colors.white,
               //                 fontWeight: FontWeight.bold,
               //                 fontSize: 16,
               //               )
               //           ),
               //         ],
               //       ),
               //     ),
               //   ),
               // ),

             ],
           ),
         ),

               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Text(
                   "${blogdetail["Heading"]}",
                   textAlign: TextAlign.center,
                   style: TextStyle(
                     fontSize: 21,
                     color: Color(0xffEC1C24),
                     fontWeight: FontWeight.bold,
                     fontFamily: 'lato',
                   ),
                 ),
               ),
         Padding(
           padding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 10),
           child: SizedBox(
             width: MediaQuery.of(context).size.width,
             child:  Html(data:"${blogdetail["Description"]}",
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
         ),
       ],
     ):Center(child: CircularProgressIndicator(color: Colors.red,),),
   );
  }



  Future<void> blog_details(String blogId) async {
    String postUrl = "https://fintracon.in/mobile-authenticate/blog-detail.php";
    print("stringrequest");
    var request = new http.MultipartRequest(
        "POST", Uri.parse(postUrl));
    request.fields['blogId'] = blogId;
    request.send().then((response) {
      http.Response.fromStream(response).then((onValue) {
        if(response.statusCode ==200) {
          try {
           Map resposemap   = json.decode(onValue.body);
           setState(() {
             blogdetail = resposemap["commandResult"]["data"]["BlogDetail"];
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
}