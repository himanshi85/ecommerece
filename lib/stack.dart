import 'dart:convert';
import 'dart:io';

import 'package:ecommerece/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class stackk extends StatefulWidget {
  Map ll;
  stackk(this.ll);




  @override
  State<stackk> createState() => _stackkState();
}

class _stackkState extends State<stackk> {


  int imagepostion=0;
  int _itemCount=0;
  int sum=0;
  int numberr=0;
  Razorpay rpay=Razorpay();
TextEditingController number=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   rpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
   rpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    rpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xff6b7f93), // Replace with your desired color
    ));
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }

  Widget build(BuildContext context) {
    return Scaffold(
body: Stack(
  children: [
    // Containers with half height
    Positioned(
      top: 0,
      left: 0,
      right: 0,
      height:400,
      child: Container(
        color: Color(0xff6b7f93),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
        onTap: (){

          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
            return hommm();
          },));
      },

          child: Container(
                      margin: EdgeInsets.fromLTRB(10, 40, 0, 0),
                      child: Icon(Icons.arrow_back,  size: 30, color: Colors.white)),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(270, 40, 0, 0),
                    child: Icon(Icons.search,  size: 30, color: Colors.white)),
                Container(
                    margin: EdgeInsets.fromLTRB(20, 40, 0, 0),
                    child: Icon(Icons.shopping_cart,  size: 28, color: Colors.white))
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(30, 34, 0, 0),

                  child: Text("${widget.ll['PRODUCTNAME']}", style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold, fontSize: 30)),),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(20, 70, 0, 0),

                  child: Text("PRICE", style: TextStyle(color:Colors.white, fontSize: 25)),),
              ],
            ),
            Row(
              children: [
                // Container(
                //   margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                //
                //   child: Text("${widget.ll['SELLPRICE']}", style: TextStyle(color:Colors.white, fontSize: 25, )),),
                Container(
                    margin: EdgeInsets.fromLTRB(15, 5, 0, 0),
                    child:Image(image: AssetImage("image/img_8.png"), height: 27,  color: Colors.white,)
                ),

                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  padding: EdgeInsets.all(0),

                  child: Text("${widget.ll['PRICE']}", style: TextStyle(color:Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),),
              ],
            ),
            // Row(
            //   children: [
            //     Container(
            //       margin: EdgeInsets.fromLTRB(30, 10, 0, 0),
            //
            //       child: Text("55%", style: TextStyle(color:Colors.white, fontSize: 22)),),
            //   ],
            // ),

          ],
        ),

      ),
    ),
    Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      height: (MediaQuery.of(context).size.height)-600 / 2,
      child: Container(

        decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),  color: Colors.white,),
        child:
        ListView(

shrinkWrap: true,

          children: [




            Container(
              margin: EdgeInsets.fromLTRB(20, 100, 0, 0),
              child: Text("${widget.ll['DESCRIPTION']}", style: TextStyle(fontWeight: FontWeight.w500
                  ,color: Colors.black, fontSize:17  )),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(20, 20, 0, 0),

              child: Row(
                children: <Widget>[

                  _itemCount!=0? Container(
                      height: 39,
                      width: 40,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.blueGrey.shade200),
                      child: IconButton(icon:  Icon(Icons.remove),onPressed: ()=>setState(()=>_itemCount--),)):Container(),
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Text(_itemCount.toString())),
                   Container(
                       height: 39,
                       width: 40,
                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.blueGrey.shade200),

                       child: IconButton(icon: Icon(Icons.add),onPressed: ()=>setState(()=>_itemCount++)))

                ],
              ),
            ),

            Container(

              height: 110,
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ListView.builder(

                scrollDirection: Axis.horizontal,
                itemCount: widget.ll['IMAGE'].length, // Replace with the number of items in the first nested list
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {

                      setState(() {
                        imagepostion=index;
                      });
                    },
                    child: Container(
                      height: 70,
                      width: 70,
                      margin: EdgeInsets.fromLTRB(8, 20, 6, 0),
                     decoration: BoxDecoration(
                       border: Border.all(style: BorderStyle.solid, width: 2, color: Color(0xff6b7f93)),
                       color: Colors.blueGrey.shade50,
borderRadius: BorderRadius.circular(20)
                     ),
                      child: Image(image: NetworkImage('https://himanshi85.000webhostapp.com/ecommerce/${widget.ll['IMAGE'][index]}'), fit: BoxFit.fill),
                    ),
                  );
                },
              ),
            ),


            Row(
              children: [
                InkWell(

                  onTap: () async {

                    setState(() {
                      numberr=int.parse(widget.ll['PRICE']);
                      sum=_itemCount*numberr;
                    });
                    Map map=
                    {
                      "productcategory":widget.ll['CATOGORYNAME'],
                      "productid":widget.ll['PRODUCTID'],
                      "catogoryid":widget.ll['CATEGORYID'],
                      "userid":widget.ll['USERID'],
                      "productname":widget.ll['PRODUCTNAME'],
                      "productdescription":widget.ll['DESCRIPTION'],
                      "productprice":sum.toString(),
                      "productsellprice":widget.ll['SELLPRICE'],
                      "productwarrenty":widget.ll['WARRENTY'],
                      "warrentycondition":widget.ll['WARRENTYCONDI'],
                      "refundpolicy":widget.ll['REFUNDPOLICY'],
                      "image":"${widget.ll['IMAGE']}",
                      "imagelength":"${widget.ll['IMAGE'].length}"

                    };

                    var url = Uri.parse('https://himanshi85.000webhostapp.com/ecommerce/cartinsert.php');
                    var response = await http.post(url, body: map);
                    print('Response status: ${response.statusCode}');
                    print('Response body: ${response.body}');

                  var mapp = jsonDecode(response.body);
                    Autogenerated aa=Autogenerated.fromJson(mapp);
                    if(aa.selectresult==0){
                      EasyLoading.showError('Already in cart');
                    }
                    else{
                      EasyLoading.showSuccess('Sucessfully Added into cart');
                    }



                  },
                  child: Container(

                      margin: EdgeInsets.fromLTRB(20, 80, 0, 0),
                      height: 45,
                      width: 50,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(border: Border.all(color: Color(0xff6b7f93), width: 2, style: BorderStyle.solid,), borderRadius: BorderRadius.circular(10)),
                      child:Image(image: AssetImage("image/img_25.png"), height: 34,  color: Color(0xff6b7f93),)
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 100, 10, 20),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xff6b7f93),
                          padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                          fixedSize: Size(320, 55),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onPressed: () async {




                        setState(() {
                          numberr=int.parse(widget.ll['PRICE']);
                          sum=_itemCount*numberr;


                          var options = {
                            'key': 'rzp_test_n9RqZw75KngniJ',
                            'amount': sum,
                            'name': widget.ll['PRODUCTNAME'],
                            'description': widget.ll['DESCRIPTION'],
                            'prefill': {
                              'contact': '8888888888',
                              'email': 'test@razorpay.com'
                            }
                          };

                          rpay.open(options);
                        });
                      },
                      child: Text(
                        "BUY NOW",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      )),
                ),
              ],
            ),
          ],


        ),

      ),
    ),
    // Container between the two half-height containers
    Positioned(
      top: MediaQuery.of(context).size.height / 2 - 250,
      left: MediaQuery.of(context).size.width / 2 - 70,

      width: 250,
      height: 230,

      child: Container(
        decoration: BoxDecoration(color: Colors.transparent),
       child: Image(image: NetworkImage('https://himanshi85.000webhostapp.com/ecommerce/${widget.ll['IMAGE'][imagepostion]}'), width: 200, height:200 ,fit: BoxFit.fill),
      ),
    ),
  ],
),

    );
  }
}
class Autogenerated {
  int? connection;
  int? selectresult;

  Autogenerated({this.connection, this.selectresult});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    connection = json['connection'];
    selectresult = json['selectresult'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['connection'] = this.connection;
    data['selectresult'] = this.selectresult;
    return data;
  }
}
