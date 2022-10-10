import 'package:flutter/material.dart';
import 'package:frig/loading_bar.dart';
import 'package:frig/news_details.dart';
import 'package:provider/provider.dart';
import 'package:frig/provider_list/blogs_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class news extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return _news();
  }
}

class _news extends State<news> {
  bool detail = false;

  var _controller = ScrollController();
  ScrollPhysics _physics = ClampingScrollPhysics();

  @override
  void initState() {
    super.initState();
    context.read<blog_provider>().blog_p_list();
    _controller.addListener(() {
      if (_controller.position.pixels <= 56)
        setState(() => _physics = ClampingScrollPhysics());
      else
        setState(() => _physics = BouncingScrollPhysics());
    });
  }
  @override
  Widget build(BuildContext context) {
    context.read<blog_provider>().blog_p_list();
     return Scaffold(
         backgroundColor: Colors.black,
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
               child: Column(
                 children: [
                   SizedBox(
                     height: 5,
                   ),
                    detail == false?editorial(context):news_details(),
                 ],
               ),
             ),
           )
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
                                                .spaceBetween,
                                            children: [
                                              Text(
                                                "ALT -3.7%",
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white70,
                                                  fontFamily: 'lato',
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
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

}