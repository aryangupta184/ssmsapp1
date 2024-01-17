import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:ssmsapp1/utils.dart';
import 'package:ssmsapp1/routes/app_routes.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Material(
        child: Container(
        width: double.infinity,
        child: Container(

          width: double.infinity,
          height: 812*fem,
          decoration: BoxDecoration (
            color: Color(0xff0D0D0D),

          ),
          child: Stack(
            children: [
              Positioned(
                // patternL7b (0:7703)
                left: 0*fem,
                top: 0*fem,
                child: Align(
                  child: SizedBox(
                    width: 375*fem,
                    height: 812*fem,
                    child: Image.asset(
                      'assets/images/pattern-bg.png',
                      width: 375*fem,
                      height: 812*fem,
                    ),
                  ),
                ),
              ),
              Positioned(

                left: 65.5*fem,
                top: 150*fem,
                child: Container(
                  width: 250*fem,
                  height: 203*fem,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Container(

                        width: double.infinity,
                        height: 64*fem,
                        child: Stack(
                          children: [
                            Positioned(

                              left: 71*fem,
                              top: 0*fem,
                              child: Align(
                                child: SizedBox(

                                  width: 107*fem,
                                  height: 54*fem,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, AppRoutes.signUpScreen);
                                      },
                                    child: Text(
                                      'ssms ',

                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont (
                                        'Viga',
                                        fontSize: 40*ffem,
                                        color: Colors.greenAccent,
                                        fontWeight: FontWeight.w400,
                                        height: 1.345*ffem/fem,
                                        letterSpacing: 0.5*fem,

                                      ),
                                    ),
                                  )

                                ),
                              ),
                            ),
                            Positioned(

                              left: 0*fem,
                              top: 48*fem,
                              child: Align(
                                child: SizedBox(
                                  width: 250*fem,
                                  height: 16*fem,
                                  child: Text(
                                    'Society for Student Mess Services',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont (
                                      'Inter',
                                      fontSize: 13*ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.2125*ffem/fem,
                                      letterSpacing: 1*fem,
                                      color: Colors.greenAccent,
                                    ),
                                  ),
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
      )

    );

  }
}