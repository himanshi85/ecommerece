import 'package:ecommerece/viewproduct.dart';
import 'package:flutter/material.dart';

class vieww extends StatefulWidget {
  Map ll;
  vieww(this.ll);



  @override
  State<vieww> createState() => _viewwState();
}

class _viewwState extends State<vieww> {
  String productname="";
  String uppercase="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productname=widget.ll['PRODUCTNAME'];
    uppercase=productname.toUpperCase();

  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:
            Column(
              children: [
                Row(

                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 45,
                      width: 45,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.white54,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.grey.shade400, width: 2)),
                      child: Icon(Icons.arrow_back_ios, size: 25),
                    ),
                    Container(
                        margin: EdgeInsets.fromLTRB(274, 10, 10, 10),
                        height: 45,
                        width: 45,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(color: Colors.white54,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Colors.grey.shade400, width: 2)),
                        child: Image(image: AssetImage("image/img_23.png"),
                          color: Colors.black87,)
                    )

                  ],


                ),
                Stack(
                  children: [
                    Container(
                      height:300,
                      width: 300,
                      margin: EdgeInsets.fromLTRB(60, 20, 60, 0),
                      child: Image(image: NetworkImage("https://himanshi85.000webhostapp.com/ecommerce/${widget.ll['IMAGE']}"), fit: BoxFit.fill),

                    ),
                    Positioned(
                     top: 100,
                      child: Container(

                        decoration: BoxDecoration(color: Color(0xffeaedf0),borderRadius: BorderRadius.circular(50), ),
                        height: 426,

                        child: ListView(
                          children: [
                            Row(children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                                child: Text("${uppercase}", style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold, color: Color(0xFF2B4865) )),



                              ),
                              Row(
                                children: [
                                  Container(
                                      margin: EdgeInsets.fromLTRB(180, 20, 0, 0),
                                      child: Image(
                                        image: AssetImage("image/img_8.png"),
                                        height: 25,
                                        color: Color(0xFF2B4865),
                                      )),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                    child: Text(
                                        "${widget.ll['PRICE']}",
                                        style: TextStyle(
                                            color: Color(0xFF2B4865),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 23)),
                                  )
                                ],
                              )
                            ],)

                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),






      ),
    );
  }
}
