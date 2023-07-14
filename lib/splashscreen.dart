import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerece/home.dart';
import 'package:ecommerece/loginn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static  SharedPreferences? pref;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool satus=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forpreference();
    forInternetConnectivity();


    // Mynet();
  }

  Future<void> forInternetConnectivity() async {
    setState(() {
      Connectivity().checkConnectivity().then((value) {
        if (value != ConnectivityResult.none) {
          forNavigation();
        } else {
          setState(() {
            showDialog(
              useSafeArea: true,
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: Colors.white,
                  title: Text("No Internet Connection :("),
                  icon: Icon(Icons.network_check_sharp),
                  elevation: 50,
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return SplashScreen();
                            },
                          ));
                        },
                        child: Text("Retry")),
                    TextButton(
                        onPressed: () {
                          SystemNavigator.pop();
                        },
                        child: Text("Close App")),
                  ],
                );
              },
            );
          });
        }
      });

    });
    // await Future.delayed(Duration(seconds: 1));
    // // if(connectivityResult == ConnectivityResult.none) {
    // forInternetConnectivity();
  }

  void forNavigation() {
    Future.delayed(Duration(seconds: 3)).then((value) {
if(satus){
  Navigator.pushReplacement(context, MaterialPageRoute(
    builder: (context) {
      return hommm();
    },
  ));
}
else{
  Navigator.pushReplacement(context, MaterialPageRoute(
    builder: (context) {
      return lll();
    },
  ));
}

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 130, 0, 0),

              child: Lottie.asset("anima/5mgMrAauWU.json")),
          Container(
            child: AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText('HP',
                    textStyle: const TextStyle(
                        color: Color(0Xff2B4865),
                        fontSize: 45,

                   )),
                TyperAnimatedText("Shoping",
                    
                    textStyle: const TextStyle(
                      color: Color((0Xff2B4865)),
                        fontSize: 45, )),
              ],
              onTap: () {
                print("I am executing");
              },
              repeatForever: true,
            ),

          ),
          // Container(
          //     margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
          //      height: 160,
          //
          //     child: Lottie.asset("anima/97930-loading (1).json")),

        ],
      ),
    );
  }
  Future<void> forpreference() async {
    SplashScreen.pref = await SharedPreferences.getInstance();
    setState(() {
      satus = SplashScreen.pref!.getBool("loginsatus")??false;
    });


  }



}