import 'package:flutter/material.dart';
import 'package:ssmsapp1/utils.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
                SizedBox(
                  height: 50,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  padding: EdgeInsets.all(15),
                  height: 150,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xffFD9C2E), Color(0xffDA6317)]),
                      borderRadius: BorderRadius.circular(24)),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        children: [
                          Text(
                            "Pitstop Items \n Today",
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          InkWell(
                            child: Container(
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16)),
                              child: Text(
                                "Reserve Now",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff634831)),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      VerticalDivider(
                        color: Colors.black,
                        width: 2,
                        thickness: 2,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        children: [
                          Text(
                            "Mess Extras \n Today",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          InkWell(
                            child: Container(
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16)),
                              child: Text(
                                "Reserve Now",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff634831)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "    Order Details",
                        style: TextStyle(fontSize: 30, color: Color(0xff634831),),
                  ),
                )



                ),

                SizedBox(height: 30,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  padding: EdgeInsets.fromLTRB(14*fem, 19*fem, 17*fem, 13*fem),
                  height: 80,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffDA6317)),

                    color: Color(0x10634831),
                    borderRadius: BorderRadius.circular(12)
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
                                  fontSize: 16*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.3102273305*ffem/fem,
                                  color: Color(0xff634831),
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
                                  color: Color(0xff634831),
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
                SizedBox(height: 15,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  padding: EdgeInsets.all(15),
                  height: 80,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffDA6317)),
                      color: Color(0x10634831),
                      borderRadius: BorderRadius.circular(12)
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
                                  fontSize: 16*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.3102273305*ffem/fem,
                                  color: Color(0xff634831),
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
                                  color: Color(0xff634831),
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
                SizedBox(height: 90,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  padding: EdgeInsets.all(15),
                  height: 150,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xffFD9C2E), Color(0xffDA6317)]),
                      borderRadius: BorderRadius.circular(24)),
                  child: Column(
                    children: [
                      Row(
                        children:[
                          SizedBox(width: 10,),
                          Text(
                            "Total",
                            style: TextStyle(
                              fontSize: 24
                            ),

                          ),
                          SizedBox(width: 100,),
                          Text(
                            "Rs. Cost",
                            style: TextStyle(
                                fontSize: 20,
                              color: Colors.white
                            ),

                          ),

                        ]

                      ),
                      SizedBox(height: 40,),

                      InkWell(
                        child: Container(
                          width: 380,
                          height: 50,

                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16)),
                          child: Align(
                            alignment: Alignment.center,

                            child: Text(
                              "Place My Order",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff634831)),
                            ) ,
                          ),

                        ),
                      )

                    ],
                  ),
                )

              ],
            ),
          ),
        )
      ],
    );
  }
}
