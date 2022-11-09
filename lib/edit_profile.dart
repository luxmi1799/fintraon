import 'dart:convert';
import 'dart:io';
import 'package:frig/home_page.dart';
import 'package:frig/loading_bar.dart';
import 'package:frig/provider_list/profile_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

const double _shadowHeight = 4;
double _position = 4;
File? imageFile;

class edit_profile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _edit_profile();
  }
}

class _edit_profile extends State<edit_profile> {
  final double _height = 55 - _shadowHeight;
  var user_id;
  var mobile_number;
  final emailcontroller = new TextEditingController();
  final namecontroller = new TextEditingController();
  final phonecontroller = new TextEditingController();
  final addresscontroller = new TextEditingController();
  TextEditingController _pincode = TextEditingController();


  void initState() {
    super.initState();
    // loading(context);
    Future.delayed(Duration(seconds: 2), () {});
    get_blogdetails(context);
    // isNumeric("8076799976");
  }

  get_blogdetails(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      user_id = prefs.getString("user_id");
      mobile_number = prefs.getString('mobile_number')!;
      context.read<profile_provider>().profile_detail(user_id);
      phonecontroller.text = mobile_number;
    });
    print("blodid $user_id");
  }

  @override
  Widget build(BuildContext context) {
    context.read<profile_provider>().profile_detail(user_id);
    return Stack(
      children:
      [
        Container(
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height,
          color: Colors.black,
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
          backgroundColor: Colors.black.withOpacity(0.7),
          appBar:  AppBar(
            centerTitle: true,
            title: Text("Edit Profile",
                style: TextStyle(
                color: Colors.white,
                  fontFamily: 'lato',
                fontWeight: FontWeight.bold,
                fontSize: 22,
                ),),
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
                onPressed: () {
                 Navigator.pop(context);
                }),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          body: SingleChildScrollView(
            child: Consumer<profile_provider>(
                  builder: (context,value,child) {
                    return value.map.length == 0 && !value.error
                        ? const CircularProgressIndicator(color: Colors.red,)
                        : value.error
                        ? const Text("Opps SOmething went wrong")
                        : Column(
                      children: [

                        Padding(
                          padding: const EdgeInsets.only(top: 30, bottom: 20),
                          child: Center(
                            child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  //  Image.asset("assets/image/profilebg.png"),

                                  InkWell(
                                    onTap: _getFromGallery,
                                    child: CircleAvatar(
                                        backgroundColor: Colors.black,
                                        radius: 60.0,
                                        child: CircleAvatar(
                                            backgroundImage: imageFile != null
                                                ? Image
                                                .file(imageFile!)
                                                .image
                                                :Image.network(value.map["commandResult"]["data"]["Image"],
                                              color: Color(0xffECAE0F),
                                              fit: BoxFit.cover,)
                                                .image, radius: 60)
                                      // child: CircleAvatar(
                                      //   radius: 55.0,
                                      //   backgroundImage: imageFile!=null?AssetImage('assets/image/profile.png'):FileImage(imageFile!),
                                      //   child: ClipOval(
                                      //     child: (imageFile != null)
                                      //         ? Image.file(imageFile!)
                                      //         : Image.asset('assets/image/profile.png'),
                                      //   ),
                                      //   backgroundColor: Colors.white,
                                      // ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: -1,
                                    right: 10,
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: ShapeDecoration(
                                        shape: CircleBorder(),
                                        color: Color(0xffEC1C24),
                                      ),
                                      child: IconButton(
                                        onPressed: () {
                                          _getFromGallery();
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 15),
                          child: IntlPhoneField(
                            controller: phonecontroller,
                            //enabled: false,
                            readOnly: true,
                            style: TextStyle(
                                color: Colors.white
                            ),
                            initialCountryCode: 'IN',
                            dropdownIcon: Icon(Icons.arrow_drop_down,
                              color: Colors.white,),
                            decoration: InputDecoration(
                              hintText: 'Phone Number',
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontFamily: 'lato',
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1.5, color: Colors.grey),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1.5, color: Colors.grey),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1.5, color: Colors.grey),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            //  onSubmitted: sendotp(),
                            onChanged: (phone) {
                              print(phone.completeNumber);
                            },
                            onCountryChanged: (country) {
                              print('Country changed to: ' + country.name);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 0),
                          child: Form(
                            child: TextFormField(
                              controller: namecontroller,
                              style: TextStyle(
                                  color: Colors.white
                              ),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 2.0,
                                  ),
                                ),
                                border: const OutlineInputBorder(),
                                hintText: 'enter name',
                                hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14
                                ),
                                labelText: "Name",
                                labelStyle: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'lato',
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 25),

                          child: Form(
                            child: TextFormField(
                              controller: emailcontroller,
                              style: TextStyle(
                                  color: Colors.white
                              ),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 2.0,
                                  ),
                                ),
                                border: const OutlineInputBorder(),
                                hintText: 'enter email',
                                hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14
                                ),
                                labelText: "Email Id",
                                labelStyle: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'lato',
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 0),
                          child: Form(
                            child: TextFormField(
                              controller: _pincode,
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                  color: Colors.white
                              ),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 2.0,
                                  ),
                                ),
                                border: const OutlineInputBorder(),
                                hintText: 'enter pincode',
                                hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14
                                ),
                                labelText: "Pincode",
                                labelStyle: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'lato',
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 25),
                          child: Form(
                            child: TextFormField(
                              controller: addresscontroller,
                              style: TextStyle(
                                  color: Colors.white
                              ),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 2.0,
                                  ),
                                ),
                                border: const OutlineInputBorder(),
                                hintText: 'enter address',
                                hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14
                                ),
                                labelText: "Address",
                                labelStyle: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'lato',
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, bottom: 20, right: 20, top: 0),
                          child: GestureDetector(
                            onTap: () {
                              circle(context);
                              edit_profile(
                                  namecontroller.text, addresscontroller.text,
                                  emailcontroller.text, _pincode.text, user_id,
                                  imageFile!.path);
                            },
                            onTapUp: (_) {
                              setState(() {
                                _position = 4;
                              });
                            },
                            onTapDown: (_) {
                              setState(() {
                                _position = 0;
                              });
                            },
                            onTapCancel: () {
                              setState(() {
                                _position = 4;
                              });
                            },
                            child: Container(
                              height: _height + _shadowHeight,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.8,
                              child: Stack(
                                children: [
                                  Positioned(
                                    bottom: 0,
                                    child: Container(
                                      height: _height,
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.8,
                                      decoration: BoxDecoration(
                                        color: Color(0xffEC1C24).withOpacity(
                                            0.5),
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
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.8,
                                      decoration: BoxDecoration(
                                        color: Color(0xffEC1C24),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(4),
                                        ),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Submit',
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
                        ),
                      ],
                    );
                  }
          )
          ),
        ),
    ]
    );
  }
  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      // maxWidth: 1800,
      // maxHeight: 1800,
    );
    setState(() {
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
      }
    });
  }

  Future<void> edit_profile(String name,String address,String email,String pincode ,String user_id,String imagepath) async {
    String postUrl = "https://fintracon.in/mobile-authenticate/update-member.php";
    print("stringrequest");
    var request = new http.MultipartRequest(
        "POST", Uri.parse(postUrl));
    request.fields['Name'] = name;
    request.fields['Address'] = address;
    request.fields['Pincode'] = pincode;
    request.fields['UserId'] = user_id;
    request.fields['profile_pic'] = imagepath;
    request.fields['Email'] = email;

    request.send().then((response) {
      http.Response.fromStream(response).then((onValue) {
        try {
          Navigator.pop(context);
          print("onValue${onValue.body}");
          Map mapRes = json.decode(onValue.body);
          var success= mapRes["commandResult"]["success"];
          var msg = mapRes["commandResult"]["message"];
          if(success == 1){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>home_page()));
            Fluttertoast.showToast(
                msg: msg,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1
            );
          }
          else {
            Fluttertoast.showToast(
                msg: msg,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1
            );
          }
        } catch (e) {
          print("response$e");
        }
      });
    });
  }

}