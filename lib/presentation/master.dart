import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:intl/intl.dart';
import 'package:ssmsapp1/presentation/grub.dart';
import 'package:ssmsapp1/presentation/complaint.dart';
import 'package:ssmsapp1/presentation/home_screen.dart';
import 'package:ssmsapp1/presentation/profile.dart';
import 'package:ssmsapp1/presentation/test2.dart';
import 'dart:ui';
import 'package:ssmsapp1/utils.dart';

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
  int _currentIndex = 0;


  @override
  void initState() {
    super.initState();

  }
  @override
  void dispose() {
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: Color(0xffFFEEDD),
      body: getBody(),
      bottomNavigationBar: Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Color(0xffFEC584),
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
              color: Color(0x80FEC584),
              activeColor: Color(0xffe47517),
              tabBackgroundColor: Color(0x30DF6F20),
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
                  iconColor: Color(0x80634831),
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.person,
                  iconColor: Color(0x80634831),
                  text: 'Profile',
                ),
                GButton(
                  icon: Icons.fastfood,
                  iconColor: Color(0x80634831),
                  text: 'Grub',
                ),

                GButton(
                  icon: Icons.chat_bubble,
                  iconColor: Color(0x80634831),
                  text: 'Complain',
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
      GrubScreen(),
      ComplaintScreen()

    ];
    return IndexedStack(
      index: _currentIndex,
      children: pages,
    );
  }

}
