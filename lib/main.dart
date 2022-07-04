import 'package:flutter/material.dart';
import 'package:frig/create_account.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _opacity = 0.9;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(children: [
                  Container(
                    width: double.maxFinite,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black.withOpacity(0.4),
                  ),
                  Opacity(
                      opacity: _opacity,
                      child: Image.asset(
                          'assets/splash(2).png',
                          width: double.maxFinite,
                          height: MediaQuery.of(context).size.height,
                          fit: BoxFit.contain)),
                ]),
              ],
            )
        ),
        Scaffold(
          //  backgroundColor: Color(0xffCC0000),
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50.0),
                    child: Center(
                      child: SizedBox(
                        width: 300,
                        child: Image.asset("assets/logo.png",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
        ),

        Positioned(
          left: 20,
          right: 20,
          bottom: 20,
            child: Padding(
              padding: const EdgeInsets.only(left: 20,bottom: 20,right: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff1228E9),
                  ),
                  child: FlatButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => create_account()));
                    },
                    child: Text("GET STARTED",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        backgroundColor:  Color(0xff1228E9),
                      ),),
                    // color: Colors.white,
                  ),
                ),
              ),
            ),)
      ],
    );
  }
}
