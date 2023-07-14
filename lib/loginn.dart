import 'dart:convert';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ecommerece/home.dart';
import 'package:ecommerece/setpassword.dart';
import 'package:ecommerece/signup.dart';
import 'package:ecommerece/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;




class lll extends StatefulWidget {

  @override
  State<lll> createState() => _lllState();
}

class _lllState extends State<lll> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();

  FocusNode _focusNode = FocusNode();
  final unfocusedBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey),
    borderRadius: BorderRadius.circular(8.0),
  );

  final focusedBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blue),
    borderRadius: BorderRadius.circular(8.0),
  );

  bool satus = true;
 bool semail=false;
 bool spass=false;
 bool snumber=false;

 String emaildata="";
 String passworddata="";
 String numberdata="";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0Xff3d6a8a), // Replace with your desired color
    ));
  }
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    height = height - keyboardHeight;
    print("=========$keyboardHeight");


    return
      SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("image/Untitled design (3).png"),
                  fit: BoxFit.fill)),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, height * 0.073, 0, 0),
                child: AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText('HP Shopping',
                        textStyle: TextStyle(
                            color: Color(0xFF2B4865),
                            fontSize: 35,
                            fontWeight: FontWeight.bold)),
                    WavyAnimatedText('Login Account',
                        textStyle: TextStyle(
                            color: Color(0xFF2B4865),
                            fontSize: 35,
                            fontWeight: FontWeight.bold)),
                  ],
                  repeatForever: true,
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(30),
                height: height * 0.2465,
                child: Lottie.asset("anima/107385-login (1).json"),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            satus = true;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                            bottom: 3 // Space between underline and text
                          ),
                          decoration: satus?BoxDecoration(
                              border: Border(bottom: BorderSide(
                                color: Color(0Xff3d6a8a),
                                width: 2.0, // Underline thickness
                              ))
                          ):BoxDecoration(),
                          margin: EdgeInsets.fromLTRB(100, 0, 0, 0),
                          child: Text("Email",
                              style: TextStyle(
                                  fontSize: 21,
                                  color: Color(0xFF2B4865),
                                  fontWeight: FontWeight.bold,
                                //
                                // decoration:
                                // TextDecoration.underline,
                                // decorationColor: Colors.blue,
                                // decorationThickness: 4,
                               )),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            satus = false;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                            bottom: 3, // Space between underline and text
                          ),
                          decoration: satus?BoxDecoration():BoxDecoration(
                              border: Border(bottom: BorderSide(
                                color: Color(0Xff3d6a8a),
                                width: 2.0, // Underline thickness
                              ))
                          ),
                          margin: EdgeInsets.fromLTRB(40, 0, 0, 0),
                          child: Text("Phone number",
                              style: TextStyle(
                                  fontSize: 21,
                                  color: Color(0xFF2B4865),
                                  fontWeight: FontWeight.bold)),
                        ),
                      )
                    ],
                  ),
                  satus
                      ? Container(
                          height: 63,

                          width: double.infinity,
                          margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                          //margin: EdgeInsets.only(left: 20,right: 20),
                          child: Focus(
                            focusNode: _focusNode,
                            child: TextField(
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black),
                              decoration: InputDecoration(
                                   errorText: semail ? emaildata : null,
                                  filled: true,
                                  fillColor: Colors.grey.shade300,
                                  prefixIcon: Icon(Icons.email_sharp,
                                      size: 30, color: Color(0xFF2B4865)),
                                  suffix: Icon(Icons.arrow_forward),
                                  border: _focusNode.hasFocus
                                      ? focusedBorder
                                      : unfocusedBorder,
                                  hintText: " Enter email",
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                          color: Color(0xFF2B4865))),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: Color(0xFF2B4865))),
                                  hintStyle: TextStyle(
                                      color: Color(0xFF2B4865),
                                      fontSize: 23)),

                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              //autofocus: true,
                              controller: email,
                              onTap: () {
                                setState(() {
                                  semail=false;
                                });

                              },
                            ),
                          ),
                        )
                      : Container(
                          height: 63,

                          width: double.infinity,
                          margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                          //margin: EdgeInsets.only(left: 20,right: 20),
                          child: Focus(
                            focusNode: _focusNode,
                            child: TextField(
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black),
                              decoration: InputDecoration(
                                  errorText: snumber ? numberdata : null,
                                  filled: true,
                                  fillColor: Colors.grey.shade300,
                                  prefixIcon: Icon(Icons.phone,
                                      size: 30, color: Color(0xFF2B4865)),
                                  suffix: Icon(Icons.arrow_forward),
                                  border: _focusNode.hasFocus
                                      ? focusedBorder
                                      : unfocusedBorder,
                                  hintText: " Enter phone number",
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                          color: Color(0xFF2B4865))),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: Color(0xFF2B4865))),
                                  hintStyle: TextStyle(
                                      color: Color(0xFF2B4865),
                                      fontSize: 23)),

                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              //autofocus: true,
                              controller: phone,
                              onTap: () {
                                setState(() {
                                  snumber=false;
                                });

                              },
                            ),
                          ),
                        ),
                  Container(
                    height: 64,

                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(30, 20, 30, 10),
                    //margin: EdgeInsets.only(left: 20,right: 20),
                    child: Focus(
                      focusNode: _focusNode,
                      child: TextField(
                        style: TextStyle(fontSize: 20, color: Colors.black),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade300,
                             errorText: spass ? passworddata : null,
                            prefixIcon: Icon(Icons.lock,
                                size: 30, color: Color(0xFF2B4865)),
                            suffix: Icon(Icons.arrow_forward),
                            border: _focusNode.hasFocus
                                ? focusedBorder
                                : unfocusedBorder,
                            hintText: " Enter password",
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xFF2B4865))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: Color(0xFF2B4865))),
                            hintStyle: TextStyle(
                                color: Color(0xFF2B4865), fontSize: 23)),
                        textInputAction: TextInputAction.next,
                        //autofocus: true,
                        controller: password,
                        onTap: () {
                          setState(() {
                            spass=false;
                          });

                        },
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(190, 0, 0, 0),
                      child: TextButton(
                        onPressed: () {

                        },
                        child: Text("Forget password?",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF2B4865),
                            )),
                      )),
                  Container(
                    margin: EdgeInsets.fromLTRB(8, 20, 10, 0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0Xff3d6a8a),
                            padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                            fixedSize: Size(350, 60),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: () async {
                          setState(() {
                            spass=false;
                            snumber=false;
                            semail=false;

                          if(satus==true){
                            if (email.text.isEmpty) {
                              semail = true;
                              emaildata = "please enter the email";
                            }

                            if (password.text.isEmpty) {
                              spass = true;
                              passworddata = "please enter the password";
                            }
                          }
                          else {
                            if (phone.text.isEmpty) {
                              snumber = true;
                              numberdata = "please enter the phonenumber";
                            }
                            if (password.text.isEmpty) {
                              spass = true;
                              passworddata = "please enter the password";
                            }
                          }


                          });
                          Map map={
                            "email":email.text,
                            "password":password.text,
                            "number":phone.text

                          };



                          var url = Uri.parse('https://himanshi85.000webhostapp.com/ecommerce/login.php');
                          var response = await http.post(url, body: map);
                          print('Response status: ${response.statusCode}');
                          print('Response body: ${response.body}');

                          Map<String, dynamic> mmm=jsonDecode(response.body);
                          logindata hh=logindata.fromJson(mmm);
                          if(hh.connection==1){
                            if(hh.result==1){


                              SplashScreen.pref!.setBool("loginsatus", true);
                              SplashScreen.pref!.setString("profile", "${hh.userdata!.pHOTO}");
                              SplashScreen.pref!.setString("name", "${hh.userdata!.nAME}");
                              SplashScreen.pref!.setString("email", "${hh.userdata!.eMAIL}");
                              SplashScreen.pref!.setString("phone", "${hh.userdata!.nUMBER}");
                              SplashScreen.pref!.setString("password", "${hh.userdata!.pASSWORD}");
                              SplashScreen.pref!.setString("dob", "${hh.userdata!.dOB}");
                              SplashScreen.pref!.setString("address", "${hh.userdata!.aDDRESS}");
                              SplashScreen.pref!.setString("gender", "${hh.userdata!.gENDER}");
                              SplashScreen.pref!.setString("id", "${hh.userdata!.iD}");











                              EasyLoading.showSuccess('login Sucessfully!');


                              // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Successfully",)));
                              Future.delayed(Duration(seconds: 4)).then((value) {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                  return hommm();
                                },));

                              });
                            }else{


                            if(semail==false&& spass==false){
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("user not found")));


                            }

                            }
                          }

                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        )),
                  ),
                  Row(
                    children: [
                      Container(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(80, 0, 0, 0),
                          child: Text("Don't have account?",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF2B4865),
                              )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(2, 0, 0, 0),
                        child: TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                return sign();
                              },));

                            },
                            child: Text("Signup",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF2B4865),
                                    decoration: TextDecoration.underline))),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }


}
class logindata {
  int? connection;
  int? result;
  Userdata? userdata;

  logindata({this.connection, this.result, this.userdata});

  logindata.fromJson(Map<String, dynamic> json) {
    connection = json['connection'];
    result = json['result'];
    userdata = json['userdata'] != null
        ? new Userdata.fromJson(json['userdata'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['connection'] = this.connection;
    data['result'] = this.result;
    if (this.userdata != null) {
      data['userdata'] = this.userdata!.toJson();
    }
    return data;
  }
}

class Userdata {
  String? iD;
  String? eMAIL;
  String? nUMBER;
  String? pASSWORD;
  String? pHOTO;
  String? nAME;
  String? aDDRESS;
  String? dOB;
  String? gENDER;

  Userdata(
      {this.iD,
        this.eMAIL,
        this.nUMBER,
        this.pASSWORD,
        this.pHOTO,
        this.nAME,
        this.aDDRESS,
        this.dOB,
        this.gENDER});

  Userdata.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    eMAIL = json['EMAIL'];
    nUMBER = json['NUMBER'];
    pASSWORD = json['PASSWORD'];
    pHOTO = json['PHOTO'];
    nAME = json['NAME'];
    aDDRESS = json['ADDRESS'];
    dOB = json['DOB'];
    gENDER = json['GENDER'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['EMAIL'] = this.eMAIL;
    data['NUMBER'] = this.nUMBER;
    data['PASSWORD'] = this.pASSWORD;
    data['PHOTO'] = this.pHOTO;
    data['NAME'] = this.nAME;
    data['ADDRESS'] = this.aDDRESS;
    data['DOB'] = this.dOB;
    data['GENDER'] = this.gENDER;
    return data;
  }
}