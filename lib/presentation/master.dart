import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:intl/intl.dart';
import 'package:ssmsapp1/presentation/cart.dart';
import 'package:ssmsapp1/presentation/home_screen.dart';
import 'package:ssmsapp1/presentation/profile.dart';
import 'package:ssmsapp1/resources/menu.dart';
import 'dart:ui';
import 'package:csv/csv.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'package:ssmsapp1/utils.dart';

import 'package:ssmsapp1/resources/auth_methods.dart';
import 'package:ssmsapp1/presentation/signup_screen.dart';

class MasterScreen extends StatefulWidget {
  const MasterScreen({Key? key}) : super(key: key);

  @override
  State<MasterScreen> createState() => _MasterScreenState();
}

class _MasterScreenState extends State<MasterScreen> {
  @override
  void initState() {
    super.initState();
  }
  int _currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: Colors.black,
      body: getBody(),
      bottomNavigationBar: Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Color(0xff252525),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
            child: GNav(
              rippleColor: Colors.deepPurpleAccent.withOpacity(0.1),
              hoverColor: Colors.deepPurpleAccent.withOpacity(0.1),
              iconSize: 30,
              curve: Curves.easeInExpo,
              tabBorderRadius: 16,
              color: Colors.deepPurpleAccent,
              activeColor: Colors.white,
              tabBackgroundColor: Color(0x336256BF),
              gap: 20,
              padding: EdgeInsets.all(10),
              onTabChange: (index){
               setState(() {
                 _currentIndex=index;
               });
              },
              tabs: [

                GButton(
                  icon: Icons.home_filled,
                  iconColor: Colors.deepPurpleAccent,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.person,
                  iconColor: Colors.deepPurpleAccent,
                  text: 'Profile',
                ),
                GButton(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.deepPurpleAccent,
                  text: 'Cart',
                ),

                GButton(
                  icon: Icons.fastfood,
                  iconColor: Colors.deepPurpleAccent,
                  text: 'Grub',
                ),
              ],
            ),
          )),
    );
  }
  Widget getBody() {
    List<Widget> pages = [
      HomeScreen(),
      ProfileScreen(),
      CartScreen(),

    ];
    return IndexedStack(
      index: _currentIndex,
      children: pages,
    );
  }

}
