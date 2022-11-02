import 'dart:convert';
import 'package:frig/service_detail_page.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gradient_borders/gradient_borders.dart';


class  service_page extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _service_page();
  }
}

class _service_page extends State<service_page> {
  var servicedata;
  String? service_title ;
  String? service_desp;



  @override
  void initState() {
    super.initState();
    service_list(context);
  }


  service_list(BuildContext context) async {
    var theory_url = 'https://fintracon.in/mobile-authenticate/service-list.php';
    var response = await http.get(Uri.parse(theory_url));
    Map mapRes = json.decode(response.body);
    print('Response from server: $mapRes');
    var servicelists = mapRes["commandResult"]["data"]["ServiceList"];
    print("bloglists$servicelists");
    setState(() {
      servicedata = servicelists;
    });
  }


    @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration.zero,(){
    //   _modalBottomSheetMenu();
    // });
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
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              elevation: 0,
              leading: InkWell(
                 onTap: (){
                   Navigator.pop(context);
                 },
                child: Icon(Icons.arrow_back_ios, color: Colors.white,),
              ),
              title: const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: "Services",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontFamily: 'lato',
                            fontWeight: FontWeight.bold
                        )
                    ),
                  ],
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  servicedata!=null? Container(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        itemCount: servicedata.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(

                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Card(
                               color: Colors.transparent,
                                child:Container(
                                   width: MediaQuery.of(context).size.width *.6,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: const GradientBoxBorder(
                                        gradient: LinearGradient(colors: [Colors.blue, Colors.red]),
                                        width: 6,
                                      ),
                                      borderRadius: BorderRadius.circular(6)
                                  ),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(servicedata[index]["Heading"],
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                             color:Colors.white,
                                             fontWeight: FontWeight.w600,
                                             fontSize: 20
                                          ),),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(servicedata[index]["ShortDescription"],
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                              color:Colors.white,
                                              fontWeight: FontWeight.w200,
                                              fontSize: 15
                                          ),),
                                        ),

                                        InkWell(
                                          onTap: () async {
                                            SharedPreferences prefs = await SharedPreferences.getInstance();
                                            prefs.setString("service_id", servicedata[index]["Id"]);
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => service_detail_page()));
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Align(
                                              alignment: Alignment.topRight,
                                              child: Text("Click here to view more",
                                                style:  TextStyle(
                                                color: Colors.lightBlueAccent,
                                                fontSize: 12
                                              ),),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                )
                              ),
                            ),
                          );
                        },
                      ),
                    ) :Center(child: CircularProgressIndicator()),
                ],
              ),
            ),
          ),
        ],
      );
  }

 _modalBottomSheetMenu(){
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.6, // half screen on load
          maxChildSize: 1,       // full screen on scroll
          minChildSize: 0.25,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                ),
                border: Border.all(
                  width: 1,
                  color: Color(0xffEC1C24),
                  style: BorderStyle.solid,
                ),
              ),
              child: servicedata!=null?ListView.builder(
                controller: scrollController,
                itemCount: servicedata.length,
                scrollDirection: Axis.horizontal,
                physics: ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child:  Column(
                        children: [
                          Text(""),
                          Divider(),
                          Text("data")
                        ],
                    ),
                  );
                },
              ):Center(child: CircularProgressIndicator()),
            );
          },
        );
      },
    );
  }
}