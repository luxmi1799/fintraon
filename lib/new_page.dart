import 'package:flutter/material.dart';

class news extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return _news();
  }
}

class _news extends State<news> {
  @override
  Widget build(BuildContext context) {
     return DefaultTabController(
       length: 4,
       child: Scaffold(
         backgroundColor: Colors.black,
         appBar: AppBar(
           centerTitle: true,
           leading: InkWell(
               onTap: (){
                 setState(() {
                 });
                 //Navigator.of(context).push(MaterialPageRoute(builder: (context) => edit_profile()));
               },
           child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
           backgroundColor:  Colors.transparent,
           elevation: 0,
           title: Text.rich(
             TextSpan(
               children: [
                 TextSpan(text: "News Listing",
                     style: TextStyle(
                         color: Colors.white,
                         fontSize: 18,
                         fontWeight: FontWeight.bold
                     )
                 ),
               ],
             ),
           ),
         ),
           body: Padding(
             padding: EdgeInsets.all(8.0),
             child: Column(
               children: [
                 SizedBox(
                   height: 7,
                 ),
                 Container(
                   height: 30,
                   decoration: BoxDecoration(
                      // color: Colors.grey[300],
                      // borderRadius: BorderRadius.circular(25.0)
                   ),
                   child:  TabBar(
                     indicator: BoxDecoration(
                         color: Color(0xff2d2d2d),
                         borderRadius:  BorderRadius.circular(16.0),
                         border: Border.all(color: Colors.white)
                     ) ,
                     labelColor: Colors.white,
                     labelStyle: TextStyle(
                       fontSize: 11,
                       fontWeight: FontWeight.bold,
                     ),
                     unselectedLabelColor: Colors.grey[600],
                     tabs: const  [
                       Tab(text: 'EDITORIAL',),
                       Tab(text: 'CRYPTO NEWS',),
                       Tab(text: 'RAW MATERIAL',),
                       Tab(text: 'ECONOMICS',)
                     ],
                   ),
                 ),
                  Expanded(
                     child: TabBarView(
                       children:  [
                         editorial(context),
                         Center(child: Text("Status Pages"),),
                         Center(child: Text('Calls Page'),),
                         Center(child: Text('Settings Page'),)
                       ],
                     )
                 )
               ],
             ),
           )
       ),
     );
  }

 Widget editorial(BuildContext context){
    return SingleChildScrollView(
      child: Column(
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
          ),

          Padding(
            padding: const EdgeInsets.only(left: 0.0,right: 0,top: 15),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.vertical,
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, position) {
                  return  Padding(
                    padding: const EdgeInsets.all(10.0),
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
                           Column(
                             mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                              ],
                            ),
                          ],
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