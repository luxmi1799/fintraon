import 'dart:math';
import 'package:frig/privacy_policy.dart';
import 'package:frig/service%20_page.dart';
import 'package:frig/support.dart';
import 'package:frig/support_page.dart';
import 'package:frig/terms_condition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:frig/login.dart';
import 'package:frig/provider_list/profile_provider.dart';
import 'package:provider/provider.dart';
import 'about_us.dart';
import 'arc.dart';
import 'edit_profile.dart';
import 'package:share_plus/share_plus.dart';

class profile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _profile();
  }
}

class _profile extends State<profile> {

  var user_id;


  void initState() {
    super.initState();
    // loading(context);
    Future.delayed(const Duration(seconds: 2), () {});
    get_blogdetails(context);
    // isNumeric("8076799976");
  }

  get_blogdetails(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      user_id = prefs.getString("user_id");
      context.read<profile_provider>().profile_detail(user_id);
    });
    print("blodid $user_id");
  }

  bool edit = false;

  @override
  Widget build(BuildContext context) {
    context.read<profile_provider>().profile_detail(user_id);
    return Stack(
        children:
        [
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
              automaticallyImplyLeading: false,
              centerTitle: true,
              backgroundColor: const Color(0xffEC1C24),
              elevation: 0,
              title: const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: "My Profile",
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
              //  physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              child: RefreshIndicator(
                onRefresh: () async {
                  context.read<profile_provider>().profile_detail(user_id);
                },
                child: Consumer<profile_provider>(
                  builder: (context,value,child){
                    return  value.map.length ==0 && !value.error
                        ? const CircularProgressIndicator(color: Colors.red,)
                        : value.error ? const Text("Opps SOmething went wrong"):Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height * .15,
                              decoration: const BoxDecoration(
                                // gradient: LinearGradient(
                                //     colors: [
                                //       // const Color(0xFF000000),
                                //       // const Color(0xFFE11F24),
                                //       const Color(0xFFEC1C24),
                                //     ],
                                //     begin: Alignment.topCenter,
                                //     end: Alignment.bottomCenter,
                                //     // begin: const FractionalOffset(0.0, 0.0),
                                //     // end: const FractionalOffset(1.0, 0.0),
                                //     // stops: [0.0, 1.0],
                                //     tileMode: TileMode.mirror
                                // ),
                                color: Color(0xffEC1C24),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(100),
                                  bottomRight: Radius.circular(100),
                                ),
                              ),
                              alignment: Alignment.topCenter,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: MediaQuery
                                  .of(context)
                                  .size
                                  .height * .05),
                              child: Column(
                                //mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10,
                                        bottom: 10,
                                        left: 0),
                                    child: Center(
                                      child: Stack(
                                          alignment: Alignment.center,
                                          children: [

                                            //  Image.asset("assets/image/profilebg.png"),
                                            Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(),
                                                color: Colors.transparent,
                                              ),
                                              width: 90,
                                              height: 90,
                                              child: ArcText(
                                                radius: 80,
                                                text: '                 Joined ${value.map["commandResult"]["data"]["Date"]}',
                                                textStyle: const TextStyle(fontSize: 18,
                                                    color: Colors.white),
                                                startAngle: -pi / 2,
                                              ),
                                            ),
                                            InkWell(
                                              child: CircleAvatar(
                                                  backgroundColor: const Color(0xffffffff),
                                                  radius: 70.0,
                                                  child: CircleAvatar(
                                                    backgroundColor: const Color(
                                                        0xff000000),
                                                    radius: 68.0,
                                                    child: CircleAvatar(
                                                        backgroundImage: value.map["commandResult"]["data"]["Image"]!=null?Image
                                                            .network(
                                                          '${value.map["commandResult"]["data"]["Image"]}',
                                                          fit: BoxFit.cover,)
                                                            .image:Image.asset('assets/demop.png',color: const Color(0xffECAE0F),fit: BoxFit.cover,).image, radius: 49),
                                                  )
                                              ),
                                            ),

                                            Positioned(
                                              bottom: 1,
                                              right: 1,
                                              child: Container(
                                                // width: 45,
                                                // height: 50,
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius: BorderRadius
                                                        .circular(100),
                                                    border: Border.all(
                                                        color: Colors.white,
                                                        width: 0.5)
                                                  //more than 50% of width makes circle
                                                ),
                                                child: IconButton(
                                                  onPressed: () {
                                                    Navigator.push(context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                edit_profile()));
                                                  },
                                                  icon: const Icon(
                                                    Icons.edit,
                                                    color: Colors.white,
                                                    size: 25,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text("${value.map["commandResult"]["data"]["Name"]}",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: 'lato',
                                        fontWeight: FontWeight.bold
                                    ),),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Text("${value.map["commandResult"]["data"]["Mobile"]}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'lato',
                                    ),)
                                ],
                              ),
                            ),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 70,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white.withOpacity(0.2),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Image.asset("assets/wallet1.png", width: 30,
                                      height: 20,
                                      fit: BoxFit.cover,),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Center(
                                      child: Text("Wallet", style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold
                                      ),),
                                    )
                                  ],
                                ),
                              ),

                              Container(
                                width: 70,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white.withOpacity(0.2),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Image.asset("assets/rupeebg.png", width: 30,
                                      height: 20,
                                      fit: BoxFit.cover,),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Center(
                                      child: Text("Coins", style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold
                                      ),),
                                    )
                                  ],
                                ),
                              ),

                              Container(
                                width: 70,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white.withOpacity(0.2),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Image.asset("assets/add1.png", width: 35,
                                      height: 30,
                                      fit: BoxFit.cover,),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Center(
                                      child: Text("Add money", style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold
                                      ),),
                                    )
                                  ],
                                ),
                              ),

                              Container(
                                width: 70,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white.withOpacity(0.2),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    Image.asset("assets/picon.png", width: 40,
                                      height: 40,
                                      fit: BoxFit.cover,),

                                    const Text("Profile", style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold
                                    ),),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),

                        Offstage(
                          offstage: true,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 10, top: 10),
                            child: Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              child: ListView.builder(
                                itemCount: 5,
                                scrollDirection: Axis.vertical,
                                physics: const ScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, position) {
                                  return Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          color: const Color(0xffffffff).withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            const Text("₹ 500", style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'lato',
                                              fontSize: 18,
                                            ),),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  "assets/check.gif", width: 70,
                                                  height: 70,
                                                  fit: BoxFit.cover,),
                                                const Text("Debit", style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'lato',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),),
                                              ],
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
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14.0),
                          child: Card(
                            color: const Color(0xff1c5180).withOpacity(0.1),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            margin: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 0),
                            child: Container(
                              //height: MediaQuery.of(context).size.height,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[

                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15.0, horizontal: 15),
                                    child: InkWell(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => support_s()));
                                        //Navigator.push(context, MaterialPageRoute(builder: (context) => support_page()));
                                      },
                                      child: Row(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment
                                                .center,
                                            children: const [
                                              Icon(Icons.support, color: Colors.white,
                                                size: 25,),
                                              SizedBox(width: 4,),
                                              Text("Support", style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontFamily: 'lato',
                                                fontWeight: FontWeight.bold,
                                              ),)
                                            ],
                                          ),
                                          const Spacer(),

                                          const Icon(Icons.arrow_forward_ios_rounded,
                                            color: Colors.white, size: 20,)
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0, vertical: 0),
                                    child: Container(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width,
                                      height: 2,
                                      color: const Color(0xff524f4f),
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15.0, horizontal: 15),
                                    child: InkWell(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => service_page()));
                                      },
                                      child: Row(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment
                                                .center,
                                            children:  const [
                                              Icon(Icons.miscellaneous_services,
                                                color: Colors.white, size: 25,),
                                              SizedBox(width: 4,),
                                              Text("Services", style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'lato',
                                              ),)
                                            ],
                                          ),
                                          const Spacer(),

                                          const Icon(Icons.arrow_forward_ios_rounded,
                                            color: Colors.white, size: 20,)
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0, vertical: 0),
                                    child: Container(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width,
                                      height: 2,
                                      color: const Color(0xff524f4f),
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15.0, horizontal: 15),
                                    child: Row(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment
                                              .center,
                                          children: const [
                                            Icon(Icons.settings, color: Colors.white,
                                              size: 25,),
                                            SizedBox(width: 4,),
                                            Text("Setting", style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'lato',
                                            ),)
                                          ],
                                        ),
                                        const Spacer(),

                                        const Icon(Icons.arrow_forward_ios_rounded,
                                          color: Colors.white, size: 20,)
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0, vertical: 0),
                                    child: Container(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width,
                                      height: 2,
                                      color: const Color(0xff524f4f),
                                    ),
                                  ),

                                  /* Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15.0, horizontal: 15),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(
                                            builder: (context) => login()));
                                      },
                                      child: Row(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .start,
                                            crossAxisAlignment: CrossAxisAlignment
                                                .center,
                                            children: [
                                              Icon(Icons.notifications,
                                                color: Colors.white, size: 25,),
                                              SizedBox(width: 4,),
                                              Text("Notification Setting",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'lato',
                                                ),)
                                            ],
                                          ),

                                          Spacer(),

                                          Icon(Icons.arrow_forward_ios_rounded,
                                            color: Colors.white, size: 20,)
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0, vertical: 0),
                                    child: Container(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width,
                                      height: 2,
                                      color: Color(0xff524f4f),
                                    ),
                                  ), */

                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15.0, horizontal: 15),
                                    child: InkWell(
                                      onTap: () async {
                                        final app_link = "https://play.google.com/store/apps/details?id=com.fintracon.fintracon";

                                        await Share.share("Share others to choose BEST \n \n $app_link");
                                      },
                                      // onTap: () {
                                      //   Navigator.push(context, MaterialPageRoute(
                                      //       builder: (context) => login()));
                                      // },
                                      child: Row(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .start,
                                            crossAxisAlignment: CrossAxisAlignment
                                                .center,
                                            children: const [
                                              Icon(Icons.share, color: Colors.white,
                                                size: 25,),
                                              SizedBox(width: 4,),
                                              Text("Share App", style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'lato',
                                              ),)
                                            ],
                                          ),

                                          const Spacer(),

                                          const Icon(Icons.arrow_forward_ios_rounded,
                                            color: Colors.white, size: 20,)
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0, vertical: 0),
                                    child: Container(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width,
                                      height: 2,
                                      color: const Color(0xff524f4f),
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15.0, horizontal: 15),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=> privacy_page()));
                                      },
                                      child: Row(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .start,
                                            crossAxisAlignment: CrossAxisAlignment
                                                .center,
                                            children: const [
                                              Icon(Icons.lock, color: Colors.white,
                                                size: 25,),
                                              SizedBox(width: 4,),
                                              Text("Privacy Policy", style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'lato',
                                              ),)
                                            ],
                                          ),

                                          const Spacer(),

                                          const Icon(Icons.arrow_forward_ios_rounded,
                                            color: Colors.white, size: 20,)
                                        ],
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0, vertical: 0),
                                    child: Container(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width,
                                      height: 2,
                                      color: const Color(0xff524f4f),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15.0, horizontal: 15),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => terms_detail_page()));
                                      },
                                      child: Row(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .start,
                                            crossAxisAlignment: CrossAxisAlignment
                                                .center,
                                            children: const [
                                              Icon(
                                                Icons.menu_book, color: Colors.white,
                                                size: 25,),
                                              SizedBox(width: 4,),
                                              Text("Terms of use", style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'lato',
                                              ),)
                                            ],
                                          ),

                                          const Spacer(),

                                          const Icon(Icons.arrow_forward_ios_rounded,
                                            color: Colors.white, size: 20,)
                                        ],
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0, vertical: 0),
                                    child: Container(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width,
                                      height: 2,
                                      color: const Color(0xff524f4f),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15.0, horizontal: 15),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => about_us_page()));
                                      },
                                      child: Row(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .start,
                                            crossAxisAlignment: CrossAxisAlignment
                                                .center,
                                            children: const [
                                              Icon(
                                                Icons.info, color: Colors.white,
                                                size: 25,),
                                              SizedBox(width: 4,),
                                              Text("About Us", style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'lato',
                                              ),)
                                            ],
                                          ),

                                          const Spacer(),

                                          const Icon(Icons.arrow_forward_ios_rounded,
                                            color: Colors.white, size: 20,)
                                        ],
                                      ),
                                    ),
                                  ),


                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0, vertical: 0),
                                    child: Container(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width,
                                      height: 2,
                                      color: const Color(0xff524f4f),
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15.0, horizontal: 15),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(
                                            builder: (context) => login()));
                                      },
                                      child: Row(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .start,
                                            crossAxisAlignment: CrossAxisAlignment
                                                .center,
                                            children: const [
                                              Icon(Icons.login, color: Colors.white,
                                                size: 25,),
                                              SizedBox(width: 4,),
                                              Text("Log Out", style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'lato',
                                              ),)
                                            ],
                                          ),

                                          const Spacer(),

                                          const Icon(Icons.arrow_forward_ios_rounded,
                                            color: Colors.white, size: 20,)
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0, vertical: 0),
                                    child: Container(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width,
                                      height: 2,
                                      color: const Color(0xff524f4f),
                                    ),
                                  ),


                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ]
    );
  }
}

//Color(0xffb6d2cb)
//
// Color(0xffF5F5F5)