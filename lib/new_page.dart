import 'package:flutter/material.dart';
import 'package:frig/home_page.dart';
import 'package:frig/home_page_page.dart';
import 'package:frig/loading_bar.dart';
import 'package:frig/news_details.dart';
import 'package:frig/provider_list/profile_provider.dart';
import 'package:provider/provider.dart';
import 'package:hover_effect/hover_effect.dart';
import 'package:frig/provider_list/blogs_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


const double _shadowHeight = 4;
double _position = 4;

class news extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return _news();
  }
}

class _news extends State<news> {
  bool detail = false;
  var PaymentStatus;
  var user_id;
  var _controller = ScrollController();
  ScrollPhysics _physics = ClampingScrollPhysics();
  final double _height = 55 - _shadowHeight;

  @override
  void initState() {
    super.initState();
    get_blogdetails(context);
    context.read<blog_provider>().blog_p_list();
    _controller.addListener(() {
      if (_controller.position.pixels <= 56)
        setState(() => _physics = ClampingScrollPhysics());
      else
        setState(() => _physics = BouncingScrollPhysics());
    });
  }

  get_blogdetails(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      PaymentStatus = prefs.getString("PaymentStatus");
      user_id = prefs.getString("user_id");
      context.read<profile_provider>().profile_detail(user_id);
    });
    print("PaymentStatus $PaymentStatus");
  }

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xff12c2e9), Color(0xffc471ed) , Color(0xfff64f59)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    context.read<blog_provider>().blog_p_list();
    context.read<profile_provider>().profile_detail(user_id);
     return Stack(
       children: [
         Container(
           width: double.maxFinite,
           height: MediaQuery.of(context).size.height,
           color: Colors.black.withOpacity(0.5),
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
               centerTitle: true,
               leading: InkWell(
                   onTap: (){
                     setState(() {
                       detail = false;
                     });
                     //Navigator.of(context).push(MaterialPageRoute(builder: (context) => edit_profile()));
                   },
               child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
               backgroundColor:  Colors.transparent,
               elevation: 0,
               title: detail == false?Text.rich(
                 TextSpan(
                   children: [
                     TextSpan(text: "News",
                         style: TextStyle(
                             color: Colors.white,
                             fontSize: 22,
                             fontWeight: FontWeight.bold,
                             fontFamily: 'lato',
                         )
                     ),
                   ],
                 ),
               ):Text("News Details",
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 22,
                       fontWeight: FontWeight.bold,
                       fontFamily: 'lato',
                   )
               ),
             ),
               body: Padding(
                 padding: EdgeInsets.all(8.0),
                 child: SingleChildScrollView(
                   physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                   child: RefreshIndicator(
                     onRefresh: () async {
                       context.read<profile_provider>().profile_detail(user_id);
                     }, child: Consumer<profile_provider>(
                      builder: (context,value,child) {
                        return value.map.length == 0 && !value.error
                            ? const CircularProgressIndicator(color: Colors.red,)
                            : value.error
                            ? const Text("Opps SOmething went wrong")
                            : value.map["commandResult"]["data"]["PaymentStatus"]=="0"?
                          lock(context)
                        :Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            detail == false?editorial(context):news_details(),
                          ],
                        );
                      }
                    ),
                   ),
                   /*child: PaymentStatus=="0"?Center(child: Container(
                     child: Text("  This page is Locked Please Registration Fees First",style: TextStyle(  fontSize: 30.0,
                         fontWeight: FontWeight.bold,
                         foreground: Paint()..shader = linearGradient),),
                   ),):Column(
                     children: [
                       SizedBox(
                         height: 5,
                       ),
                        detail == false?editorial(context):news_details(),
                     ],
                   ),*/
                 ),
               )
           ),
       ],
     );

  }

 Widget editorial(BuildContext context){
   context.read<blog_provider>().blog_p_list();
    return SingleChildScrollView(
      child: RefreshIndicator(
        onRefresh: () async {
          context.read<blog_provider>().blog_p_list();
        },
        child: Consumer<blog_provider>(
            builder: (context,value,child) {
              return value.map.length ==0 && !value.error
                  ? CircularProgressIndicator(color: Colors.red,)
                  : value.error ? Text("Opps SOmething went wrong"):Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 0.0, right: 0, top: 15),
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: ListView.builder(
                        itemCount: value.map["commandResult"]["data"]["BlogList"].length,
                        scrollDirection: Axis.vertical,
                        controller: _controller,
                        physics: _physics,
                        shrinkWrap: true,
                        itemBuilder: (context, position) {
                          var blogdata = value.map["commandResult"]["data"]["BlogList"];
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  detail = true;
                                });
                              },
                              child: Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                               // height: 100,
                                decoration: BoxDecoration(
                                    color: Color(0xff181818),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: ClipRRect(
                                       borderRadius: BorderRadius.circular(10),
                                       child: Image.network(blogdata[position]["Image"],width: MediaQuery.of(context).size.width*0.32,height: 100,fit: BoxFit.cover,)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .start,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          SizedBox(
                                            height: 1,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .start,
                                            children: [
                                              // Text(
                                              //   "ALT -3.7%",
                                              //   style: TextStyle(
                                              //     fontSize: 10,
                                              //     color: Colors.white70,
                                              //     fontFamily: 'lato',
                                              //   ),
                                              // ),

                                              Text(
                                                "${blogdata[position]["BlogDate"]}",
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white70,
                                                  fontFamily: 'lato',
                                                ),
                                              ),
                                            ],
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 3.0),
                                            child: SizedBox(
                                              width: MediaQuery.of(context).size.width*0.5,
                                              child: Text(
                                                "${blogdata[position]["Heading"]}",
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'lato',
                                                ),
                                              ),
                                            ),
                                          ),

                                          Container(
                                            width: MediaQuery
                                                .of(context)
                                                .size
                                                .width * 0.5,
                                            child: Text(
                                              "${blogdata[position]["ShortDescription"]}",
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontFamily: 'lato',
                                                color: Colors.white,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              //softWrap: true,
                                            ),
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 1.0),
                                            child: InkWell(
                                              onTap: () async {
                                                SharedPreferences prefs = await SharedPreferences.getInstance();
                                                setState(() {
                                                  prefs.setString("BlogId",blogdata[position]["BlogId"]);
                                                 // circle(context);
                                                  Future.delayed(Duration(seconds: 2));
                                                  detail = true;
                                                  //Navigator.pop(context);
                                                });
                                              },
                                              child: Text(
                                                "Read more",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    color: Color(0xffEC1C24),
                                                    fontWeight: FontWeight.bold
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
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            }
        ),
      ),
    );
 }

 Widget lock(BuildContext context){
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 50),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(20.0),
                  height:  MediaQuery.of(context).size.width * 0.9,
                  child: HoverCard(
                    builder: (context, hovering) {
                      return  Container(
                        color: Color(0xFFE9E9E9),
                        child: Column(
                          children: <Widget>[

                            SizedBox(
                              height: 70,
                            ),

                            Text("Lock",style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              fontFamily: "poppins"
                            ),),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 20),
                              child: Text("Please complete your registration , \n to check for news update \n  try again",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: "poppins"
                              ),),
                            ),


                          ],
                        ),
                      );
                    },
                    depth: 12,
                    depthColor: Colors.grey,
                    shadow: BoxShadow(color: Color(0xffEC1C24), blurRadius: 30, spreadRadius: -20, offset: Offset(0, 30)),
                  ),
                ),

                Positioned(
                top: -60,
                left: 80,
                // replace with your image here
                child: Image.asset("assets/lock1.png",width: 150,height: 150,),
              ),

                Positioned(
                  bottom: 20,
                  left: 50,
                  right: 50,
                  child:   Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> home_page()));
                    },
                    child: Container(
                      height: _height + _shadowHeight,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            child: Container(
                              height: _height,
                              width: MediaQuery.of(context).size.width * 0.6,
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
                              width: MediaQuery.of(context).size.width * 0.6,
                              decoration: BoxDecoration(
                                color: Color(0xffEC1C24),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(4),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  'Registration',
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
                ),)

              ],
        ),
    );
 }

}