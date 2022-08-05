import 'package:flutter/material.dart';
import 'package:frig/news_details.dart';

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
    _controller.addListener(() {
      if (_controller.position.pixels <= 56)
        setState(() => _physics = ClampingScrollPhysics());
      else
        setState(() => _physics = BouncingScrollPhysics());
    });
  }
  @override
  Widget build(BuildContext context) {
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
    return SingleChildScrollView(
      child: Column(
        children: [

          Padding(
            padding: const EdgeInsets.only(left: 0.0,right: 0,top: 15),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.vertical,
                controller: _controller,
                physics: _physics,
                shrinkWrap: true,
                itemBuilder: (context, position) {
                  return  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          detail =true;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Color(0xff181818),
                            borderRadius: BorderRadius.circular(5)
                        ),
                         child: Row(
                            children: [
                             Image.asset("assets/news_list.png"),
                             Padding(
                               padding: const EdgeInsets.all(10.0),
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 1,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          "3 Sept 2020",
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white70,
                                            fontFamily: 'lato',
                                          ),
                                        ),
                                      ],
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                                      child: Text(
                                        "ATLANTIA",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'lato',
                                        ),
                                      ),
                                    ),

                                     Container(
                                       width: MediaQuery.of(context).size.width*0.5,
                                       child: Text(
                                          "If this approach does not work for you when you use Column,wrap the Column in Flexiblee Column in Flexible",
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
                                      padding: const EdgeInsets.symmetric(vertical: 1.0),
                                      child: InkWell(
                                        onTap: (){
                                          setState(() {
                                            detail =true;
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
      ),
    );
 }

}