import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;


class dure extends StatefulWidget {
  const dure({Key? key}) : super(key: key);

  @override
  State<dure> createState() => _dureState();
}

class _dureState extends State<dure> {
  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController number =TextEditingController();
  TextEditingController password=TextEditingController();
  String imagepath="";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Column(children: [

          InkWell(
            onTap: () {
              final ImagePicker picker = ImagePicker();

              showDialog(context: context, builder: (context) {
                return Material(
                  color: Colors.transparent,

                  child: Container(
                    height: 40,
                    width: 100,
                    margin: EdgeInsets.fromLTRB(70, 350, 70, 320),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(20),
                      color: Colors.blueGrey,
                    ),

                    child: Row(
                      children: [
                        IconButton(onPressed: () async {
                        Navigator.pop(context);

// Pick an image.

// Capture a photo.
                          final XFile? photo = await picker.pickImage(source: ImageSource.camera, imageQuality: 30);

                          setState(() {
                            imagepath=photo!.path;
                          });
                        }, icon: Icon(Icons.camera, size: 40,)),
                        IconButton(onPressed: () async {
                          Navigator.pop(context);
                          final XFile? image = await picker.pickImage(source: ImageSource.gallery, imageQuality: 30);
                          setState(() {
                            imagepath=image!.path;
                          });
                        }, icon: Icon(Icons.photo, size: 40,))
                      ],
                    ),
                  ),
                );
              },);
            },
            child: imagepath!=""?CircleAvatar(maxRadius: 88,
backgroundImage: FileImage(File(imagepath)),

            ):CircularProgressIndicator()
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: TextField(
              controller: name,),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: TextField(
              controller: email,),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: TextField(
              controller: number,),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: TextField(
              controller: password,),
          ),

          ElevatedButton(onPressed: () async {
             List<int> imagebyte=File(imagepath).readAsBytesSync();
             String imagedata=base64Encode(imagebyte);
               Map map={
                 "name":name.text,
                 "email":email.text,
                 "number":number.text,
                 "password":password.text,
                 "image":imagedata,



               };

             var url = Uri.parse('https://himanshi85.000webhostapp.com/ecommerce/register.php');
             var response = await http.post(url, body: map);
             print('Response status: ${response.statusCode}');
             print('Response body: ${response.body}');





          }, child: Text("Signup"))
        ]),
      ),
    );
  }
}
