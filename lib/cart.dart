import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class cartt extends StatefulWidget {
  const cartt({Key? key}) : super(key: key);

  @override
  State<cartt> createState() => _carttState();
}

class _carttState extends State<cartt> {
  int _itemCount=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xff6b7f93), // Replace with your desired color
    ));
  }
  Widget build(BuildContext context) {
    return Scaffold(
    body: Container(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(15),
          //height: 160,
          decoration: BoxDecoration(color: Colors.blueGrey.shade100, borderRadius: BorderRadius.circular(20)),
          child:Row(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                // padding:EdgeInsets.fromLTRB(10, 30, 40, 100),
                height: 130,
                width: 100,
               decoration: BoxDecoration( image: DecorationImage(image: AssetImage("image/watch1-removebg-preview (1).png", ), fit: BoxFit.fill)),
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Text("casio", style: TextStyle(color: Colors.black87, fontSize: 26, fontWeight: FontWeight.bold)),
                        ),

                        Container(
                          margin: EdgeInsets.fromLTRB(60, 0, 0, 0),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Text("casio mklqwfj ", style: TextStyle(color: Colors.black87, fontSize: 20)),
                    ),

                    Row(
                      children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                        child: Text("20000", style: TextStyle(fontSize: 20, )),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(10, 20, 0, 0),

                          child: Expanded(
                            child: Row(
                              children: <Widget>[

                                _itemCount!=0? Container(
                                    // height: 39,
                                    margin: EdgeInsets.all(8),
                                    // width: 40,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.blueGrey.shade200),
                                    child: IconButton(icon:  Icon(Icons.remove),onPressed: ()=>setState(()=>_itemCount--),)):Container(),
                                Container(
                                    margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                    child: Text(_itemCount.toString())),
                                Container(
                                    // height: 39,
                                    // width: 40,
                                  margin: EdgeInsets.all(8),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.blueGrey.shade200),

                                    child: IconButton(icon: Icon(Icons.add),onPressed: ()=>setState(()=>_itemCount++)))

                              ],
                            ),
                          ),
                        ),
                      ),
                    ],)
                  ],
                ),
              )
            ],
          )
        );
      },),
    ),




    );
  }
}
