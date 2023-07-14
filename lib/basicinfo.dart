import 'dart:convert';
import 'dart:io';

import 'package:ecommerece/setpassword.dart';
import 'package:ecommerece/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

import 'home.dart';
import 'loginn.dart';

class basic extends StatefulWidget {
  const basic({Key? key}) : super(key: key);

  @override
  State<basic> createState() => _basicState();
}

class _basicState extends State<basic> {
  String imagepath="";
  TextEditingController name =TextEditingController();
  TextEditingController add =TextEditingController();
  TextEditingController dob =TextEditingController();
  String s = "male";
  bool sname=false;
  bool sadd=false;
  bool sdob=false;

  String namedata="";
  String adddata="";
  String dobdata="";


  DateTime selecteddate = DateTime.now();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0Xff3d6a8a), // Replace with your desired color
    ));
  }
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double keyboardHeight = MediaQuery
        .of(context)
        .viewInsets
        .bottom;
    height = height - keyboardHeight;
    print("=========$keyboardHeight");
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle().copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent));

    return SafeArea(
      child: Stack(
        children: [
          Container(decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("image/Untitled design (3).png"),
                  fit: BoxFit.fill)),),
          Scaffold(
            backgroundColor: Colors.transparent,
            // resizeToAvoidBottomInset: false,

            body: Container(

              child: ListView(
                children: [
              Container(
                margin: EdgeInsets.fromLTRB(80, 60, 90, 20),
                child:
              Text("Basic Information", style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF2B4865),
                fontSize: 30,),),
              ),
                  Center(
                    child: InkWell(
                        onTap: () {
                          final ImagePicker picker = ImagePicker();

                          showDialog(context: context, builder: (context) {
                            return Material(
                              color: Colors.transparent,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(70, 318, 70, 318),
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(20),
                                  color: Colors.white,
                                ),

                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(3),
                                      child: Text("Choose a option", style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold, color: Color(0xFF2B4865) )),
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                      onTap: () async {
                                        Navigator.pop(context);
                                        final XFile? photo = await picker.pickImage(source: ImageSource.camera, imageQuality: 30);

                                        setState(() {
                                          imagepath=photo!.path;
                                        });
                                         },
                                          child: Container(
                                            height: 80,
                                            width: 70,
                                            margin: EdgeInsets.fromLTRB(35, 10, 10, 10),
                                            child: Image.asset("image/c-removebg-preview.png",fit: BoxFit.fill, ),
                                          ),
                                        ),
                                        InkWell(
                                      onTap: () async {
                                        Navigator.pop(context);
                                        final XFile? image = await picker.pickImage(source: ImageSource.gallery, imageQuality: 30);
                                        setState(() {
                                          imagepath=image!.path;
                                        });
                                         },
                                          child:
                                          Container(
                                            height: 80,
                                            width: 70,
                                            margin: EdgeInsets.all(10),
                                            child: Image.asset("image/c1-removebg-preview.png", fit: BoxFit.fill),

                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },);
                        },
                        child: imagepath!=""?CircleAvatar(maxRadius: 77,
                          backgroundImage: FileImage(File(imagepath)),

                        ):CircleAvatar(
                          maxRadius: 70,
                          backgroundImage: AssetImage("image/img.png"),)
                    ),
                  ),
                  Container(
                    height: 63,

                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                    //margin: EdgeInsets.only(left: 20,right: 20),
                    child: TextField(
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      decoration: InputDecoration(
                        errorText: sname ? namedata : null,
                          filled: true,
                          fillColor: Colors.grey.shade300,
                          prefixIcon: Icon(Icons.people_alt_outlined,
                              size: 30, color: Color(0xFF2B4865)),
                          suffix: Icon(Icons.arrow_forward),
                          border:OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          hintText: "enter name",
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Color(0xFF2B4865))),
                          enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(20), borderSide: BorderSide(color: Color(0xFF2B4865))),
                          hintStyle:
                          TextStyle(color: Color(0xFF2B4865), fontSize: 23)),

                      textInputAction: TextInputAction.next,
                      //autofocus: true,
                      controller: name,
                      onTap: () {
                        setState(() {
                          sname=false;
                        });

                      },

                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                    width: double.infinity,

                    child: TextFormField(

                      minLines: 6, // any number you need (It works as the rows for the textarea)
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      controller: add,
                      decoration: InputDecoration(
                        errorText: sadd ? adddata : null,
                          filled: true,
                          fillColor: Colors.grey.shade300,

                          suffix: Icon(Icons.arrow_forward),
                          border:OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          hintText: "enter Address",
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Color(0xFF2B4865))),
                          enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(20), borderSide: BorderSide(color: Color(0xFF2B4865))),
                          hintStyle:
                          TextStyle(color: Color(0xFF2B4865), fontSize: 23)),
                      textInputAction: TextInputAction.next,
                      onTap: () {
                        setState(() {
                          sadd=false;
                        });

                      },
                    ),
                  ),
                  Container(
                    height: 63,

                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(30, 10, 30, 15),
                    //margin: EdgeInsets.only(left: 20,right: 20),
                    child: TextField(
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      decoration: InputDecoration(
                        errorText: sdob ? dobdata : null,
                          filled: true,
                          fillColor: Colors.grey.shade300,
                          prefixIcon: IconButton(onPressed: () async {
                            final DateTime? picked = (await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                                firstDate: DateTime(1990),
                            lastDate: DateTime.now()))!;
                            if (picked != null && picked != selecteddate) {
                            setState(() {

                            selecteddate = picked;

                             dob.text="${selecteddate.year}-${selecteddate
                                  .month}-${selecteddate.day}";
                             print("dobbbbbbbbbbbbbbbbbbbb${dob.text}");





                            });
                            }
                          }, icon: Icon(Icons.calendar_month_outlined,
                              color: Colors.black, size: 35)),
                          suffix: Icon(Icons.arrow_forward),
                          border:OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          hintText: " select date of birth(dd|mm|yyyy)",
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Color(0xFF2B4865))),
                          enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(20), borderSide: BorderSide(color: Color(0xFF2B4865))),
                          hintStyle:
                          TextStyle(color: Color(0xFF2B4865), fontSize: 23)),

                      textInputAction: TextInputAction.next,
                      //autofocus: true,
                      controller: dob,
                      onTap: () {
                        setState(() {
                          sdob=false;
                        });

                      },

                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(35, 0, 0, 0),
                        child:
                        Text("Gender:", style: TextStyle(color: Color(0xFF2B4865),  fontWeight: FontWeight.bold, fontSize: 24)),),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text("Male",
                            style: TextStyle(
                                color: Color(0xFF2B4865),
                                fontSize: 22,
                                fontWeight: FontWeight.w500)),
                      ),
                      Radio(
                        value: "male",
                        groupValue: s,
                        onChanged: (value) {
                          setState(() {
                            s = value!;
                            print("$s");
                          });
                        },
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        child: Text("Female",
                            style: TextStyle(
                                color: Color(0xFF2B4865),
                                fontSize: 22,
                                fontWeight: FontWeight.w500)),
                      ),
                      Radio(
                        value: "Female",
                        groupValue: s,
                        onChanged: (value) {
                          setState(() {
                            s = value!;
                          });
                        },
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0Xff3d6a8a),
                            padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                            fixedSize: Size(350, 60),

                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                        ),



                        onPressed: () async {


                            setState(() {
                              sname=false;
                              sadd=false;
                              sdob=false;


                              if (name.text.isEmpty) {
                                sname = true;
                                namedata = "please enter the name";
                              }
                              if (add.text.isEmpty) {
                                sadd = true;
                                adddata = "please enter the address";
                              }
                              if (dob.text.isEmpty) {
                                sdob = true;
                                dobdata = "please select date of birth";
                              }
                            });





                          List<int> imagebyte=File(imagepath).readAsBytesSync();
                          String imagedata=base64Encode(imagebyte);
                          Map map={
                            "email":sign.email.text,
                            "number":sign.number.text,
                            "password":pass.password.text,
                            "photo":imagedata,
                            "name":name.text,
                            "address":add.text,
                            "dob":dob.text,
                            "gender":s,

                          };
                          print("map=========$map");
                          var url = Uri.parse('https://himanshi85.000webhostapp.com/ecommerce/registerdata.php');
                          var response = await http.post(url, body: map);
                          print('Response status: ${response.statusCode}');
                          print('Response body: ${response.body}');
                          Map<String, dynamic> mm=jsonDecode(response.body);
                          getdata gg=getdata.fromJson(mm);
                          if(gg.connection==1){
                            if(gg.result==1){
                               Lottie.asset("anima/104368-thank-you.json");
                               Future.delayed(Duration(seconds: 5)).then((value) {
                                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                   return lll();
                                 },));
                               });

                            }
                            else {
                              if (sname == false && sdob == false &&
                                  sadd == false) {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text("User already exist")));
                              }
                            }
                          }





                        },
                        child: Text(
                          "Submit",
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
        ],
      ),);

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


