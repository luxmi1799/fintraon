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
  @override
  Widget build(BuildContext context) {
     return Scaffold(
         backgroundColor: Colors.black,
         appBar: AppBar(
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
           title:   detail == false?Text.rich(
             TextSpan(
               children: [
                 TextSpan(text: "News",
                     style: TextStyle(
                         color: Colors.white,
                         fontSize: 22,
                         fontWeight: FontWeight.bold
                     )
                 ),
               ],
             ),
           ):Text("News Details",
               style: TextStyle(
                   color: Colors.white,
                   fontSize: 22,
                   fontWeight: FontWeight.bold
               )
           ),
         ),
           body: Padding(
             padding: EdgeInsets.all(8.0),
             child: SingleChildScrollView(
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
         /* Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              children: [
                  Container(
                     height: 200,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       image: DecorationImage(
                         image: AssetImage("assets/new_heading.png"),
                         fit: BoxFit.cover,
                       ),
                     ),
                   ),


                Positioned(
                    left: 200,
                    right: -50,
                    top: 60,
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 80,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black.withOpacity(0.6),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("EDITORIAL",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white70,
                                  fontSize: 10
                              ),),
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Container(
                          width: 160,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.7),
                          ),
                          child: Center(
                            //alignment: Alignment.center,
                            child:Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(text: " What is the future of ",
                                      style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 16,
                                      )
                                  ),
                                  TextSpan(text: "cryptocurrencies? ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      )
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                ),
              ],
            ),
          ),*/

          Padding(
            padding: const EdgeInsets.only(left: 0.0,right: 0,top: 15),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.vertical,
                physics: ScrollPhysics(),
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
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),

                                     Container(
                                       width: MediaQuery.of(context).size.width*0.5,
                                       child: Text(
                                          "If this approach does not work for you when you use Column,wrap the Column in Flexiblee Column in Flexible",
                                          style: TextStyle(
                                            fontSize: 12,
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