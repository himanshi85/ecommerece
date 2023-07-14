import 'dart:convert';
import 'dart:io';

import 'package:ecommerece/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class update extends StatefulWidget {
  Map ll;
  update(this.ll);



  @override
  State<update> createState() => _updateState();

}

class _updateState extends State<update> {
  String imagestring="";
  String imagepath="";
   
String multiimagselect="";
String multiimaggeeeeeeee="";
  final ImagePicker picker = ImagePicker();

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
  String selectvalue = "watch";

 String count="";
 TextEditingController productd=TextEditingController();
 TextEditingController productname=TextEditingController();





 //////////////////////

  String selectvalue1 = "no";
  String s="no";
  TextEditingController productprice=TextEditingController();
  TextEditingController productsellprice=TextEditingController();
  TextEditingController productwarrentycondition=TextEditingController();

  String catogoryid="";
  String useridd="";
  String productid="";
  List<String> imagenewname=[];


  List<DropdownMenuItem<String>> get dropdownItems1 {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("yes"), value: "yes"),
      DropdownMenuItem(child: Text("no"), value: "no"),

    ];
    return menuItems;
  }
  String Satus="";

  List<String> multiimage=[];

  List<String> xfilemultiimage=[];
  List<String> xfilemultiimage1=[];
  List<bool> updateImage = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   print("himanshiupdateeeeeeeeeeeeeeeeeeeeeeee${widget.ll['PRICE']}");

    catogoryid=widget.ll['CATEGORYID'];

    selectvalue=widget.ll['CATOGORYNAME'];
    productname.text=widget.ll['PRODUCTNAME'];
    productd.text=widget.ll['DESCRIPTION'];
    productprice.text=widget.ll['PRICE'];
    productsellprice.text=widget.ll['SELLPRICE'];
    selectvalue1=widget.ll['WARRENTY'];

    productwarrentycondition.text=widget.ll['WARRENTYCONDI'];
    s=widget.ll['REFUNDPOLICY'];
    useridd=widget.ll['USERID'];
    productid=widget.ll['PRODUCTID'];
    Satus=selectvalue1;


    for(int i=0; i<widget.ll['IMAGE'].length; i++){
      multiimage.add(widget.ll['IMAGE'][i]);
    }
    updateImage.clear();
    updateImage = List.filled(widget.ll['IMAGE'].length, false);
    xfilemultiimage =List.filled(widget.ll['IMAGE'].length, "");





print("jkbckjackbakckja${multiimage}");



  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd8e1e8),
      body: Container(
        child:
        ListView(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(80, 20, 0, 0),
              color: Color(0xffd8e1e8),
              child: Text(
                "update Product details",
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
                "update your Product Details here",
                style: TextStyle(fontSize: 20, color: Color(0xff2b4a61)),
              ),
            ),

Container(

  height: 150,
  child:   ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount:widget.ll['IMAGE'].length,
    itemBuilder: (context, index) {
      return InkWell(
      onTap: () async {


        print("himanaxalnxhimashiiiiii");
       final  XFile? image = await picker.pickImage(source: ImageSource.gallery, imageQuality: 30);
if(image!="") {
  setState(() {

    xfilemultiimage[index]=image!.path;
 xfilemultiimage1.add(image!.path);
    // updateImage[index] = true;
    // xfilemultiimage.add(multiimaggeeeeeeee);
    imagenewname.add(multiimage[index]);
  });
}



      },
      child: Container(

        height: 70,
        width: 70,
        margin: EdgeInsets.all(8),
        color: Colors.transparent,
        child:  xfilemultiimage[index]!=""?Image(image: FileImage(File(xfilemultiimage[index]))):Image(image: NetworkImage('https://himanshi85.000webhostapp.com/ecommerce/${multiimage[index]}')),
      ),
    );



  },),

),
            
            
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
                value: selectvalue,
                items: dropdownItems,
                onChanged: (String? value) {
                  setState(() {
                    selectvalue = value!;
                    print("><<<<<<<<<<<<<<>>>>>>>>>${selectvalue}");

                    if(selectvalue=="watch"){
                      catogoryid="1";
                    }else if(selectvalue=="cloth"){
                      catogoryid="2";
                    }
                    else if(selectvalue=="laptop"){
                      catogoryid="3";
                    }
                    else if(selectvalue=="car"){
                    catogoryid='4';
                    }
                    else if(selectvalue=="bike"){
                      catogoryid='5';
                    }
                    else if(selectvalue=="mobile"){
                      catogoryid="6";
                    }
                    else if(selectvalue=="smart tv"){
                      catogoryid="7";
                    }
                    else if(selectvalue=="shooes"){
                     catogoryid="8";
                    }



                    print("????????????${count}");

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
                controller: productname,
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
                controller: productd,
                onTap: () {
                  setState(() {
                    // sadd=false;
                  });
                },
              ),
            ),
            Container(

              margin: EdgeInsets.fromLTRB(80, 20, 0, 0),
              color: Color(0xffd8e1e8),
              child: Text("update product price", style: TextStyle(fontSize: 25, color: Color(0xff2b4a61), fontWeight: FontWeight.bold),),
            ),
            Container(

              margin: EdgeInsets.fromLTRB(60, 0, 0, 0),
              color: Color(0xffd8e1e8),
              child: Text("update your Product Price here", style: TextStyle(fontSize: 20, color: Color(0xff2b4a61)),),
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
                        value: selectvalue1,
                        items: dropdownItems1,

                        onChanged: (String? value) {
                          setState(() {
                            selectvalue1 =  value!;
                            print(">>>>>>>>>>>${selectvalue}");
                            Satus=selectvalue1;
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
            Container(
              margin: EdgeInsets.fromLTRB(20, 40, 10, 20),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color(0Xff3d6a8a),
                      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                      fixedSize: Size(500, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () async {
      List imageData = [];
                    // for(int i=0; i<xfilemultiimage.length; i++) {
                    //   // if(xfilemultiimage[i]) {
                    //     List<int> imagebyte=File(xfilemultiimage[i]).readAsBytesSync();
                    //     String imagedata=base64Encode(imagebyte);
                    //     imageData.add(imagedata);
                    //   // } else {
                    //   //   imageData.add('');
                    //   // }
                    // }


      for(int i=0; i<xfilemultiimage1.length; i++){
        List<int> imagebyte=File(xfilemultiimage1[i]).readAsBytesSync();
        imageData.add(base64Encode(imagebyte));
      }



      //               List<int> imagebyte=File(multiimaggeeeeeeee).readAsBytesSync();
      //               String imagedata=base64Encode(imagebyte);
                    print("iamgedataaaaaaaaaaa${imageData}");
                    print("imagenamestring${imagenewname}");

                    Map map={

                      "productcategory":selectvalue,
                      "catogoryid":catogoryid,
                      "userid":useridd,
                      "productname":productname.text,
                      "productdescription":productd.text,
                      "productprice":productprice.text,
                      "productsellprice":productsellprice.text,
                      "productwarrenty":selectvalue1,
                      "warrentycondition":productwarrentycondition.text,
                      "refundpolicy":s,
                      "productid":productid,
                      "image":widget.ll['IMAGE'][0],
                      "imagenew":imageData,

                      // "count":"${widget.ll['IMAGE'].length}"


                    };
                    DefaultCacheManager manager =  new DefaultCacheManager();
                    manager.emptyCache();

                    // print("map=========%%%%%%%%%%%%%%%%%%%himanshiiiiiiiiiiii$map");
                    // var url = Uri.parse('https://himanshi85.000webhostapp.com/ecommerce/update.php');
                    // var response = await http.post(url, body: map);
                    // print('Response status: ${response.statusCode}');
                    // print('Response body: ${response.body}');





                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                      return hommm();
                    },));





                  },
                  child: Text(
                    "Update",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
