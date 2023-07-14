import 'dart:io';

import 'package:ecommerece/loginn.dart';
import 'package:ecommerece/splashscreen.dart';
import 'package:ecommerece/uploadproduct.dart';
import 'package:ecommerece/viewproduct.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';

class hommm extends StatefulWidget {
  const hommm({Key? key}) : super(key: key);

  @override
  State<hommm> createState() => _hommmState();
}

class _hommmState extends State<hommm> {
  int _currentIndex = 0;
  String ProfilePhoto = "";
  String name = "";
  String email = "";
  String password = "";
  String mobilenumber = "";
  String address = "";
  bool heart = true;
  int cnt=0;

  List<Widget> lllll=[
    viewproduct(),uploadp(),
  ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getpreference();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFF2B4865), // Replace with your desired color
    ));
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF2b4a61),
          centerTitle: true,
          // actions: [
          //   InkWell(
          //
          //     child: Container(
          //       margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
          //       child: Image.asset(
          //         width: 50,
          //         "images/img_12.png",
          //         color: Colors.grey,
          //       ),
          //     ),
          //   )
          // ],
        ),

        // _getPage(_currentIndex),
        body: lllll[cnt],

        drawer: Drawer(
          width: 280,
          backgroundColor: Colors.white,
          child:
          Column(
            children: [
              Container(


                child:
                UserAccountsDrawerHeader(currentAccountPicture: Container(
                  width: 230,
                  child: CircleAvatar(
                  maxRadius: 88,

                    backgroundImage: NetworkImage("https://himanshi85.000webhostapp.com/ecommerce/${ProfilePhoto}"),
                  ),
                ),decoration: BoxDecoration(color:  Color(0Xff2b4a61),),accountName: Text("${name}", style: TextStyle(color: Colors.white, fontSize: 20)), accountEmail: Text("${email}", style: TextStyle(color: Colors.white, fontSize: 16),))

              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Color(0xFF2B4865),
                    size: 30,
                  ),
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  tileColor: Colors.transparent,
                  selectedColor: Colors.transparent,
                  textColor: Colors.transparent,
                  trailing: Container(
                    margin: EdgeInsets.fromLTRB(0, 5, 134, 0),
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Home",
                          style: TextStyle(
                            color: Color(0xFF2B4865),
                            fontSize: 21,
                          ),
                        )),
                  ),
                ),
              ),
              ListTile(
                leading: Image.asset(
                  "image/img_3.png",
                  height: 24,
                  color: Color(0xFF2B4865),
                ),
                trailing: Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 19, 0),
                  child: TextButton(
                      onPressed: () {

                        setState(() {
                          cnt=1;
                        });
                      },
                      child: Text(
                        "My upload product",
                        style:
                        TextStyle(color: Color(0xFF2B4865), fontSize: 21),
                      )),
                ),
              ),
              ListTile(
                leading: Image.asset("image/img_4.png",
                    height: 27, color: Color(0xFF2B4865)),
                trailing: Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 120, 0),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "My cart",
                        style:
                        TextStyle(color: Color(0xFF2B4865), fontSize: 21),
                      )),
                ),
              ),
              ListTile(
                leading: Image.asset(
                  "image/img_5.png",
                  height: 27,
                  color: Color(0xFF2B4865),
                ),
                trailing: Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 65, 0),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "My favourites",
                        style:
                        TextStyle(color: Color(0xFF2B4865), fontSize: 21),
                      )),
                ),
              ),
              ListTile(
                leading: Image.asset(
                  "image/img_12.png",
                  height: 27,
                  color: Color(0xFF2B4865),
                ),
                trailing: Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 85, 0),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          cnt=0;
                        });
                      },
                      child: Text(
                        "Viewproduct",
                        style:
                        TextStyle(color: Color(0xFF2B4865), fontSize: 21),
                      )),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.people_alt_outlined,
                  color: Color(0xFF2B4865),
                  size: 30,
                ),
                trailing: Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 130, 0),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Profile",
                        style:
                        TextStyle(color: Color(0xFF2B4865), fontSize: 21),
                      )),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Color(0xFF2B4865),
                  size: 30,
                ),
                trailing: Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 120, 0),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Settings",
                        style:
                        TextStyle(color: Color(0xFF2B4865), fontSize: 21),
                      )),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.lock,
                  color: Color(0xFF2B4865),
                  size: 30,
                ),
                trailing: Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 120, 0),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Log out",
                        style:
                        TextStyle(color: Color(0xFF2B4865), fontSize: 21),
                      )),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFF2B4865),
          elevation: 50,
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 33,
                ),
                label: 'Home',
                backgroundColor: Color(0xFF2B4865)),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
                size: 33,
              ),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.white,
                size: 33,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: Colors.white,
                size: 33,
              ),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.white,
                size: 33,
              ),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return HomeScreen();
      case 1:
        return CartScreen();
      case 2:
        return SearchScreen();
      case 3:
        return FavoritesScreen();
      case 4:
        return AccountScreen();
      default:
        return Container();
    }
  }

  void getpreference() {
    setState(() {
      ProfilePhoto = SplashScreen.pref!.getString("profile") ?? '';
      name = SplashScreen.pref!.getString("name") ?? '';
      email = SplashScreen.pref!.getString("email") ?? '';
      password = SplashScreen.pref!.getString("password") ?? '';
      address = SplashScreen.pref!.getString("address") ?? '';
      mobilenumber = SplashScreen.pref!.getString("number") ?? '';
    });
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home Screen'),
    );
  }
}

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Cart Screen'),
    );
  }
}

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Search Screen'),
    );
  }
}

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Favorites Screen'),
    );
  }
}

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Account Screen'),
    );
  }
}
