import 'dart:io';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:ecommerece/setproductprice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class uploadp extends StatefulWidget {
static  TextEditingController productname = TextEditingController();
  static TextEditingController productd = TextEditingController();
static String selectvalue = "watch";
static String imagepath = "";
static String count="";
static List<XFile> imagexfile=[];


  @override
  State<uploadp> createState() => _uploadpState();
}

class _uploadpState extends State<uploadp> {
  late SingleValueDropDownController _cnt;

  List<String> imagestring=[];
  bool  satus=true;





  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("watch"), value: "watch"),
      DropdownMenuItem(child: Text("cloth"), value: "cloth"),
      DropdownMenuItem(child: Text("laptop"), value: "laptop"),
      DropdownMenuItem(child: Text("car"), value: "car"),
      DropdownMenuItem(child: Text("bike"), value: "bike"),
      DropdownMenuItem(child: Text("mobile"), value: "mobile"),
      DropdownMenuItem(child: Text("smart tv"), value: "smart tv"),
      DropdownMenuItem(child: Text("shooes"), value: "shooes"),
    ];
    return menuItems;
  }
  final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Color(0xff6488a1),
        statusBarIconBrightness:
            Brightness.light // Replace with your desired color
        ));
    _cnt = SingleValueDropDownController();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffd8e1e8),
        // appBar: AppBar(
        //   backgroundColor: Color(0xff6488a1),
        //   elevation: 20,
        //   title:  Row(
        //     children: [
        //       Container(
        //         margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
        //         child:Icon(Icons.arrow_back, size: 30,  ) ,
        //       ),
        //       Container(
        //         margin: EdgeInsets.fromLTRB(50, 20, 0, 20),
        //         child: Text("Upload product",style: TextStyle(fontWeight: FontWeight.w400, fontSize: 30, color:Colors.white)),
        //       ),
        //     ],
        //   ),
        // ),
        body:
        Container(
          child:
          ListView(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(80, 20, 0, 0),
                color: Color(0xffd8e1e8),
                child: Text(
                  "Add Product details",
                  style: TextStyle(
                      fontSize: 25,
                      color: Color(0xff2b4a61),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(60, 0, 0, 0),
                color: Color(0xffd8e1e8),
                child: Text(
                  "Enter your Product Details here",
                  style: TextStyle(fontSize: 20, color: Color(0xff2b4a61)),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 50, 0, 0),
                color: Color(0xffd8e1e8),
                child: Text(
                  "Add product images",
                  style: TextStyle(
                      fontSize: 21,
                      color: Color(0xff2b4a61),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                color: Color(0xffd8e1e8),
                child: Text(
                  "Add upto 5 images first image is your product cover image",
                  style: TextStyle(fontSize: 18, color: Color(0xff2b4a61)),
                ),
              ),


              satus?InkWell(
                onTap: () async {


                  var image= await picker.pickMultiImage();
                  if(image!=null){
                    setState(() {
                      uploadp.imagexfile=image;
                      satus=false;
                    });
                  }

                },
                child: Container(
                  width: 60,
                  height: 60,
                  child:  Image.asset("image/img_22.png") ,
                ),
              ):
              uploadp.imagexfile!=null?Wrap(
                children: uploadp.imagexfile.map((e) {
                  return Container(
                     height: 100,
                    width: 100,
                    child: Image.file(File(e.path)),
                  );
                }).toList()
              ):Container(),




              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                color: Color(0xffd8e1e8),
                child: Text(
                  "Enter product detail",
                  style: TextStyle(
                      fontSize: 21,
                      color: Color(0xff2b4a61),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                color: Color(0xffd8e1e8),
                child: Text(
                  "select product category",
                  style: TextStyle(
                    fontSize: 21,
                    color: Color(0xff2b4a61),
                  ),
                ),
              ),
              Container(
                height: 70,
                //color: Colors.pinkAccent,
                margin: EdgeInsets.fromLTRB(20, 10, 220, 0),
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade600, width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade600, width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusColor: Colors.grey.shade500,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey.shade600)),
                    filled: true,
                    fillColor: Color(0xffd8e1e8),
                  ),
                  dropdownColor: Colors.grey,
                  value: uploadp.selectvalue,
                  items: dropdownItems,
                  onChanged: (String? value) {
                    setState(() {
                      uploadp.selectvalue = value!;
                      print("><<<<<<<<<<<<<<>>>>>>>>>${uploadp.selectvalue}");

                        if(uploadp.selectvalue=="watch"){
                          uploadp.count="1";
                        }else if(uploadp.selectvalue=="cloth"){
                          uploadp.count="2";
                        }
                        else if(uploadp.selectvalue=="laptop"){
                          uploadp.count="3";
                        }
                        else if(uploadp.selectvalue=="car"){
                          uploadp.count='4';
                        }
                        else if(uploadp.selectvalue=="bike"){
                          uploadp.count='5';
                        }
                        else if(uploadp.selectvalue=="mobile"){
                          uploadp.count="6";
                        }
                        else if(uploadp.selectvalue=="smart tv"){
                          uploadp.count="7";
                        }
                        else if(uploadp.selectvalue=="shooes"){
                          uploadp.count="8";
                        }



                        print("????????????${uploadp.count}");

                    });
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                color: Color(0xffd8e1e8),
                child: Text(
                  "Product name",
                  style: TextStyle(
                    fontSize: 21,
                    color: Color(0xff2b4a61),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                height: 58,
                child: TextField(
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  decoration: InputDecoration(
                      // errorText: satusemail ? emaill : null,
                      filled: true,
                      fillColor: Color(0xffd8e1e8),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      // hintText:"enter product name",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.grey.shade600)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.grey.shade600)),
                      hintStyle:
                          TextStyle(color: Color(0xff2b4a61), fontSize: 20)),

                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  //autofocus: true,
                  controller: uploadp.productname,
                  onTap: () {
                    setState(() {
                      // satusemail=false;
                    });
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                color: Color(0xffd8e1e8),
                child: Text(
                  "Product description",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff2b4a61),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                width: double.infinity,
                child: TextFormField(
                  minLines: 6,
                  // any number you need (It works as the rows for the textarea)
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  // controller: add,
                  decoration: InputDecoration(
                      // errorText: sadd ? adddata : null,
                      filled: true,
                      fillColor: Color(0xffd8e1e8),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      // hintText: "enter Address",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.grey.shade600)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.grey.shade600)),
                      hintStyle:
                          TextStyle(color: Color(0xff2b4a61), fontSize: 20)),
                  textInputAction: TextInputAction.next,
                  controller: uploadp.productd,
                  onTap: () {
                    setState(() {
                      // sadd=false;
                    });
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(240, 40, 10, 20),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color(0Xff3d6a8a),
                        padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                        fixedSize: Size(60, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () async {




                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return setprice();
                        },
                      ));
                    },
                    child: Text(
                      "Next",
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
