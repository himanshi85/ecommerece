import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

import 'basicinfo.dart';

class pass extends StatefulWidget {
  const pass({Key? key}) : super(key: key);
 static TextEditingController password=TextEditingController();
  @override
  State<pass> createState() => _passState();
}

class _passState extends State<pass> {

  TextEditingController password1=TextEditingController();

  bool satusp=false;
  bool satusp1=false;
  bool invisible=true;
  bool invisible1=true;


  String p="";
  String p1="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0Xff3d6a8a), // Replace with your desired color
    ));
  }
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    height = height-keyboardHeight;
    print("=========$keyboardHeight");
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle().copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent));

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage("image/Untitled design (3).png"), fit: BoxFit.fill)),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, height*0.073, 0, 0),
                child:   AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText('SET',
                        textStyle: const TextStyle(
                            color: Color(0xFF2B4865),
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                        )),
                    TyperAnimatedText('PASSWORD',
                        textStyle: const TextStyle(
                            color: Color(0xFF2B4865),
                            fontSize: 30, fontWeight: FontWeight.bold)),
                  ],
                  onTap: () {
                    print("I am executing");
                  },
                ),
              ),

              Container(
                margin: EdgeInsets.all(30),
                height:height*0.3082,

                child: Lottie.asset("anima/i3edokBQI5.json"),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [


                    Container(
                      height: 63,

                      width: double.infinity,
                      margin: EdgeInsets.fromLTRB(30, 10, 30, 10),

                      //margin: EdgeInsets.only(left: 20,right: 20),
                      child: TextField(
                        obscureText: invisible,
                        style: TextStyle(fontSize: 20, color: Colors.black),
                        decoration: InputDecoration(
                          errorText: satusp ? p : null,
                            filled: true,
                            fillColor: Colors.grey.shade300,
                            prefixIcon: Icon(Icons.lock_clock_rounded,
                                size: 30, color: Color(0xFF2B4865)),
                            suffix:

                            invisible?
                            Container(
                            margin: EdgeInsets.fromLTRB(0, 35, 0, 0),
                        child: IconButton(onPressed: () {
                          setState(() {
                            invisible=false;

                          });
                        }, icon: Icon(Icons.visibility_off,
                        )),
                      ): Container(
                    margin: EdgeInsets.fromLTRB(0, 35, 0, 0),

                child: IconButton(onPressed: () {
                  setState(() {
                    invisible=true;

                  });
                }, icon: Icon(Icons.visibility,
                )),
              ),
                            border:OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                            hintText: " Password",
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Color(0xFF2B4865))),
                            enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(20), borderSide: BorderSide(color: Color(0xFF2B4865))),
                            hintStyle:
                            TextStyle(color: Color(0xFF2B4865), fontSize: 23)),

                        textInputAction: TextInputAction.next,
                        //autofocus: true,
                        controller: pass.password,
                        onTap: () {
                          setState(() {
                            satusp=false;
                          });

                        },
                      ),
                    ),
                    Container(
                      height: 64,

                      width: double.infinity,
                      margin: EdgeInsets.fromLTRB(30, 20, 30, 10),
                      //margin: EdgeInsets.only(left: 20,right: 20),
                      child: Focus(

                        child: TextField(
                          obscureText: invisible1,
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey.shade300,
                              errorText: satusp1 ? p1 : null,
                              prefixIcon: Icon(Icons.lock,
                                  size: 30, color: Color(0xFF2B4865)),
                             suffix:

                              invisible1?
                              Container(
                              margin: EdgeInsets.fromLTRB(0, 35, 0, 0),
                          child: IconButton(onPressed: () {
                            setState(() {
                              invisible1=false;

                            });
                          }, icon: Icon(Icons.visibility_off,
                          )),
                        ): Container(
                          margin: EdgeInsets.fromLTRB(0, 35, 0, 0),

                      child: IconButton(onPressed: () {
                        setState(() {
                          invisible1=true;

                        });
                      }, icon: Icon(Icons.visibility,
                      )),
                    ),
                              border:OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                              hintText: "Confirm password",
                              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Color(0xFF2B4865))),
                              enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(20), borderSide: BorderSide(color: Color(0xFF2B4865))),
                              hintStyle:
                              TextStyle(color: Color(0xFF2B4865), fontSize: 23)),
                          textInputAction: TextInputAction.next,
                          //autofocus: true,
                          controller: password1,
                          onTap: () {
                            setState(() {
                              satusp1=false;
                            });

                          },
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.fromLTRB(8, 20, 10, 0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color(0Xff3d6a8a),
                              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                              fixedSize: Size(350, 60),

                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                          ),



                          onPressed: () {
                           setState(() {
                             satusp=false;
                             satusp1=false;
                              RegExp passregex = RegExp(
                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');

                             if (pass.password.text.isEmpty) {
                               satusp = true;
                               p = "please enter the password";
                             } else if (!passregex.hasMatch(pass.password.text)) {
                               satusp = true;
                               p = "please enter the valid password";
                             }

                             if (password1.text.isEmpty) {
                               satusp1 = true;
                               p1 = "please enter the confirm  password";

                             }

                             if(satusp1==false&& satusp==false) {
                               if (pass.password.text != password1.text) {
                                 ScaffoldMessenger.of(context).showSnackBar(
                                     SnackBar(
                                         content: Text("password not match")));
                               }

                                 if(pass.password.text == password1.text)
                                 Navigator.pushReplacement(context,
                                     MaterialPageRoute(builder: (context) {
                                       return basic();
                                     },));

                             }
                           });

                          },
                          child: Text(
                            "Set password",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          )),
                    ),

                  ],
                ),
              )
            ],
          ),
        ),




      ),
    );
  }
}
