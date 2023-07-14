import 'dart:convert';

import 'package:ecommerece/home.dart';
import 'package:ecommerece/splashscreen.dart';
import 'package:ecommerece/stack.dart';
import 'package:ecommerece/updateproduct.dart';
import 'package:ecommerece/viewofpaticularproduct.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
class viewproduct extends StatefulWidget {
  const viewproduct({Key? key}) : super(key: key);

  @override
  State<viewproduct> createState() => _viewproductState();
}

class _viewproductState extends State<viewproduct> {
  TextEditingController serach = TextEditingController();
  bool heart = true;
  List<bool> heartlist = [];
  var updatedata;
  List images = [13, 14, 16, 17, 18, 19, 20, 21];
  List<String> imagename = [
    "Watch",
    "clothes",
    "laptop",
    "car",
    "bike",
    "mobile",
    "smart tv",
    "shooes"
  ];
  String userloginid = "";
  Autogenerated? aa;
  int cnt = 0;
  bool satus = false;
  List format = [];
  int productid=0;

  Map <String, dynamic> temp = {};


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    heartlist = List.filled(10, true);
    getprefrences();
    forViewProduct();
  

  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Container(
                height: 66,
                width: 350,
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    cursorHeight: 30,
                    cursorColor: Colors.grey,
                    //textAlign: TextAlign.center,

                    onChanged: (value) {},
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search,
                            size: 33, color: Color(0xFF2B4865)),
                        // suffixIcon: IconButton(onPressed: () {
                        //
                        // }, icon:Icon(Icons.close, size: 33, color: Color(0xFF2B4865))),
                        hintText: "Search product",
                        fillColor: Color(0xffeaedf0),
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                            BorderSide(color: Colors.white, width: 2)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.shade500,
                                style: BorderStyle.solid,
                                width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        hintStyle:
                        TextStyle(color: Color(0xFF2B4865), fontSize: 21)),
                    controller: serach,
                    onTap: () {},
                    //textInputAction: TextInputAction.next,
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 50,
                margin: EdgeInsets.fromLTRB(0, 10, 5, 0),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Color(0xffeaedf0),
                    border: Border.all(color: Colors.grey.shade600),
                    borderRadius: BorderRadius.circular(10)),
                child: Image(
                    image: AssetImage("image/option.png"),
                    color: Color(0xFF2B4865),
                    fit: BoxFit.fill),
              )
            ],
          ),
          Container(
            height: 105,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 0, 30),
                  height: 40,
                  width: 160,
                  decoration: BoxDecoration(
                      color: Color(0xffd8e1e8),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Colors.grey.shade500,
                          width: 2,
                          style: BorderStyle.solid)),
                  child: ListTile(
                    leading: Image.asset(
                      "image/img_${images[index]}.png",
                      height: 30,
                    ),
                    trailing: Container(
                      margin: EdgeInsets.fromLTRB(7, 0, 10, 0),
                      child: TextButton(
                          onPressed: () {

                            String indexx = (index + 1).toString();
                            forViewProduct(id: indexx);
                          },
                          child: Text(
                            "${imagename[index]}",
                            style: TextStyle(
                                color: Color(0xFF2B4865), fontSize: 21),
                          )),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: satus ? aa!.productdata!.length : 0,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.6),
              itemBuilder: (context, index) {
                return satus
                    ? Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xffeaedf0),
                  ),
                  child: CustomCard(
                    elevation: 40,
                    color: Color(0xffeaedf0),
                    borderRadius: 20,
                    onTap: () {
                      setState(() {
                        print("himanshiiiiiiiiiiiiii");

                       var productppp = temp["productdata"][index];
                        print(
                            "jkscwqqqqqqqqqqqqqqqqqqqqqqqq${temp["productdata"][index]}");



                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return stackk(productppp);


                        },));

                      });
                    },
                    child: Column(
                      children: [
                        Row(children: [
                          heartlist[index]
                              ? InkWell(
                            onTap: () {
                              setState(() {
                                heartlist[index] = false;
                              });
                            },
                            child: Container(
                                margin:
                                EdgeInsets.fromLTRB(5, 3, 30, 0),
                                child: Image(
                                  image:
                                  AssetImage("image/img_9.png"),
                                  height: 22,
                                  color: Colors.grey.shade900,
                                )),
                          )
                              : InkWell(
                            onTap: () {
                              setState(() {
                                heartlist[index] = true;
                              });
                            },
                            child: Container(
                                margin:
                                EdgeInsets.fromLTRB(5, 3, 30, 0),
                                child: Image(
                                  image:
                                  AssetImage("image/img_11.png"),
                                  height: 22,
                                  color: Colors.red.shade500,
                                )),
                          ),


                          Container(
                              margin:
                              EdgeInsets.fromLTRB(50, 3, 0, 0),

                              child: PopupMenuButton(
                                onSelected: (value) {
                                  if (value == 1) {
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return update(updatedata);
                                          },
                                        ));
                                  }
                                  if (value == 2) {
                                   fordelete(index);
                                  }
                                },

                                itemBuilder: (context) {
                                return [
                                  PopupMenuItem(
                                      value: 1,
                                      onTap: () {
                                        setState(() {
                                         updatedata = temp["productdata"][index];
                                        });
                                      },
                                      child: Text("update")),
                                  PopupMenuItem(
                                    onTap: () {
                                        
                             setState(() {


                               // productid=format[index]['PRODUCTID'];


                               print("producyttttttttttttttt${format[index]['PRODUCTID']}");
                             });
                                      

                                    },
                                      value: 2,
                                      child: Text("delete")),
                                ];
                              },)

                          )
                        ],),
                        Container(
                          height: 170,
                          margin: EdgeInsets.fromLTRB(4, 0, 0, 0),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://himanshi85.000webhostapp.com/ecommerce/${aa!
                                        .productdata![index].iMAGE![0]}"),
                                fit: BoxFit.fill),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Text(
                              "${aa!.productdata![index].pRODUCTNAME}",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                        ),
                        Row(
                          children: [
                            Container(
                                margin: EdgeInsets.fromLTRB(40, 5, 0, 0),
                                child: Image(
                                  image: AssetImage("image/img_8.png"),
                                  height: 20,
                                  color: Color(0xFF2B4865),
                                )),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Text(
                                  "${aa!.productdata![index].pRICE}",
                                  style: TextStyle(
                                      color: Color(0xFF2B4865),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
                    : CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }

  void getprefrences() {
    setState(() {
      userloginid = SplashScreen.pref!.getString("id") ?? "";
    });
  }

  Future<void> forViewProduct({String id = '1'}) async {
    Map data = {"userloginid": userloginid};
    print('=============');

    var url = Uri.parse(
        'https://himanshi85.000webhostapp.com/ecommerce/viewproduct.php');
    var response = await http.post(url, body: data);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    var mm = jsonDecode(response.body);


    format = mm['productdata'].where((element) {
      print(element['CATEGORYID']);
      return element['CATEGORYID'] == id;
    }).toList();
    setState(() {
      temp['connection'] = mm['connection'];
      temp['result'] = mm['result'];
      temp['productdata'] = format;

      aa = Autogenerated.fromJson(temp);
      satus = true;
    });
    
    
    print("%%%%%%%%%${temp['productdata'][0]['PRODUCTID']}");

    print("________________________$format");




  }

   Future<void> fordelete(int index) async {

    DefaultCacheManager manager =  new DefaultCacheManager();
    manager.emptyCache();

    Map data = {
     "productid":aa!.productdata![index].pRODUCTID
    };


    var url =
    Uri.parse('https://himanshi85.000webhostapp.com/ecommerce/delete.php');
    var response = await http.post(url, body: data);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');



    forViewProduct();






  }

}

// class Autogenerated {
//   int? connection;
//   int? result;
//   List<Productdata>? productdata;
//
//   Autogenerated({this.connection, this.result, this.productdata});
//
//   Autogenerated.fromJson(Map<String, dynamic> json) {
//     connection = json['connection'];
//     result = json['result'];
//     if (json['productdata'] != null) {
//       productdata = <Productdata>[];
//       json['productdata'].forEach((v) {
//         productdata!.add(new Productdata.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['connection'] = this.connection;
//     data['result'] = this.result;
//     if (this.productdata != null) {
//       data['productdata'] = this.productdata!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Productdata {
//   String? pRODUCTID;
//   String? cATEGORYID;
//   String? uSERID;
//   String? cATOGORYNAME;
//   String? pRODUCTNAME;
//   String? dESCRIPTION;
//   String? pRICE;
//   String? sELLPRICE;
//   String? wARRENTY;
//   String? wARRENTYCONDI;
//   String? rEFUNDPOLICY;
//   String? iMAGE;
//
//   Productdata({this.pRODUCTID,
//     this.cATEGORYID,
//     this.uSERID,
//     this.cATOGORYNAME,
//     this.pRODUCTNAME,
//     this.dESCRIPTION,
//     this.pRICE,
//     this.sELLPRICE,
//     this.wARRENTY,
//     this.wARRENTYCONDI,
//     this.rEFUNDPOLICY,
//     this.iMAGE});
//
//   Productdata.fromJson(Map<String, dynamic> json) {
//     pRODUCTID = json['PRODUCTID'];
//     cATEGORYID = json['CATEGORYID'];
//     uSERID = json['USERID'];
//     cATOGORYNAME = json['CATOGORYNAME'];
//     pRODUCTNAME = json['PRODUCTNAME'];
//     dESCRIPTION = json['DESCRIPTION'];
//     pRICE = json['PRICE'];
//     sELLPRICE = json['SELLPRICE'];
//     wARRENTY = json['WARRENTY'];
//     wARRENTYCONDI = json['WARRENTYCONDI'];
//     rEFUNDPOLICY = json['REFUNDPOLICY'];
//     iMAGE = json['IMAGE'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['PRODUCTID'] = this.pRODUCTID;
//     data['CATEGORYID'] = this.cATEGORYID;
//     data['USERID'] = this.uSERID;
//     data['CATOGORYNAME'] = this.cATOGORYNAME;
//     data['PRODUCTNAME'] = this.pRODUCTNAME;
//     data['DESCRIPTION'] = this.dESCRIPTION;
//     data['PRICE'] = this.pRICE;
//     data['SELLPRICE'] = this.sELLPRICE;
//     data['WARRENTY'] = this.wARRENTY;
//     data['WARRENTYCONDI'] = this.wARRENTYCONDI;
//     data['REFUNDPOLICY'] = this.rEFUNDPOLICY;
//     data['IMAGE'] = this.iMAGE;
//     return data;
//   }
// }

class Autogenerated {
  int? connection;
  int? result;
  List<Productdata>? productdata;

  Autogenerated({this.connection, this.result, this.productdata});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    connection = json['connection'];
    result = json['result'];
    if (json['productdata'] != null) {
      productdata = <Productdata>[];
      json['productdata'].forEach((v) {
        productdata!.add(new Productdata.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['connection'] = this.connection;
    data['result'] = this.result;
    if (this.productdata != null) {
      data['productdata'] = this.productdata!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Productdata {
  String? pRODUCTID;
  String? cATEGORYID;
  String? uSERID;
  String? cATOGORYNAME;
  String? pRODUCTNAME;
  String? dESCRIPTION;
  String? pRICE;
  String? sELLPRICE;
  String? wARRENTY;
  String? wARRENTYCONDI;
  String? rEFUNDPOLICY;
  List<String>? iMAGE;

  Productdata(
      {this.pRODUCTID,
        this.cATEGORYID,
        this.uSERID,
        this.cATOGORYNAME,
        this.pRODUCTNAME,
        this.dESCRIPTION,
        this.pRICE,
        this.sELLPRICE,
        this.wARRENTY,
        this.wARRENTYCONDI,
        this.rEFUNDPOLICY,
        this.iMAGE});

  Productdata.fromJson(Map<String, dynamic> json) {
    pRODUCTID = json['PRODUCTID'];
    cATEGORYID = json['CATEGORYID'];
    uSERID = json['USERID'];
    cATOGORYNAME = json['CATOGORYNAME'];
    pRODUCTNAME = json['PRODUCTNAME'];
    dESCRIPTION = json['DESCRIPTION'];
    pRICE = json['PRICE'];
    sELLPRICE = json['SELLPRICE'];
    wARRENTY = json['WARRENTY'];
    wARRENTYCONDI = json['WARRENTYCONDI'];
    rEFUNDPOLICY = json['REFUNDPOLICY'];
    iMAGE = json['IMAGE'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PRODUCTID'] = this.pRODUCTID;
    data['CATEGORYID'] = this.cATEGORYID;
    data['USERID'] = this.uSERID;
    data['CATOGORYNAME'] = this.cATOGORYNAME;
    data['PRODUCTNAME'] = this.pRODUCTNAME;
    data['DESCRIPTION'] = this.dESCRIPTION;
    data['PRICE'] = this.pRICE;
    data['SELLPRICE'] = this.sELLPRICE;
    data['WARRENTY'] = this.wARRENTY;
    data['WARRENTYCONDI'] = this.wARRENTYCONDI;
    data['REFUNDPOLICY'] = this.rEFUNDPOLICY;
    data['IMAGE'] = this.iMAGE;
    return data;
  }
}