import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:ssmsapp1/presentation/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ssmsapp1/utils.dart';
import 'package:ssmsapp1/resources/auth_methods.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ProfileScreen extends StatelessWidget {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  getCurrentUsername(){
    if (_auth.currentUser!.displayName!=null){
      return _auth.currentUser!.displayName!.toString();

    }
  }
  getCurrentEmail(){
    if (_auth.currentUser!.email!=null){
      return _auth.currentUser!.email!.toString();

    }
  }

  @override
  Widget build(BuildContext context) {


    double baseWidth = 375;
    double fem =  MediaQuery.of(context).size.width/ baseWidth;
    double ffem = fem * 0.97;
    return Material(
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Container(
            // profileLru (0:533)
            padding: EdgeInsets.fromLTRB(0*fem, 60*fem, 0*fem, 0*fem),
            width: double.infinity,
            decoration: BoxDecoration (
              color: Color(0xff0c0c0c),

            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepPurpleAccent),
                    borderRadius: BorderRadius.circular(16)
                  ),
                  padding: EdgeInsets.all(10),
                  child: QrImageView(
                    data: getCurrentUsername(),
                    size: 270,
                    backgroundColor: Colors.white,
                  ),
                ),


                Container(
                  // autogroupcg2uiMf (HqNr5u9ATaSyCpGeFiCg2u)
                  width: 376*fem,
                  height: 450*fem,
                  child: Stack(
                    children: [

                      Positioned(
                        // textSgy (0:537)
                        left: 20*fem,
                        top: 50*fem,
                        child: Container(
                          width: 243*fem,
                          height: 186*fem,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // samplenameN4q (0:538)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 3*fem),
                                child: Text(
                                getCurrentUsername(),
                                  style: SafeGoogleFont (
                                    'Inter',
                                    fontSize: 27*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.3102272881*ffem/fem,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                              Container(
                                // emailsampleTc5 (0:539)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 20*fem),
                                child: Text(
                                  getCurrentEmail(),
                                  style: SafeGoogleFont (
                                    'Inter',
                                    fontSize: 14*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.5*ffem/fem,
                                    letterSpacing: 0.5*fem,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.fromLTRB(11*fem, 12*fem, 11*fem, 8*fem),
                                  width: 347*fem,
                                  height: 64*fem,
                                  decoration: BoxDecoration (
                                    border: Border.all(color: Colors.deepPurpleAccent),
                                    color: Color(0xff252525),
                                    borderRadius: BorderRadius.circular(15*fem),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x7f010107),
                                        offset: Offset(0*fem, 0*fem),
                                        blurRadius: 25*fem,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // voucherosX (0:591)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
                                        child: Text(
                                          'ID',
                                          style: SafeGoogleFont (
                                            'Inter',
                                            fontSize: 15*ffem,
                                            fontWeight: FontWeight.w500,
                                            height: 1.3102273305*ffem/fem,
                                            color: Color(0xffffffff),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        // voucherL6m (0:590)
                                        'Bhawan and Room',
                                        style: SafeGoogleFont (
                                          'Inter',
                                          fontSize: 15*ffem,
                                          fontWeight: FontWeight.w500,
                                          height: 1.3102273305*ffem/fem,
                                          color: Color(0xffffffff),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              const SizedBox(height: 20,),
                              Text(
                                // thismonthsorderswn9 (0:540)
                                'This Month’s Orders',
                                style: SafeGoogleFont (
                                  'Inter',
                                  fontSize: 15*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.3102273305*ffem/fem,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        // menu1GJd (0:542)
                        left: 14*fem,
                        top: 250*fem,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(14*fem, 19*fem, 17*fem, 13*fem),
                          width: 347*fem,
                          height: 103*fem,
                          decoration: BoxDecoration (
                            border: Border.all(color: Colors.deepPurpleAccent),
                            color: Color(0xff252525),
                            borderRadius: BorderRadius.circular(15*fem),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x7f010107),
                                offset: Offset(0*fem, 0*fem),
                                blurRadius: 25*fem,
                              ),
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // photomenuHzR (0:547)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 17.45*fem, 5*fem),
                                width: 62*fem,
                                height: 62*fem,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16*fem),
                                  child: Image.asset(
                                    'assets/images/photo-paneer.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                // autogroupv4p9Cbb (HqNrRPagrxQi3RTzH2v4p9)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 36.55*fem, 0*fem),
                                height: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      // menunamejLd (0:544)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
                                      child: Text(
                                        'Item',
                                        style: SafeGoogleFont (
                                          'Inter',
                                          fontSize: 15*ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.3102273305*ffem/fem,
                                          color: Color(0xffffffff),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // resaturantnameqPf (0:545)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 5*fem),
                                      child: Text(
                                        'Meal, Date',
                                        style: SafeGoogleFont (
                                          'Inter',
                                          fontSize: 14*ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.2125*ffem/fem,
                                          letterSpacing: 0.5*fem,
                                          color: Color(0xffffffff),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // priece99T (0:546)
                                      margin: EdgeInsets.fromLTRB(0.45*fem, 0*fem, 0*fem, 0*fem),
                                      child: Text(
                                        'Rs. Cost',
                                        style: SafeGoogleFont (
                                          'Inter',
                                          fontSize: 19*ffem,
                                          color: Colors.deepPurpleAccent,
                                          fontWeight: FontWeight.w400,
                                            height: 1*ffem/fem,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),



                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )

      );


  }
}