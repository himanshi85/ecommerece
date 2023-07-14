import 'dart:convert';
import 'dart:io';

import 'package:ecommerece/home.dart';
import 'package:ecommerece/splashscreen.dart';
import 'package:ecommerece/uploadproduct.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class setprice extends StatefulWidget {
  const setprice({Key? key}) : super(key: key);

  @override
  State<setprice> createState() => _setpriceState();
}

class _setpriceState extends State<setprice> {

  String selectvalue = "no";
  String s="no";
  TextEditingController productprice=TextEditingController();
  TextEditingController productsellprice=TextEditingController();
  TextEditingController productwarrentycondition=TextEditingController();
  String userid="";
  List<String>  imagestring=[];

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("yes"), value: "yes"),
      DropdownMenuItem(child: Text("no"), value: "no"),

    ];
    return menuItems;
  }
  String Satus="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   getpreferece();
  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffd8e1e8),
        appBar: AppBar(
          backgroundColor: Color(0xff6488a1),
          elevation: 20,
          title:  Row(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                child:Icon(Icons.arrow_back, size: 30,  ) ,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(50, 20, 0, 20),
                child: Text("Upload product",style: TextStyle(fontWeight: FontWeight.w400, fontSize: 30, color:Colors.white)),
              ),
            ],
          ),
        ),
        body: Container(

          child: ListView(
            shrinkWrap: true,
            children: [

              Container(

                margin: EdgeInsets.fromLTRB(80, 20, 0, 0),
                color: Color(0xffd8e1e8),
                child: Text("Set product price", style: TextStyle(fontSize: 25, color: Color(0xff2b4a61), fontWeight: FontWeight.bold),),
              ),
              Container(

                margin: EdgeInsets.fromLTRB(60, 0, 0, 0),
                color: Color(0xffd8e1e8),
                child: Text("Enter your Product Price here", style: TextStyle(fontSize: 20, color: Color(0xff2b4a61)),),
              ),




              Row(
                children: [
                  Container(

                    margin: EdgeInsets.fromLTRB(20, 30, 0, 0),
                    color: Color(0xffd8e1e8),
                    child: Text("Product price", style: TextStyle(fontSize: 21, color: Color(0xff2b4a61), ),),
                  ),
                  Container(

                    margin: EdgeInsets.fromLTRB(90, 30, 0, 0),
                    color: Color(0xffd8e1e8),
                    child: Text("Product sell price", style: TextStyle(fontSize: 21, color: Color(0xff2b4a61), ),),
                  ),

                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 10, 10, 0),
                    height: 58,
                    width: 170,
                    child: TextField(
                      style: TextStyle(
                          fontSize: 20, color: Colors.black),
                      decoration: InputDecoration(
                        // errorText: satusemail ? emaill : null,
                          filled: true,
                          fillColor: Color(0xffd8e1e8),

                          border:OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          // hintText:"enter product name",
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color: Colors.grey.shade600)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Colors.grey.shade600)),
                          hintStyle: TextStyle(
                              color: Color(0xff2b4a61),
                              fontSize: 20)),

                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      //autofocus: true,
                      controller: productprice,
                      onTap: () {
                        setState(() {
                          // satusemail=false;
                        });

                      },
                    ),

                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(35, 10, 5, 0),
                    height: 58,
                    width: 170,
                    child: TextField(
                      style: TextStyle(
                          fontSize: 20, color: Colors.black),
                      decoration: InputDecoration(
                        // errorText: satusemail ? emaill : null,
                          filled: true,
                          fillColor: Color(0xffd8e1e8),

                          border:OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          // hintText:"enter product name",
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color: Colors.grey.shade600)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Colors.grey.shade600)),
                          hintStyle: TextStyle(
                              color: Color(0xff2b4a61),
                              fontSize: 20)),

                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      //autofocus: true,
                      controller: productsellprice,
                      onTap: () {
                        setState(() {
                          // satusemail=false;
                        });

                      },
                    ),

                  ),
                ],
              ),
              Row(
                children: [
                 Column(children: [
                   Container(

                     margin: EdgeInsets.fromLTRB(10, 30, 0, 0),
                     color: Color(0xffd8e1e8),
                     child: Text("Product warrenty", style: TextStyle(fontSize: 21, color: Color(0xff2b4a61), ),),
                   ),
                   Container(
                     width: 100,
                     height: 70,
                     //color: Colors.pinkAccent,
                     margin: EdgeInsets.fromLTRB(20, 10, 95, 0),
                     child: DropdownButtonFormField(
                       decoration: InputDecoration(
                         enabledBorder: OutlineInputBorder(
                           borderSide: BorderSide(color: Colors.grey.shade600, width: 1),
                           borderRadius: BorderRadius.circular(20),
                         ),
                         border: OutlineInputBorder(
                           borderSide: BorderSide(color: Colors.grey.shade600, width: 1),
                           borderRadius: BorderRadius.circular(20),
                         ),
                         focusColor: Colors.grey.shade500,
                         focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.grey.shade600)),
                         filled: true,
                         fillColor: Color(0xffd8e1e8),
                       ),
                       dropdownColor: Colors.grey,
                       value: selectvalue,
                       items: dropdownItems,

                       onChanged: (String? value) {
                         setState(() {
                           selectvalue =  value!;
                           print(">>>>>>>>>>>${selectvalue}");
                           Satus=selectvalue;
                         });
                       },),

                   ),

                 ],
                 ),
                 Satus=="yes"? Column(
                    children: [
                      Container(

                        margin: EdgeInsets.fromLTRB(25, 30, 0, 0),
                        color: Color(0xffd8e1e8),
                        child: Text("warrenty conditon", style: TextStyle(fontSize: 21, color: Color(0xff2b4a61), ),),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 10, 10, 0),
                        height: 58,
                        width: 170,
                        child: TextField(
                          style: TextStyle(
                              fontSize: 20, color: Colors.black),
                          decoration: InputDecoration(
                            // errorText: satusemail ? emaill : null,
                              filled: true,
                              fillColor: Color(0xffd8e1e8),

                              border:OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                              // hintText:"enter product name",
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade600)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade600)),
                              hintStyle: TextStyle(
                                  color: Color(0xff2b4a61),
                                  fontSize: 20)),

                          textInputAction: TextInputAction.next,

                          //autofocus: true,
                          controller: productwarrentycondition,
                          onTap: () {
                            setState(() {
                              // satusemail=false;
                            });

                          },
                        ),

                      ),
                    ],
                  ):Column(),


                ]
              ),



              Row(
                children: [
                  Container(

                    margin: EdgeInsets.fromLTRB(10, 15, 0, 0),
                    color: Color(0xffd8e1e8),
                    child: Text("Product refund policy?", style: TextStyle(fontSize: 20, color: Color(0xff2b4a61), ),),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 15, 0, 0),
                    child: Text("yes",
                        style: TextStyle(
                            color: Color(0xFF2B4865),
                            fontSize: 22,
                            fontWeight: FontWeight.w500)),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 15, 0, 0),

                    child: Radio(
                      value: "yes",
                      groupValue: s,
                      onChanged: (value) {
                        setState(() {
                          s = value!;
                          print("$s");
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 15, 0, 0),
                    child: Text("no",
                        style: TextStyle(
                            color: Color(0xFF2B4865),
                            fontSize: 22,
                            fontWeight: FontWeight.w500)),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 15, 0, 0),

                    child: Radio(
                      value: "no",
                      groupValue: s,
                      onChanged: (value) {
                        setState(() {
                          s = value!;
                        });
                      },
                    ),
                  )
                ],
              ),

              Row(
                children: [
                  Container(
                    width: 130,
                    margin: EdgeInsets.fromLTRB(20, 40, 10, 0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0Xff3d6a8a),
                            padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                            fixedSize: Size(60, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: () async {
                           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                             return uploadp();
                           },));


                        },
                        child: Text(
                          "Back",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        )),
                  ),
                  Container(
                    width: 140,
                    margin: EdgeInsets.fromLTRB(80, 40, 10, 0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0Xff3d6a8a),
                            padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                            fixedSize: Size(60, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: () async {

                          for(int i=0; i<uploadp.imagexfile.length; i++){

                            List<int> imagebyte=File(uploadp.imagexfile[i].path).readAsBytesSync();
                            String imagedata=base64Encode(imagebyte);
                            imagestring.add(imagedata);


                          }



                          Map map={

                            "productcategory":uploadp.selectvalue,
                            "catogoryid":uploadp.count,
                            "userid":userid,
                            "productname":uploadp.productname.text,
                            "productdescription":uploadp.productd.text,
                            "productprice":productprice.text,
                            "productsellprice":productsellprice.text,
                            "productwarrenty":selectvalue,
                            "warrentycondition":productwarrentycondition.text,
                            "refundpolicy":s,
                            "image":"${imagestring}",
                            "imagelength":"${uploadp.imagexfile.length}"


                          };

                          print("${uploadp.imagexfile.length},clsakkkkkkkkkk  ${imagestring}");
                          print("map=========%%%%%%%%%%%%%%%%%%%$map");
                          var url = Uri.parse('https://himanshi85.000webhostapp.com/ecommerce/uploadproduct.php');
                          var response = await http.post(url, body: map);
                          print('Response status: ${response.statusCode}');
                          print('Response body: ${response.body}');



                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                            return hommm();
                          },));


                        },
                        child: Text(
                          "Complete",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        )),
                  ),
                ],
              )









            ],
          ),
        ),

      ),
    );
  }

  void getpreferece() {

    setState(() {
      userid=SplashScreen.pref!.getString("id")??"";
    });
  }
}
