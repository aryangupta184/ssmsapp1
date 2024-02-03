import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:ssmsapp1/presentation/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ssmsapp1/utils.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:lottie/lottie.dart';
import 'package:ssmsapp1/resources/auth_methods.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:intl/intl.dart';
import 'package:ssmsapp1/presentation/profile.dart';
import 'dart:ui';
import 'package:csv/csv.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'package:ssmsapp1/utils.dart';

import 'package:ssmsapp1/resources/auth_methods.dart';
import 'package:ssmsapp1/presentation/signup_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ssmsapp1/presentation/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ssmsapp1/utils.dart';
import 'package:ssmsapp1/resources/auth_methods.dart';
import 'package:qr_flutter/qr_flutter.dart';
Widget card(String name, String title, BuildContext context) {
  return Card(
    color: Color(0x10FFFFFF),
    elevation: 8,
    margin: EdgeInsets.all(2.0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),

    child: Container(
      margin: EdgeInsets.symmetric(vertical:4,horizontal: 6),
      padding:EdgeInsets.symmetric(vertical:6,horizontal: 4),
      child:Row(
        children: [

          Expanded(
            flex: 1,
            child: AutoSizeText(
              name,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              maxLines: 1, // Limit the text to 2 lines

               // Handle overflow with ellipsis
            ),
            // child: Text(
            //   name,
            //   style: TextStyle(
            //     fontSize: 20.0,
            //     color: Colors.white,
            //     fontWeight: FontWeight.w700,
            //   ),
            // ),
          ),
          Expanded(
            flex: 1,

            child:
            Align(
              alignment: Alignment.centerRight,
              child: AutoSizeText(
                title,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.greenAccent,
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 1, // Limit the text to 2 lines

                // Handle overflow with ellipsis
              ),
            )
          ),


        ],
      ) ,
    )

  );
}

class _TodoPopupCard extends StatelessWidget {
  List<String> title = ['President, SSMS', 'Secretary, SSMS', 'Treasurer, SSMS',
    'RB Mess Rep', 'CVR Mess Rep', 'MR Mess Rep', 'SR Mess Rep', 'KG Mess Rep',
    'SV Mess Rep', 'Malviya Mess Rep', 'AK-RP-VK Mess Rep', 'AMC', 'AMC',
    'AMC', 'AMC'];
  List<String> name = ['Tarun Kaswan', 'Puru Gupta', 'Rishabh Malik', 'Udbhav Awasthi',
    'Hardik Gupta', 'Himangi Rajvanshi', 'Prateek Tyagi', 'Parver Chhabra', 'Tarun Kaswan', 'Aman Chauhan',
    'Akshat Agrawal', 'Rishabh Malik',
    'Divyanshi Jena', 'Puru Gupta', 'Rahulraj Jhawar'];
  List<String> title2 =['App ','Backend', 'UI UX'];
  List<String> name2 =['Aryan Gupta','Arshit Choudhary','Shubh Singhvi'];



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        borderRadius: BorderRadius.circular(16),
        color: Colors.black,
        child: SizedBox(
          child: Padding(

            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(

                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      " Developed By",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 32, color: Colors.white),

                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    height: 160,
                    child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return card(name2[index], title2[index], context);
                      },
                    ),
                  ),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      " GC Members",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 32, color: Colors.white),

                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    height: 400,
                    child: ListView.builder(
                      itemCount: 15,
                      itemBuilder: (BuildContext context, int index) {
                        return card(name[index], title[index], context);
                      },
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  getCurrentUsername() {
    if (_auth.currentUser!.displayName != null) {
      return _auth.currentUser!.displayName!.toString();
    }
  }

  getCurrentEmail() {
    if (_auth.currentUser!.email != null) {
      return _auth.currentUser!.email!.toString();
    }
  }

  getProfileImage() {
    return Image.network(
      _auth.currentUser!.photoURL.toString(),
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Material(
        child: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Container(
          // profileLru (0:533)
          padding: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0 * fem),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xff0D0D0D),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 200,
                child: Stack(
                  children: [
                    Positioned(
                        // patternk4h (0:9371)
                        left: 0 * fem,
                        top: 0 * fem,
                        child: Image.asset(
                          'assets/images/pattern-bg2.png',
                          fit: BoxFit.fitWidth,
                          width: 375 * fem,
                          height: 812 * fem,
                        )),
                    Positioned(
                      top: 60,
                      left: 130,
                      child: Container(
                          height: 130,
                          width: 130,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Color(0xff53E88B), width: 3),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: EdgeInsets.all(10),
                          child: getProfileImage()),
                    )
                  ],
                ),
              ),
              Container(
                // autogroupcg2uiMf (HqNr5u9ATaSyCpGeFiCg2u)
                width: 400 * fem,
                height: 120 * fem,
                child: Stack(
                  children: [
                    Positioned(
                      // textSgy (0:537)
                      left: 20 * fem,
                      top: 40 * fem,
                      child: Container(
                        width: 400 * fem,
                        height: 100 * fem,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // samplenameN4q (0:538)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 0 * fem, 3 * fem),
                              child: Text(
                                getCurrentUsername(),
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 27 * ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.3102272881 * ffem / fem,
                                  color: Color(0xffFFFFFF),
                                ),
                              ),
                            ),
                            Container(
                              // emailsampleTc5 (0:539)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 0 * fem, 20 * fem),
                              child: Text(
                                getCurrentEmail(),
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 16 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5 * ffem / fem,
                                  letterSpacing: 0.5 * fem,
                                  color: Color(0xffFFFFFF).withOpacity(0.5),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 550,
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Center(
                        child: InkWell(
                      onTap: () async {
                        await FirebaseServices().signOut();
                        await AuthMethods().signOut();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ));
                      },
                      child: Container(
                          height: 50,
                          width: 140,
                          alignment: Alignment.center,
                          padding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0xff53E88B),
                                Color(0xff15BE77)
                              ]),
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Center(
                                  child: Text(
                                    "Sign Out",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child:
                                    Icon(Icons.logout, color: Colors.black38),
                              ),
                            ],
                          )),
                    )),
                    SizedBox(
                      height: 250,
                    ),
                    Container(
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => Center(
                              child: _TodoPopupCard(),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'Made with',
                                  style: TextStyle(
                                      color: Color(0xffFFFFFF).withOpacity(0.5),
                                      fontSize: 24),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Lottie.asset(
                                'assets/images/heart.json',
                                repeat: true,
                                reverse: true,
                                animate: true,
                              ),
                            ),
                            Expanded(
                                flex: 3,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'by SSMS',
                                    style: TextStyle(
                                        color:
                                            Color(0xffFFFFFF).withOpacity(0.5),
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
