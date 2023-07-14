import 'dart:convert';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ecommerece/setpassword.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;


class sign extends StatefulWidget {
  const sign({Key? key}) : super(key: key);
  static TextEditingController email = TextEditingController();
  static TextEditingController number = TextEditingController();
  @override
  State<sign> createState() => _signState();
}

class _signState extends State<sign> {

  String emaill = "";
  String phone = "";

  int i = 1;


  bool satusemail = false;
  bool satusphone = false;

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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle().copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent));

    return  SafeArea(
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
                child:
                AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText('Signup Account',
                        textStyle: const TextStyle(
                            color: Color(0xFF2B4865),
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                           )),
                    TyperAnimatedText('Hp Shoping',
                        textStyle: const TextStyle(
                          color: Color(0xFF2B4865),
                            fontSize: 30, fontWeight: FontWeight.bold)),
                  ],
                  onTap: () {
                    print("I am executing");
                  },
                ),


              ),
              Container(

                height: height * 0.3082,
                child: Lottie.asset("anima/8BgilWasD4.json"),
              ),


              Container(
                height: 63,

                width: double.infinity,
                margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                //margin: EdgeInsets.only(left: 20,right: 20),
                child:
                TextField(
                  style: TextStyle(
                      fontSize: 20, color: Colors.black),
                  decoration: InputDecoration(
                    errorText: satusemail ? emaill : null,
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      prefixIcon: Icon(Icons.email,
                          size: 30, color: Color(0xFF2B4865)),
                      suffix: Icon(Icons.arrow_forward),
                      border:OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      hintText: " Enter Email",
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
                  controller: sign.email,
                  onTap: () {
                    setState(() {
                      satusemail=false;
                    });

                  },
                ),
              ),
              Container(
                height: 64,

                width: double.infinity,
                margin: EdgeInsets.fromLTRB(30, 20, 30, 10),
                //margin: EdgeInsets.only(left: 20,right: 20),
                child: Focus(

                  child: TextField(
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade300,
                        errorText: satusphone ? phone: null,
                        prefixIcon: Icon(Icons.phone,
                            size: 30, color: Color(0xFF2B4865)),
                        suffix: Icon(Icons.arrow_forward),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                        hintText: " Enter phone number",
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
                    keyboardType: TextInputType.number,
                    //autofocus: true,
                    controller:sign.number,
                    onTap: () {
                      setState(() {
                        satusphone=false;
                      });

                    },
                  ),
                ),
              ),

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
                         satusemail=false;
                         satusphone=false;

                         RegExp emailreg = RegExp(
                             r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                         RegExp phonereg = RegExp(
                             r"^(?:[+0]9)?[0-9]{10}$");


                         if (sign.email.text.isEmpty) {
                           satusemail = true;
                           emaill = "please enter the email";
                         } else if (!emailreg.hasMatch(sign.email.text)) {
                           satusemail = true;
                           emaill = "please enter the valid email";
                         }
                         if (sign.number.text.isEmpty) {
                           satusphone = true;
                           phone = "please enter the phone number ";
                         } else if (!phonereg.hasMatch(sign.number.text)) {
                           satusphone = true;
                           phone = "please enter the valid phone number";
                         }
                       });


              Map map={
                         "email":sign.email.text,
                         "number":sign.number.text,
                       };
                       var url = Uri.parse('https://himanshi85.000webhostapp.com/ecommerce/emailcheck.php');
                       var response = await http.post(url, body: map);
                       print('Response status: ${response.statusCode}');
                       print('Response body: ${response.body}');
                       Map<String, dynamic> mmm = jsonDecode(response.body);
                       getdata gg=getdata.fromJson(mmm);
                       if(gg.connection==1){
                         if(gg.result==4) {
                           if (satusemail == false && satusphone == false) {
                             Navigator.pushReplacement(
                                 context, MaterialPageRoute(builder: (context) {
                               return pass();
                             },));
                           }
                         }
                         else{
                           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("This data is already used")));
                         }

                       }


                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    )),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
class getdata {
  int? connection;
  int? result;

  getdata({this.connection, this.result});

  getdata.fromJson(Map<String, dynamic> json) {
    connection = json['connection'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['connection'] = this.connection;
    data['result'] = this.result;
    return data;
  }
}

