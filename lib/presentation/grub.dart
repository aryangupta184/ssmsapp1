import 'package:flutter/material.dart';
import 'package:ssmsapp1/utils.dart';

class GrubScreen extends StatefulWidget {
  const GrubScreen({Key? key}) : super(key: key);

  @override
  State<GrubScreen> createState() => _GrubScreenState();
}

class _GrubScreenState extends State<GrubScreen> {
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Stack(
      children: [
        Image.asset(
          'assets/images/pattern-bg_2.png',
        ),
        Scaffold(
          backgroundColor: Color(0xffFFEEDD),
          body: Container(
            child: Column(
              children: [
                Container(height: 200,
                child: Stack(
                  children: [
                    Positioned(
                      // patternk4h (0:9371)
                        left: 0 * fem,
                        top: 0 * fem,
                        child: Opacity(
                          opacity: 0.2,
                          child: Align(
                            child: SizedBox(
                              width: 375 * fem,
                              height: 200 * fem,
                              child: Image.asset(
                                'assets/images/pattern-bg_2.png',
                                fit: BoxFit.cover,
                                width: 375 * fem,
                                height: 812 * fem,
                              ),
                            ),
                          ),
                        )),
                    Positioned(
                      top: 50,
                      child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 25),
                      padding: EdgeInsets.all(15),
                      height: 120,
                      width: 350,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(0xffFD9C2E), Color(0xffDA6317)]),
                          borderRadius: BorderRadius.circular(24)),
                      child: Column(
                        children: [

                          SizedBox(
                            height: 5,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              " Upcoming Grubs",
                              textAlign: TextAlign.right,
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: InkWell(
                                child: Container(
                                  width: 140,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 5),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Text(
                                    "Reserve Now",
                                    style: TextStyle(
                                        fontSize: 16, color: Color(0xff634831)),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),)
                    
                    
                  ],
                ),),
                
                

                Container(
                    child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "    Previous Grubs",
                    style: TextStyle(
                      fontSize: 30,
                      color: Color(0xff634831),
                    ),
                  ),
                )),
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  padding: EdgeInsets.fromLTRB(
                      14 * fem, 19 * fem, 17 * fem, 13 * fem),
                  height: 80,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffDA6317)),
                      color: Color(0x10634831),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // photomenuHzR (0:547)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 17.45 * fem, 5 * fem),
                        width: 62 * fem,
                        height: 62 * fem,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16 * fem),
                          child: Image.asset(
                            'assets/images/photo-paneer.png',
                          ),
                        ),
                      ),
                      Container(
                        // autogroupv4p9Cbb (HqNrRPagrxQi3RTzH2v4p9)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 36.55 * fem, 0 * fem),
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // menunamejLd (0:544)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 0 * fem, 4 * fem),
                              child: Text(
                                'Grub',
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 16 * ffem,
                                  fontWeight: FontWeight.bold,
                                  height: 1.3102273305 * ffem / fem,
                                  color: Color(0xff634831),
                                ),
                              ),
                            ),
                            Container(
                              // priece99T (0:546)
                              margin: EdgeInsets.fromLTRB(
                                  0.45 * fem, 0 * fem, 0 * fem, 0 * fem),
                              child: Text(
                                'Date',
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 19 * ffem,
                                  color: Color(0xff634831),
                                  fontWeight: FontWeight.w400,
                                  height: 1 * ffem / fem,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  padding: EdgeInsets.fromLTRB(
                      14 * fem, 19 * fem, 17 * fem, 13 * fem),
                  height: 80,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffDA6317)),
                      color: Color(0x10634831),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // photomenuHzR (0:547)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 17.45 * fem, 5 * fem),
                        width: 62 * fem,
                        height: 62 * fem,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16 * fem),
                          child: Image.asset(
                            'assets/images/photo-paneer.png',
                          ),
                        ),
                      ),
                      Container(
                        // autogroupv4p9Cbb (HqNrRPagrxQi3RTzH2v4p9)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 36.55 * fem, 0 * fem),
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // menunamejLd (0:544)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 0 * fem, 4 * fem),
                              child: Text(
                                'Grub',
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 16 * ffem,
                                  fontWeight: FontWeight.bold,
                                  height: 1.3102273305 * ffem / fem,
                                  color: Color(0xff634831),
                                ),
                              ),
                            ),
                            Container(
                              // priece99T (0:546)
                              margin: EdgeInsets.fromLTRB(
                                  0.45 * fem, 0 * fem, 0 * fem, 0 * fem),
                              child: Text(
                                'Date',
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 19 * ffem,
                                  color: Color(0xff634831),
                                  fontWeight: FontWeight.w400,
                                  height: 1 * ffem / fem,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  padding: EdgeInsets.all(15),
                  height: 80,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffDA6317)),
                      color: Color(0x10634831),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // photomenuHzR (0:547)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 17.45 * fem, 5 * fem),
                        width: 62 * fem,
                        height: 62 * fem,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16 * fem),
                          child: Image.asset(
                            'assets/images/photo-paneer.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        // autogroupv4p9Cbb (HqNrRPagrxQi3RTzH2v4p9)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 36.55 * fem, 0 * fem),
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // menunamejLd (0:544)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 0 * fem, 4 * fem),
                              child: Text(
                                'Grub',
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 16 * ffem,
                                  fontWeight: FontWeight.bold,
                                  height: 1.3102273305 * ffem / fem,
                                  color: Color(0xff634831),
                                ),
                              ),
                            ),
                            Container(
                              // priece99T (0:546)
                              margin: EdgeInsets.fromLTRB(
                                  0.45 * fem, 0 * fem, 0 * fem, 0 * fem),
                              child: Text(
                                'Date',
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 19 * ffem,
                                  color: Color(0xff634831),
                                  fontWeight: FontWeight.w400,
                                  height: 1 * ffem / fem,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 90,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
