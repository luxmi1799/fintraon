import 'package:flutter/material.dart';
import 'package:frig/create_account.dart';
import 'package:frig/login.dart';
import 'package:fade_out_particle/fade_out_particle.dart';
import 'package:frig/provider_list/blogs_provider.dart';
import 'package:frig/provider_list/profile_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Notificationservice/local_notification_service.dart';
import 'intro.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  LocalNotificationService.initialize();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<blog_provider>(create: (context)=>blog_provider()),
        ChangeNotifierProvider<profile_provider>(create: (context)=>profile_provider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
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
        home: IntroPage(),
      ),
    );
  }
}

class MyAppmain extends StatelessWidget {
  const MyAppmain({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        theme: ThemeData(
          fontFamily: 'lato',
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
  bool _disappear = true;
  double _opacity = 0.9;


  @override
  void initState() {
    super.initState();
    new Future.delayed(
        const Duration(milliseconds: 6000),
            () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => login()),
        ));
  }

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
                        width: 200,
                        height: 200,
                        child: Image.asset("assets/logo.png",
                        ),
                      ),
                    ),
                  ),
                  FadeOutParticle(
                    curve: Curves.easeOutSine,
                    disappear: _disappear,
                    duration: const Duration(milliseconds: 5000),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Fintracon',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 90,
                          )
                        ),
                      ],
                    ),
                    onAnimationEnd: () => print('animation ended'),
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
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffEC1C24),
                  ),
                  child: FlatButton(
                    onPressed: (){
                      setState(() {
                        _disappear = !_disappear;
                      });
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => login()));
                    },
                    child: Text("GET STARTED",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        backgroundColor:  Color(0xffEC1C24),
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
