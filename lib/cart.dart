import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class cartt extends StatefulWidget {
  const cartt({Key? key}) : super(key: key);

  @override
  State<cartt> createState() => _carttState();
}

class _carttState extends State<cartt> {
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





    );
  }
}
