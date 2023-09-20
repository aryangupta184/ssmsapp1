// import 'package:flutter/material.dart';
// import 'package:flutter/gestures.dart';
// import 'package:intl/intl.dart';
// import 'package:ssmsapp1/presentation/profile.dart';
// import 'package:ssmsapp1/resources/menu.dart';
// import 'dart:ui';
// import 'package:csv/csv.dart';
//
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:ssmsapp1/utils.dart';
//
// import 'package:ssmsapp1/resources/auth_methods.dart';
// import 'package:ssmsapp1/presentation/signup_screen.dart';
// import 'package:carousel_slider/carousel_slider.dart';
//
// import 'package:google_fonts/google_fonts.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
//
// class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
//   List<List<dynamic>> _data = [];
//
//
//
//   void _loadCSV() async {
//     final rawData = await rootBundle.loadString("assets/menu.csv");
//     List<List<dynamic>> listData = const CsvToListConverter().convert(rawData);
//     print(listData);
//     setState(() {
//       _data = listData;
//     });
//
//   }
//
//   @override
//   void initState() {
//     super.initState();
//       _loadCSV();
//
//
//
//   }
//   String date(newDate){
//     if (newDate.day==DateTime.now().day){
//       return "Today\'s";
//     }
//     else {
//       return newDate.day.toString()+"-"+newDate.month.toString();
//
//     }
//
//
//   }
//   DateTime selectedDate = DateTime.now();
//   DateTime newDate=DateTime.now();
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//
//
//     double baseWidth = 375;
//     double fem = MediaQuery.of(context).size.width / baseWidth;
//     double ffem = fem * 0.97;
//      return Material(
//        child: SingleChildScrollView(
//          child: Container(
//
//            height: MediaQuery.of(context).size.height,
//            width: double.infinity,
//            child: Container(
//              // homepHX (0:9368)
//              width: double.infinity,
//              height: 400*fem,
//              decoration: BoxDecoration (
//                color: Colors.black,
//
//              ),
//              child: Stack(
//                children: [
//
//                  Positioned(
//                    // patternk4h (0:9371)
//                    left: 0*fem,
//                    top: 0*fem,
//                    child: Opacity(
//                      opacity: 0.2,
//                      child: Align(
//                        child: SizedBox(
//                          width: 375*fem,
//                          height: 200*fem,
//                          child: Image.asset(
//                            'assets/images/pattern-bg2_.png',
//                            width: 375*fem,
//                            height: 812*fem,
//                          ),
//                        ),
//                      ),
//                    )
//
//                  ),
//                  Positioned(
//                    // iconnotificationSiD (0:9765)
//                    left: 300*fem,
//                    top: 71*fem,
//                    child: Align(
//                      child: SizedBox(
//                        width: 45*fem,
//                        height: 45*fem,
//                          child: InkWell(
//                            onTap: () async {
//                              await FirebaseServices().signOut();
//                              await AuthMethods().signOut();
//                              Navigator.of(context)
//                                  .pushReplacement(
//                                  MaterialPageRoute(
//                                    builder: (context) =>
//                                    const SignUpScreen(),
//                                  ));
//                            },
//                            child: Icon(
//                              Icons.logout,
//                              color: Colors.deepPurpleAccent,
//
//                            ),
//
//                          )
//
//                      ),
//                    ),
//                  ),
//                  Positioned(
//                    // iconnotificationxAm (0:9772)
//                    left: 300*fem,
//                    top: 280*fem,
//                    child: Align(
//                      child: SizedBox(
//
//                        width: 45*fem,
//                        height: 45*fem,
//                        child: InkWell(
//                          onTap: () async {
//                            DateTime? dateTime = await showDatePicker(
//                                context: context, initialDate: selectedDate,
//                                firstDate: DateTime(2020), lastDate: DateTime(2028),
//                                builder: (context, child) {
//                                  return Theme(
//                                    data: Theme.of(context).copyWith(
//                                      colorScheme: ColorScheme.light(
//                                        primary: Color(0xff6256bf), // <-- SEE HERE
//                                        onPrimary: Color(0xffd256ff), // <-- SEE HERE
//                                        onSurface: Colors.deepPurpleAccent, // <-- SEE HERE
//                                      ),
//                                      textButtonTheme: TextButtonThemeData(
//                                        style: TextButton.styleFrom(
//                                          primary: Color(0xff6256bf), // button text color
//                                        ),
//                                      ),
//                                    ),
//                                    child: child!,
//                                  );
//                                }
//
//
//                            );
//                            selectedDate=dateTime!;
//                            newDate=dateTime!;
//                            setState(() {
//
//                            });
//
//
//
//
//                          },
//                          child: Image.asset(
//                            'assets/images/icon-notification-calendar.png',
//                            width: 45*fem,
//                            height: 45*fem,
//                            color: Colors.deepPurpleAccent,
//                          ),
//                        )
//
//                      ),
//                    ),
//                  ),
//                  Positioned(
//                    // tiiitletext3xu (0:9775)
//                    left: 31*fem,
//                    top: 80*fem,
//                    child: Align(
//
//                      child: SizedBox(
//                        width: 200*fem,
//                        height: 82*fem,
//                        child: Text(
//                          'Your Expenses',
//                          style: SafeGoogleFont (
//                            'Inter',
//                            fontSize: 24*ffem,
//                            fontWeight: FontWeight.w400,
//                            height: 1.3102273018*ffem/fem,
//                            color: Color(0xffffffff),
//                          ),
//                        ),
//                      ),
//                    ),
//                  ),
//                  Positioned(
//                    left: 10*fem,
//                    top: 155*fem,
//                    child: Container(
//                    margin: EdgeInsets.symmetric(horizontal: 25),
//                    padding: EdgeInsets.all(15),
//                    height: 80,
//
//
//                    decoration: BoxDecoration(
//                        gradient: LinearGradient(
//                            colors: [Color(0xffD256FF), Color(0xff6256BF)]),
//                        borderRadius: BorderRadius.circular(24)),
//                    child: Row(
//                      children: [
//                        SizedBox(
//                          width: 15,
//                        ),
//                        Align(alignment: Alignment.center,child: Text('Rs. Cost',style: SafeGoogleFont (
//                          'Inter',
//                          fontSize: 24*ffem,
//                          fontWeight: FontWeight.w400,
//                          height: 1.3102273018*ffem/fem,
//                          color: Color(0xffffffff),
//                        ),),),
//                        SizedBox(
//                          width: 55,
//                        ),
//                        Align(alignment: Alignment.centerRight,child: Text(DateFormat.MMMM().format(DateTime.now()).toString(),style: SafeGoogleFont (
//                          'Inter',
//                          fontSize: 24*ffem,
//                          fontWeight: FontWeight.w400,
//                          height: 1.3102273018*ffem/fem,
//                          color: Colors.tealAccent,
//                        ),),),
//
//                        ]
//                    ),
//                  ),),
//                  Positioned(
//                    // tiiitletext3xu (0:9775)
//                    left: 31*fem,
//                    top: 280*fem,
//                    child: Align(
//                      child: SizedBox(
//                        width: 200*fem,
//                        height: 82*fem,
//                        child: Text(
//                          date(newDate)+
//                          // newDate.day.toString()+"-"+newDate.month.toString()+
//                          ' Menu',
//                          style: SafeGoogleFont (
//                            'Inter',
//                            fontSize: 24*ffem,
//                            fontWeight: FontWeight.w400,
//                            height: 1.3102273018*ffem/fem,
//                            color: Color(0xffffffff),
//                          ),
//                        ),
//                      ),
//                    ),
//                  ),
//                  Positioned(
//
//
//                      child: ListView(
//                        children: [
//                          CarouselSlider(
//                            items: [
//                              Container(
//                                  alignment: Alignment.center,
//                                  // padding: EdgeInsets.fromLTRB(39*fem, 16*fem, 40*fem, 16*fem),
//                                  width: 250*fem,
//                                  height: 350*fem,
//                                  decoration: BoxDecoration (
//                                    border: Border.all( color:Colors.deepPurpleAccent),
//                                    color: Color(0x19ffffff),
//                                    borderRadius: BorderRadius.circular(15*fem),
//                                    boxShadow: [
//                                      BoxShadow(
//                                        color: Color(0x115a6cea),
//                                        offset: Offset(12*fem, 26*fem),
//                                        blurRadius: 25*fem,
//                                      ),
//                                    ],
//                                  ),
//                                  child: Column(
//                                    children: [
//                                      Text(
//                                        'Breakfast',
//                                        style: SafeGoogleFont (
//                                          'Inter',
//                                          fontSize: 42 *ffem,
//                                          fontWeight: FontWeight.w500,
//                                          height: 1.3102273305*ffem/fem,
//                                          color: Colors.deepPurpleAccent,
//                                        ),
//                                      ),
//                                      const SizedBox(height: 20,),
//                                      Text(
//                                        _data[1][newDate.day-16],
//                                        style: SafeGoogleFont (
//                                          'Inter',
//                                          fontSize: 20 *ffem,
//                                          fontWeight: FontWeight.w400,
//                                          height: 1.3102273305*ffem/fem,
//                                          color: Color(0xffffffff),
//                                        ),
//                                      ),
//                                      const SizedBox(height: 5,),
//                                      Text(
//                                        _data[2][newDate.day-16],
//                                        style: SafeGoogleFont (
//                                          'Inter',
//                                          fontSize: 20 *ffem,                             fontWeight: FontWeight.w400,
//                                          height: 1.3102273305*ffem/fem,
//                                          color: Color(0xffffffff),
//                                        ),
//                                      ),
//                                      const SizedBox(height: 5,),
//                                      Text(
//                                        _data[3][newDate.day-16],
//                                        style: SafeGoogleFont (
//                                          'Inter',
//                                          fontSize: 20 *ffem,                             fontWeight: FontWeight.w400,
//                                          height: 1.3102273305*ffem/fem,
//                                          color: Color(0xffffffff),
//                                        ),
//                                      ),
//                                      const SizedBox(height: 5,),
//                                      Text(
//                                        _data[4][newDate.day-16],
//                                        style: SafeGoogleFont (
//                                          'Inter',
//                                          fontSize: 20 *ffem,                             fontWeight: FontWeight.w400,
//                                          height: 1.3102273305*ffem/fem,
//                                          color: Color(0xffffffff),
//                                        ),
//                                      ),
//                                      const SizedBox(height: 5,),
//                                      Text(
//                                        _data[5][newDate.day-16],
//                                        style: SafeGoogleFont (
//                                          'Inter',
//                                          fontSize: 20 *ffem,                             fontWeight: FontWeight.w400,
//                                          height: 1.3102273305*ffem/fem,
//                                          color: Color(0xffffffff),
//                                        ),
//                                      ),
//                                      const SizedBox(height: 5,),
//                                      Text(
//                                        _data[6][newDate.day-16],
//                                        style: SafeGoogleFont (
//                                          'Inter',
//                                          fontSize: 20 *ffem,                             fontWeight: FontWeight.w400,
//                                          height: 1.3102273305*ffem/fem,
//                                          color: Color(0xffffffff),
//                                        ),
//                                      ),
//                                      const SizedBox(height: 5,),
//                                      Text(
//                                        _data[7][newDate.day-16],
//                                        style: SafeGoogleFont (
//                                          'Inter',
//                                          fontSize: 20 *ffem,                             fontWeight: FontWeight.w400,
//                                          height: 1.3102273305*ffem/fem,
//                                          color: Color(0xffffffff),
//                                        ),
//                                      ),
//                                      const SizedBox(height: 5,),
//                                      Text(
//                                        _data[8][newDate.day-16],
//                                        style: SafeGoogleFont (
//                                          'Inter',
//                                          fontSize: 20 *ffem,                             fontWeight: FontWeight.w400,
//                                          height: 1.3102273305*ffem/fem,
//                                          color: Color(0xffffffff),
//                                        ),
//                                      ),
//                                      const SizedBox(height: 5,),
//                                      Text(
//                                        _data[9][newDate.day-16],
//                                        style: SafeGoogleFont (
//                                          'Inter',
//                                          fontSize: 20 *ffem,                             fontWeight: FontWeight.w400,
//                                          height: 1.3102273305*ffem/fem,
//                                          color: Color(0xffffffff),
//                                        ),
//                                      ),
//
//                                    ],
//                                  )
//
//
//                              ),
//                              Container(
//                                  alignment: Alignment.center,
//                                  // padding: EdgeInsets.fromLTRB(40*fem, 16*fem, 40*fem, 16*fem),
//                                  width: 250*fem,
//                                  height: 350*fem,
//                                  decoration: BoxDecoration (
//                                    border: Border.all( color: Colors.deepPurpleAccent),
//                                    color: Color(0x19ffffff),
//                                    borderRadius: BorderRadius.circular(15*fem),
//                                    boxShadow: [
//                                      BoxShadow(
//                                        color: Color(0x115a6cea),
//                                        offset: Offset(12*fem, 26*fem),
//                                        blurRadius: 25*fem,
//                                      ),
//                                    ],
//                                  ),
//                                  child: Column(
//                                    children: [
//                                      Text(
//                                        'Lunch',
//                                        style: SafeGoogleFont (
//                                          'Inter',
//                                          fontSize: 42 *ffem,
//                                          fontWeight: FontWeight.w500,
//                                          height: 1.3102273305*ffem/fem,
//                                          color: Colors.deepPurpleAccent,
//                                        ),
//                                      ),
//                                      const SizedBox(height: 20,),
//                                      Text(
//                                        _data[12][newDate.day-16],
//                                        style: SafeGoogleFont (
//                                          'Inter',
//                                          fontSize: 20 *ffem,                               fontWeight: FontWeight.w400,
//                                          height: 1.3102273305*ffem/fem,
//                                          color: Color(0xffffffff),
//                                        ),
//                                      ),
//                                      const SizedBox(height: 5,),
//                                      Text(
//                                        _data[13][newDate.day-16],
//                                        style: SafeGoogleFont (
//                                          'Inter',
//                                          fontSize: 20 *ffem,                               fontWeight: FontWeight.w400,
//                                          height: 1.3102273305*ffem/fem,
//                                          color: Color(0xffffffff),
//                                        ),
//                                      ),
//                                      const SizedBox(height: 5,),
//                                      Text(
//                                        _data[14][newDate.day-16],
//                                        style: SafeGoogleFont (
//                                          'Inter',
//                                          fontSize: 20 *ffem,                               fontWeight: FontWeight.w400,
//                                          height: 1.3102273305*ffem/fem,
//                                          color: Color(0xffffffff),
//                                        ),
//                                      ),
//                                      const SizedBox(height: 5,),
//                                      Text(
//                                        _data[15][newDate.day-16],
//                                        style: SafeGoogleFont (
//                                          'Inter',
//                                          fontSize: 20 *ffem,                               fontWeight: FontWeight.w400,
//                                          height: 1.3102273305*ffem/fem,
//                                          color: Color(0xffffffff),
//                                        ),
//                                      ),
//                                      const SizedBox(height: 5,),
//                                      Text(
//                                        _data[16][newDate.day-16],
//                                        style: SafeGoogleFont (
//                                          'Inter',
//                                          fontSize: 20 *ffem,                               fontWeight: FontWeight.w400,
//                                          height: 1.3102273305*ffem/fem,
//                                          color: Color(0xffffffff),
//                                        ),
//                                      ),
//                                      const SizedBox(height: 5,),
//                                      Text(
//                                        _data[17][newDate.day-16],
//                                        style: SafeGoogleFont (
//                                          'Inter',
//                                          fontSize: 20 *ffem,                               fontWeight: FontWeight.w400,
//                                          height: 1.3102273305*ffem/fem,
//                                          color: Color(0xffffffff),
//                                        ),
//                                      ),
//                                      const SizedBox(height: 5,),
//                                      Text(
//                                        _data[18][newDate.day-16],
//                                        style: SafeGoogleFont (
//                                          'Inter',
//                                          fontSize: 20 *ffem,                               fontWeight: FontWeight.w400,
//                                          height: 1.3102273305*ffem/fem,
//                                          color: Color(0xffffffff),
//                                        ),
//                                      ),
//                                      const SizedBox(height: 5,),
//                                      Text(
//                                        _data[19][newDate.day-16],
//                                        style: SafeGoogleFont (
//                                          'Inter',
//                                          fontSize: 20 *ffem,                               fontWeight: FontWeight.w400,
//                                          height: 1.3102273305*ffem/fem,
//                                          color: Color(0xffffffff),
//                                        ),
//                                      ),
//
//
//                                    ],
//                                  )
//                              ),
//                              Container(
//                                  alignment: Alignment.center,
//                                  // padding: EdgeInsets.fromLTRB(39*fem, 16*fem, 40*fem, 16*fem),
//                                  width: 250*fem,
//                                  height: 350*fem,
//                                  decoration: BoxDecoration (
//                                    border: Border.all( color: Colors.deepPurpleAccent),
//                                    color: Color(0x19ffffff),
//                                    borderRadius: BorderRadius.circular(15*fem),
//                                    boxShadow: [
//                                      BoxShadow(
//                                        color: Color(0x115a6cea),
//                                        offset: Offset(12*fem, 26*fem),
//                                        blurRadius: 25*fem,
//                                      ),
//                                    ],
//                                  ),
//                                  child: Column(
//                                    children: [
//                                      Text(
//                                        'Dinner',
//                                        style: SafeGoogleFont (
//                                          'Inter',
//                                          fontSize: 42 *ffem,
//                                          fontWeight: FontWeight.w500,
//                                          height: 1.3102273305*ffem/fem,
//                                          color: Colors.deepPurpleAccent,
//                                        ),
//                                      ),
//                                      const SizedBox(height: 20,),
//                                      Text(
//                                        _data[22][newDate.day-16],
//                                        style: SafeGoogleFont (
//                                          'Inter',
//                                          fontSize: 20 *ffem,                               fontWeight: FontWeight.w400,
//                                          height: 1.3102273305*ffem/fem,
//                                          color: Color(0xffffffff),
//                                        ),
//                                      ),
//                                      const SizedBox(height: 5,),
//                                      Text(
//                                        _data[23][newDate.day-16],
//                                        style: SafeGoogleFont (
//                                          'Inter',
//                                          fontSize: 20 *ffem,                               fontWeight: FontWeight.w400,
//                                          height: 1.3102273305*ffem/fem,
//                                          color: Color(0xffffffff),
//                                        ),
//                                      ),
//                                      const SizedBox(height: 5,),
//                                      Text(
//                                        _data[24][newDate.day-16],
//                                        style: SafeGoogleFont (
//                                          'Inter',
//                                          fontSize: 20 *ffem,                               fontWeight: FontWeight.w400,
//                                          height: 1.3102273305*ffem/fem,
//                                          color: Color(0xffffffff),
//                                        ),
//                                      ),
//                                      const SizedBox(height: 5,),
//                                      Text(
//                                        _data[25][newDate.day-16],
//                                        style: SafeGoogleFont (
//                                          'Inter',
//                                          fontSize: 20 *ffem,                               fontWeight: FontWeight.w400,
//                                          height: 1.3102273305*ffem/fem,
//                                          color: Color(0xffffffff),
//                                        ),
//                                      ),
//                                      const SizedBox(height: 5,),
//                                      Text(
//                                        _data[26][newDate.day-16],
//                                        style: SafeGoogleFont (
//                                          'Inter',
//                                          fontSize: 20 *ffem,                               fontWeight: FontWeight.w400,
//                                          height: 1.3102273305*ffem/fem,
//                                          color: Color(0xffffffff),
//                                        ),
//                                      ),
//                                      const SizedBox(height: 5,),
//                                      Text(
//                                        _data[27][newDate.day-16],
//                                        style: SafeGoogleFont (
//                                          'Inter',
//                                          fontSize: 20 *ffem,                               fontWeight: FontWeight.w400,
//                                          height: 1.3102273305*ffem/fem,
//                                          color: Color(0xffffffff),
//                                        ),
//                                      ),
//                                      const SizedBox(height: 5,),
//                                      Text(
//                                        _data[28][newDate.day-16],
//                                        style: SafeGoogleFont (
//                                          'Inter',
//                                          fontSize: 20 *ffem,                               fontWeight: FontWeight.w400,
//                                          height: 1.3102273305*ffem/fem,
//                                          color: Color(0xffffffff),
//                                        ),
//                                      ),
//
//
//
//                                    ],
//                                  )
//                              ),
//
//
//                              //1st Image of Slider
//
//
//                            ],
//
//                            //Slider Container properties
//                            options: CarouselOptions(
//                              height: 400.0,
//                              enlargeCenterPage: true,
//                              autoPlay: false,
//                              aspectRatio: 16 / 9,
//                              autoPlayCurve: Curves.fastOutSlowIn,
//                              enableInfiniteScroll: false,
//                              autoPlayAnimationDuration: Duration(milliseconds: 800),
//                              viewportFraction: 0.8,
//                            ),
//                          ),
//                        ],
//                      ),
//                  )
//
//
//
//
//
//
//
//                  // // Positioned(
//                  // //   // restaurant6iaV (0:9811)
//                  // //   left: 10*fem,
//                  // //   top: 155*fem,
//                  // //   child: Container(
//                  // //     alignment: Alignment.center,
//                  // //     // padding: EdgeInsets.fromLTRB(39*fem, 16*fem, 40*fem, 16*fem),
//                  // //     width: 170*fem,
//                  // //     height: 250*fem,
//                  // //     decoration: BoxDecoration (
//                  // //       border: Border.all( color:Colors.deepPurpleAccent),
//                  // //       color: Color(0x19ffffff),
//                  // //       borderRadius: BorderRadius.circular(15*fem),
//                  // //       boxShadow: [
//                  // //         BoxShadow(
//                  // //           color: Color(0x115a6cea),
//                  // //           offset: Offset(12*fem, 26*fem),
//                  // //           blurRadius: 25*fem,
//                  // //         ),
//                  // //       ],
//                  // //     ),
//                  // //     child: Column(
//                  // //       children: [
//                  // //         Text(
//                  // //           'Breakfast',
//                  // //           style: SafeGoogleFont (
//                  // //             'Inter',
//                  // //             fontSize: 28 *ffem,
//                  // //             fontWeight: FontWeight.w500,
//                  // //             height: 1.3102273305*ffem/fem,
//                  // //             color: Colors.deepPurpleAccent,
//                  // //           ),
//                  // //         ),
//                  // //         const SizedBox(height: 5,),
//                  // //         Text(
//                  // //           _data[1][newDate.day-16],
//                  // //           style: SafeGoogleFont (
//                  // //             'Inter',
//                  // //             fontSize: 13 *ffem,
//                  // //             fontWeight: FontWeight.w400,
//                  // //             height: 1.3102273305*ffem/fem,
//                  // //             color: Color(0xffffffff),
//                  // //           ),
//                  // //         ),
//                  // //         const SizedBox(height: 5,),
//                  // //         Text(
//                  // //           _data[2][newDate.day-16],
//                  // //           style: SafeGoogleFont (
//                  // //             'Inter',
//                  // //             fontSize: 13 *ffem,                             fontWeight: FontWeight.w400,
//                  // //             height: 1.3102273305*ffem/fem,
//                  // //             color: Color(0xffffffff),
//                  // //           ),
//                  // //         ),
//                  // //         const SizedBox(height: 5,),
//                  // //         Text(
//                  // //           _data[3][newDate.day-16],
//                  // //           style: SafeGoogleFont (
//                  // //             'Inter',
//                  // //             fontSize: 13 *ffem,                             fontWeight: FontWeight.w400,
//                  // //             height: 1.3102273305*ffem/fem,
//                  // //             color: Color(0xffffffff),
//                  // //           ),
//                  // //         ),
//                  // //         const SizedBox(height: 5,),
//                  // //         Text(
//                  // //           _data[4][newDate.day-16],
//                  // //           style: SafeGoogleFont (
//                  // //             'Inter',
//                  // //             fontSize: 13 *ffem,                             fontWeight: FontWeight.w400,
//                  // //             height: 1.3102273305*ffem/fem,
//                  // //             color: Color(0xffffffff),
//                  // //           ),
//                  // //         ),
//                  // //         const SizedBox(height: 5,),
//                  // //         Text(
//                  // //           _data[5][newDate.day-16],
//                  // //           style: SafeGoogleFont (
//                  // //             'Inter',
//                  // //             fontSize: 13 *ffem,                             fontWeight: FontWeight.w400,
//                  // //             height: 1.3102273305*ffem/fem,
//                  // //             color: Color(0xffffffff),
//                  // //           ),
//                  // //         ),
//                  // //         const SizedBox(height: 5,),
//                  // //         Text(
//                  // //           _data[6][newDate.day-16],
//                  // //           style: SafeGoogleFont (
//                  // //             'Inter',
//                  // //             fontSize: 13 *ffem,                             fontWeight: FontWeight.w400,
//                  // //             height: 1.3102273305*ffem/fem,
//                  // //             color: Color(0xffffffff),
//                  // //           ),
//                  // //         ),
//                  // //         const SizedBox(height: 5,),
//                  // //         Text(
//                  // //           _data[7][newDate.day-16],
//                  // //           style: SafeGoogleFont (
//                  // //             'Inter',
//                  // //             fontSize: 13 *ffem,                             fontWeight: FontWeight.w400,
//                  // //             height: 1.3102273305*ffem/fem,
//                  // //             color: Color(0xffffffff),
//                  // //           ),
//                  // //         ),
//                  // //         const SizedBox(height: 5,),
//                  // //         Text(
//                  // //           _data[8][newDate.day-16],
//                  // //           style: SafeGoogleFont (
//                  // //             'Inter',
//                  // //             fontSize: 13 *ffem,                             fontWeight: FontWeight.w400,
//                  // //             height: 1.3102273305*ffem/fem,
//                  // //             color: Color(0xffffffff),
//                  // //           ),
//                  // //         ),
//                  // //         const SizedBox(height: 5,),
//                  // //         Text(
//                  // //           _data[9][newDate.day-16],
//                  // //           style: SafeGoogleFont (
//                  // //             'Inter',
//                  // //             fontSize: 13 *ffem,                             fontWeight: FontWeight.w400,
//                  // //             height: 1.3102273305*ffem/fem,
//                  // //             color: Color(0xffffffff),
//                  // //           ),
//                  // //         ),
//                  // //
//                  // //       ],
//                  // //     )
//                  // //
//                  // //
//                  // //   ),
//                  // // ),
//                  // Positioned(
//                  //   // frame13L65 (0:9815)
//                  //   left: 195*fem,
//                  //   top: 155*fem,
//                  //   child: Container(
//                  //     alignment: Alignment.center,
//                  //     // padding: EdgeInsets.fromLTRB(40*fem, 16*fem, 40*fem, 16*fem),
//                  //     width: 170*fem,
//                  //     height: 250*fem,
//                  //     decoration: BoxDecoration (
//                  //       border: Border.all( color: Colors.deepPurpleAccent),
//                  //       color: Color(0x19ffffff),
//                  //       borderRadius: BorderRadius.circular(15*fem),
//                  //       boxShadow: [
//                  //         BoxShadow(
//                  //           color: Color(0x115a6cea),
//                  //           offset: Offset(12*fem, 26*fem),
//                  //           blurRadius: 25*fem,
//                  //         ),
//                  //       ],
//                  //     ),
//                  //       child: Column(
//                  //         children: [
//                  //           Text(
//                  //             'Lunch',
//                  //             style: SafeGoogleFont (
//                  //               'Inter',
//                  //               fontSize: 28 *ffem,
//                  //               fontWeight: FontWeight.w500,
//                  //               height: 1.3102273305*ffem/fem,
//                  //               color: Colors.deepPurpleAccent,
//                  //             ),
//                  //           ),
//                  //           const SizedBox(height: 8,),
//                  //           Text(
//                  //             _data[12][newDate.day-16],
//                  //             style: SafeGoogleFont (
//                  //               'Inter',
//                  //               fontSize: 13 *ffem,                               fontWeight: FontWeight.w400,
//                  //               height: 1.3102273305*ffem/fem,
//                  //               color: Color(0xffffffff),
//                  //             ),
//                  //           ),
//                  //           const SizedBox(height: 5,),
//                  //           Text(
//                  //             _data[13][newDate.day-16],
//                  //             style: SafeGoogleFont (
//                  //               'Inter',
//                  //               fontSize: 13 *ffem,                               fontWeight: FontWeight.w400,
//                  //               height: 1.3102273305*ffem/fem,
//                  //               color: Color(0xffffffff),
//                  //             ),
//                  //           ),
//                  //           const SizedBox(height: 5,),
//                  //           Text(
//                  //             _data[14][newDate.day-16],
//                  //             style: SafeGoogleFont (
//                  //               'Inter',
//                  //               fontSize: 13 *ffem,                               fontWeight: FontWeight.w400,
//                  //               height: 1.3102273305*ffem/fem,
//                  //               color: Color(0xffffffff),
//                  //             ),
//                  //           ),
//                  //           const SizedBox(height: 5,),
//                  //           Text(
//                  //             _data[15][newDate.day-16],
//                  //             style: SafeGoogleFont (
//                  //               'Inter',
//                  //               fontSize: 13 *ffem,                               fontWeight: FontWeight.w400,
//                  //               height: 1.3102273305*ffem/fem,
//                  //               color: Color(0xffffffff),
//                  //             ),
//                  //           ),
//                  //           const SizedBox(height: 5,),
//                  //           Text(
//                  //             _data[16][newDate.day-16],
//                  //             style: SafeGoogleFont (
//                  //               'Inter',
//                  //               fontSize: 13 *ffem,                               fontWeight: FontWeight.w400,
//                  //               height: 1.3102273305*ffem/fem,
//                  //               color: Color(0xffffffff),
//                  //             ),
//                  //           ),
//                  //           const SizedBox(height: 5,),
//                  //           Text(
//                  //             _data[17][newDate.day-16],
//                  //             style: SafeGoogleFont (
//                  //               'Inter',
//                  //               fontSize: 13 *ffem,                               fontWeight: FontWeight.w400,
//                  //               height: 1.3102273305*ffem/fem,
//                  //               color: Color(0xffffffff),
//                  //             ),
//                  //           ),
//                  //           const SizedBox(height: 5,),
//                  //           Text(
//                  //             _data[18][newDate.day-16],
//                  //             style: SafeGoogleFont (
//                  //               'Inter',
//                  //               fontSize: 13 *ffem,                               fontWeight: FontWeight.w400,
//                  //               height: 1.3102273305*ffem/fem,
//                  //               color: Color(0xffffffff),
//                  //             ),
//                  //           ),
//                  //           const SizedBox(height: 5,),
//                  //           Text(
//                  //             _data[19][newDate.day-16],
//                  //             style: SafeGoogleFont (
//                  //               'Inter',
//                  //               fontSize: 13 *ffem,                               fontWeight: FontWeight.w400,
//                  //               height: 1.3102273305*ffem/fem,
//                  //               color: Color(0xffffffff),
//                  //             ),
//                  //           ),
//                  //
//                  //
//                  //         ],
//                  //       )
//                  //   ),
//                  // ),
//                  // Positioned(
//                  //   // restaurant6iaV (0:9811)
//                  //   left: 100*fem,
//                  //   top: 440*fem,
//                  //   child: Container(
//                  //     alignment: Alignment.center,
//                  //     // padding: EdgeInsets.fromLTRB(39*fem, 16*fem, 40*fem, 16*fem),
//                  //     width: 170*fem,
//                  //     height: 250*fem,
//                  //     decoration: BoxDecoration (
//                  //       border: Border.all( color: Colors.deepPurpleAccent),
//                  //       color: Color(0x19ffffff),
//                  //       borderRadius: BorderRadius.circular(15*fem),
//                  //       boxShadow: [
//                  //         BoxShadow(
//                  //           color: Color(0x115a6cea),
//                  //           offset: Offset(12*fem, 26*fem),
//                  //           blurRadius: 25*fem,
//                  //         ),
//                  //       ],
//                  //     ),
//                  //       child: Column(
//                  //         children: [
//                  //           Text(
//                  //             'Dinner',
//                  //             style: SafeGoogleFont (
//                  //               'Inter',
//                  //               fontSize: 28 *ffem,
//                  //               fontWeight: FontWeight.w500,
//                  //               height: 1.3102273305*ffem/fem,
//                  //               color: Colors.deepPurpleAccent,
//                  //             ),
//                  //           ),
//                  //           const SizedBox(height: 8,),
//                  //           Text(
//                  //             _data[22][newDate.day-16],
//                  //             style: SafeGoogleFont (
//                  //               'Inter',
//                  //               fontSize: 13 *ffem,                               fontWeight: FontWeight.w400,
//                  //               height: 1.3102273305*ffem/fem,
//                  //               color: Color(0xffffffff),
//                  //             ),
//                  //           ),
//                  //           const SizedBox(height: 5,),
//                  //           Text(
//                  //             _data[23][newDate.day-16],
//                  //             style: SafeGoogleFont (
//                  //               'Inter',
//                  //               fontSize: 13 *ffem,                               fontWeight: FontWeight.w400,
//                  //               height: 1.3102273305*ffem/fem,
//                  //               color: Color(0xffffffff),
//                  //             ),
//                  //           ),
//                  //           const SizedBox(height: 5,),
//                  //           Text(
//                  //             _data[24][newDate.day-16],
//                  //             style: SafeGoogleFont (
//                  //               'Inter',
//                  //               fontSize: 13 *ffem,                               fontWeight: FontWeight.w400,
//                  //               height: 1.3102273305*ffem/fem,
//                  //               color: Color(0xffffffff),
//                  //             ),
//                  //           ),
//                  //           const SizedBox(height: 5,),
//                  //           Text(
//                  //             _data[25][newDate.day-16],
//                  //             style: SafeGoogleFont (
//                  //               'Inter',
//                  //               fontSize: 13 *ffem,                               fontWeight: FontWeight.w400,
//                  //               height: 1.3102273305*ffem/fem,
//                  //               color: Color(0xffffffff),
//                  //             ),
//                  //           ),
//                  //           const SizedBox(height: 5,),
//                  //           Text(
//                  //             _data[26][newDate.day-16],
//                  //             style: SafeGoogleFont (
//                  //               'Inter',
//                  //               fontSize: 13 *ffem,                               fontWeight: FontWeight.w400,
//                  //               height: 1.3102273305*ffem/fem,
//                  //               color: Color(0xffffffff),
//                  //             ),
//                  //           ),
//                  //           const SizedBox(height: 5,),
//                  //           Text(
//                  //             _data[27][newDate.day-16],
//                  //             style: SafeGoogleFont (
//                  //               'Inter',
//                  //               fontSize: 13 *ffem,                               fontWeight: FontWeight.w400,
//                  //               height: 1.3102273305*ffem/fem,
//                  //               color: Color(0xffffffff),
//                  //             ),
//                  //           ),
//                  //           const SizedBox(height: 5,),
//                  //           Text(
//                  //             _data[28][newDate.day-16],
//                  //             style: SafeGoogleFont (
//                  //               'Inter',
//                  //               fontSize: 13 *ffem,                               fontWeight: FontWeight.w400,
//                  //               height: 1.3102273305*ffem/fem,
//                  //               color: Color(0xffffffff),
//                  //             ),
//                  //           ),
//                  //
//                  //
//                  //
//                  //         ],
//                  //       )
//                  //   ),
//                  // ),
//                ],
//              ),
//            ),
//          ),
//        ),
//      );
//     // Container(
//     //   width: double.infinity,
//     //   child: Container(
//     //     // homepHX (0:9368)
//     //     width: double.infinity,
//     //     height: 812*fem,
//     //     decoration: BoxDecoration (
//     //       color: Color(0xff0c0c0c),
//     //       borderRadius: BorderRadius.circular(20*fem),
//     //     ),
//     //     child: Stack(
//     //       children: [
//     //         Positioned(
//     //           // restaurant8wN9 (0:9369)
//     //           left: 115*fem,
//     //           top: 462*fem,
//     //           child: Container(
//     //             width: 147*fem,
//     //             height: 184*fem,
//     //             decoration: BoxDecoration (
//     //               borderRadius: BorderRadius.circular(15*fem),
//     //             ),
//     //             child: Center(
//     //               // rectangle12eXT (0:9370)
//     //               child: SizedBox(
//     //                 width: double.infinity,
//     //                 height: 184*fem,
//     //                 child: Container(
//     //                   decoration: BoxDecoration (
//     //                     borderRadius: BorderRadius.circular(15*fem),
//     //                     border: Border.all(color: Color(0x19f4f4f4)),
//     //                     color: Color(0x19ffffff),
//     //                     boxShadow: [
//     //                       BoxShadow(
//     //                         color: Color(0x115a6cea),
//     //                         offset: Offset(12*fem, 26*fem),
//     //                         blurRadius: 25*fem,
//     //                       ),
//     //                     ],
//     //                   ),
//     //                 ),
//     //               ),
//     //             ),
//     //           ),
//     //         ),
//     //         Positioned(
//     //           // patternk4h (0:9371)
//     //           left: 0*fem,
//     //           top: 0*fem,
//     //           child: Align(
//     //             child: SizedBox(
//     //               width: 375*fem,
//     //               height: 812*fem,
//     //               child: Image.asset(
//     //                 'assets/images/pattern-bg2.png',
//     //                 width: 375*fem,
//     //                 height: 812*fem,
//     //               ),
//     //             ),
//     //           ),
//     //         ),
//     //         Positioned(
//     //           // iconnotificationSiD (0:9765)
//     //           left: 291*fem,
//     //           top: 71*fem,
//     //           child: Align(
//     //             child: SizedBox(
//     //               width: 45*fem,
//     //               height: 45*fem,
//     //               child: Image.asset(
//     //                 'assets/images/icon-notification.png',
//     //                 width: 45*fem,
//     //                 height: 45*fem,
//     //               ),
//     //             ),
//     //           ),
//     //         ),
//     //         Positioned(
//     //           // iconnotificationxAm (0:9772)
//     //           left: 233*fem,
//     //           top: 71*fem,
//     //           child: Align(
//     //             child: SizedBox(
//     //               width: 45*fem,
//     //               height: 45*fem,
//     //               child: Image.asset(
//     //                 'assets/images/icon-notification-calendar.png',
//     //                 width: 45*fem,
//     //                 height: 45*fem,
//     //               ),
//     //             ),
//     //           ),
//     //         ),
//     //         Positioned(
//     //           // tiiitletext3xu (0:9775)
//     //           left: 31*fem,
//     //           top: 60*fem,
//     //           child: Align(
//     //             child: SizedBox(
//     //               width: 110*fem,
//     //               height: 82*fem,
//     //               child: Text(
//     //                 'Today’s\nMenu',
//     //                 style: SafeGoogleFont (
//     //                   'Inter',
//     //                   fontSize: 31*ffem,
//     //                   fontWeight: FontWeight.w400,
//     //                   height: 1.3102273018*ffem/fem,
//     //                   color: Color(0xffffffff),
//     //                 ),
//     //               ),
//     //             ),
//     //           ),
//     //         ),
//     //         Positioned(
//     //           // dinnerjqj (0:9776)
//     //           left: 158*fem,
//     //           top: 604*fem,
//     //           child: Align(
//     //             child: SizedBox(
//     //               width: 47*fem,
//     //               height: 20*fem,
//     //               child: Text(
//     //                 'Dinner',
//     //                 textAlign: TextAlign.center,
//     //                 style: SafeGoogleFont (
//     //                   'Inter',
//     //                   fontSize: 15*ffem,
//     //                   fontWeight: FontWeight.w400,
//     //                   height: 1.3102273305*ffem/fem,
//     //                   color: Color(0xffffffff),
//     //                 ),
//     //               ),
//     //             ),
//     //           ),
//     //         ),
//     //         Positioned(
//     //           // searchqds (0:9777)
//     //           left: 25*fem,
//     //           top: 160*fem,
//     //           child: Container(
//     //             padding: EdgeInsets.fromLTRB(21*fem, 16*fem, 57*fem, 16*fem),
//     //             width: 267*fem,
//     //             height: 50*fem,
//     //             decoration: BoxDecoration (
//     //               border: Border.all(color: Color(0x19f4f4f4)),
//     //               color: Color(0x19ffffff),
//     //               borderRadius: BorderRadius.circular(15*fem),
//     //               boxShadow: [
//     //                 BoxShadow(
//     //                   color: Color(0x115a6cea),
//     //                   offset: Offset(12*fem, 26*fem),
//     //                   blurRadius: 25*fem,
//     //                 ),
//     //               ],
//     //             ),
//     //             child: Row(
//     //               crossAxisAlignment: CrossAxisAlignment.center,
//     //               children: [
//     //                 Container(
//     //                   // iconsearchJ1f (0:9779)
//     //                   margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 22*fem, 0*fem),
//     //                   width: 18*fem,
//     //                   height: 18*fem,
//     //                   child: Image.asset(
//     //                     'assets/images/icon-search.png',
//     //                     width: 18*fem,
//     //                     height: 18*fem,
//     //                   ),
//     //                 ),
//     //                 Container(
//     //                   // searcsampleR6H (0:9782)
//     //                   margin: EdgeInsets.fromLTRB(0*fem, 3*fem, 0*fem, 0*fem),
//     //                   child: Text(
//     //                     'What do you want to see?',
//     //                     style: SafeGoogleFont (
//     //                       'Roboto',
//     //                       fontSize: 12*ffem,
//     //                       fontWeight: FontWeight.w400,
//     //                       height: 1.1725*ffem/fem,
//     //                       letterSpacing: 0.5*fem,
//     //                       color: Color(0xffffffff),
//     //                     ),
//     //                   ),
//     //                 ),
//     //               ],
//     //             ),
//     //           ),
//     //         ),
//     //         Positioned(
//     //           // filtericonWdX (0:9783)
//     //           left: 301*fem,
//     //           top: 160*fem,
//     //           child: Align(
//     //             child: SizedBox(
//     //               width: 49*fem,
//     //               height: 50*fem,
//     //               child: Image.asset(
//     //                 'assets/images/filter-icon.png',
//     //                 width: 49*fem,
//     //                 height: 50*fem,
//     //               ),
//     //             ),
//     //           ),
//     //         ),
//     //         Positioned(
//     //           // menubarcwT (0:9791)
//     //           left: 10*fem,
//     //           top: 728*fem,
//     //           child: Container(
//     //             padding: EdgeInsets.fromLTRB(20*fem, 15*fem, 40*fem, 15*fem),
//     //             width: 355*fem,
//     //             height: 74*fem,
//     //             decoration: BoxDecoration (
//     //               color: Color(0xff252525),
//     //               borderRadius: BorderRadius.circular(15*fem),
//     //               boxShadow: [
//     //                 BoxShadow(
//     //                   color: Color(0x7f010107),
//     //                   offset: Offset(0*fem, 0*fem),
//     //                   blurRadius: 25*fem,
//     //                 ),
//     //               ],
//     //             ),
//     //             child: Row(
//     //               crossAxisAlignment: CrossAxisAlignment.center,
//     //               children: [
//     //                 Container(
//     //                   // iconhomeactiveUCy (0:9793)
//     //                   margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 46*fem, 0*fem),
//     //                   padding: EdgeInsets.fromLTRB(19.5*fem, 12*fem, 18*fem, 12*fem),
//     //                   height: double.infinity,
//     //                   decoration: BoxDecoration (
//     //                     borderRadius: BorderRadius.circular(12*fem),
//     //                     gradient: LinearGradient (
//     //                       begin: Alignment(-1, -1.123),
//     //                       end: Alignment(1, 1.228),
//     //                       colors: <Color>[Color(0x1953e78b), Color(0x1914be77)],
//     //                       stops: <double>[0, 1],
//     //                     ),
//     //                   ),
//     //                   child: Row(
//     //                     crossAxisAlignment: CrossAxisAlignment.center,
//     //                     children: [
//     //                       Container(
//     //                         // iconlybulkhome6k9 (0:9795)
//     //                         margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 14.5*fem, 0*fem),
//     //                         width: 19*fem,
//     //                         height: 20*fem,
//     //                         child: Image.asset(
//     //                           'assets/images/iconly-bulk-home.png',
//     //                           width: 19*fem,
//     //                           height: 20*fem,
//     //                         ),
//     //                       ),
//     //                       Container(
//     //                         // homeciV (0:9798)
//     //                         margin: EdgeInsets.fromLTRB(0*fem, 4*fem, 0*fem, 0*fem),
//     //                         child: Text(
//     //                           'Home',
//     //                           style: SafeGoogleFont (
//     //                             'Inter',
//     //                             fontSize: 12*ffem,
//     //                             fontWeight: FontWeight.w400,
//     //                             height: 1.3102272352*ffem/fem,
//     //                             color: Color(0xffffffff),
//     //                           ),
//     //                         ),
//     //                       ),
//     //                     ],
//     //                   ),
//     //                 ),
//     //                 Opacity(
//     //                   // iconprofileimX (0:9806)
//     //                   opacity: 0.5,
//     //                   child: Container(
//     //                     margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 39.01*fem, 0*fem),
//     //                     width: 15.99*fem,
//     //                     height: 20*fem,
//     //                     child: Image.asset(
//     //                       'assets/images/icon-profile.png',
//     //                       width: 15.99*fem,
//     //                       height: 20*fem,
//     //                     ),
//     //                   ),
//     //                 ),
//     //                 Container(
//     //                   // autogroupjymjpJm (HqPBPBKVp3kLJgwwsWjyMj)
//     //                   margin: EdgeInsets.fromLTRB(0*fem, 8*fem, 42*fem, 11.9*fem),
//     //                   width: 27*fem,
//     //                   height: double.infinity,
//     //                   child: Stack(
//     //                     children: [
//     //                       Positioned(
//     //                         // YEm (0:9800)
//     //                         left: 21*fem,
//     //                         top: 2*fem,
//     //                         child: Align(
//     //                           child: SizedBox(
//     //                             width: 6*fem,
//     //                             height: 12*fem,
//     //                             child: Text(
//     //                               '7',
//     //                               style: SafeGoogleFont (
//     //                                 'Inter',
//     //                                 fontSize: 9*ffem,
//     //                                 fontWeight: FontWeight.w400,
//     //                                 height: 1.3102272881*ffem/fem,
//     //                                 color: Color(0xff0c0c0c),
//     //                               ),
//     //                             ),
//     //                           ),
//     //                         ),
//     //                       ),
//     //                       Positioned(
//     //                         // iconcart3SR (0:9801)
//     //                         left: 0*fem,
//     //                         top: 0*fem,
//     //                         child: Container(
//     //                           width: 26*fem,
//     //                           height: 24.1*fem,
//     //                           child: Stack(
//     //                             children: [
//     //                               Positioned(
//     //                                 // iconlybulkbuyNzV (0:9802)
//     //                                 left: 0*fem,
//     //                                 top: 4.4996643066*fem,
//     //                                 child: Align(
//     //                                   child: SizedBox(
//     //                                     width: 20.02*fem,
//     //                                     height: 19.6*fem,
//     //                                     child: Opacity(
//     //                                       opacity: 0.5,
//     //                                       child: Image.asset(
//     //                                         'assets/images/iconly-bulk-buy.png',
//     //                                         width: 20.02*fem,
//     //                                         height: 19.6*fem,
//     //                                       ),
//     //                                     ),
//     //                                   ),
//     //                                 ),
//     //                               ),
//     //                               Positioned(
//     //                                 // notificationcart5e1 (0:9803)
//     //                                 left: 13*fem,
//     //                                 top: 0*fem,
//     //                                 child: Container(
//     //                                   width: 13*fem,
//     //                                   height: 14*fem,
//     //                                   child: Stack(
//     //                                     children: [
//     //                                       Positioned(
//     //                                         // ellipse163cP3 (0:9804)
//     //                                         left: 0*fem,
//     //                                         top: 0*fem,
//     //                                         child: Align(
//     //                                           child: SizedBox(
//     //                                             width: 13*fem,
//     //                                             height: 13*fem,
//     //                                             child: Container(
//     //                                               decoration: BoxDecoration (
//     //                                                 borderRadius: BorderRadius.circular(6.5*fem),
//     //                                                 border: Border.all(color: Color(0xff0c0c0c)),
//     //                                                 color: Color(0xffff6464),
//     //                                               ),
//     //                                             ),
//     //                                           ),
//     //                                         ),
//     //                                       ),
//     //                                       Positioned(
//     //                                         // XF7 (0:9805)
//     //                                         left: 4*fem,
//     //                                         top: 2*fem,
//     //                                         child: Align(
//     //                                           child: SizedBox(
//     //                                             width: 6*fem,
//     //                                             height: 12*fem,
//     //                                             child: Text(
//     //                                               '7',
//     //                                               style: SafeGoogleFont (
//     //                                                 'Inter',
//     //                                                 fontSize: 9*ffem,
//     //                                                 fontWeight: FontWeight.w400,
//     //                                                 height: 1.3102272881*ffem/fem,
//     //                                                 color: Color(0xff0c0c0c),
//     //                                               ),
//     //                                             ),
//     //                                           ),
//     //                                         ),
//     //                                       ),
//     //                                     ],
//     //                                   ),
//     //                                 ),
//     //                               ),
//     //                             ],
//     //                           ),
//     //                         ),
//     //                       ),
//     //                     ],
//     //                   ),
//     //                 ),
//     //                 Opacity(
//     //                   // iconlybulkchatpk1 (0:9799)
//     //                   opacity: 0.5,
//     //                   child: Container(
//     //                     margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0.03*fem),
//     //                     width: 20*fem,
//     //                     height: 19.97*fem,
//     //                     child: Image.asset(
//     //                       'assets/images/iconly-bulk-chat.png',
//     //                       width: 20*fem,
//     //                       height: 19.97*fem,
//     //                     ),
//     //                   ),
//     //                 ),
//     //               ],
//     //             ),
//     //           ),
//     //         ),
//     //         Positioned(
//     //           // restaurant6iaV (0:9811)
//     //           left: 24*fem,
//     //           top: 244*fem,
//     //           child: Container(
//     //             padding: EdgeInsets.fromLTRB(39*fem, 16*fem, 40*fem, 16*fem),
//     //             width: 147*fem,
//     //             height: 184*fem,
//     //             decoration: BoxDecoration (
//     //               border: Border.all(color: Color(0x19f4f4f4)),
//     //               color: Color(0x19ffffff),
//     //               borderRadius: BorderRadius.circular(15*fem),
//     //               boxShadow: [
//     //                 BoxShadow(
//     //                   color: Color(0x115a6cea),
//     //                   offset: Offset(12*fem, 26*fem),
//     //                   blurRadius: 25*fem,
//     //                 ),
//     //               ],
//     //             ),
//     //             child: Text(
//     //               'Breakfast',
//     //               style: SafeGoogleFont (
//     //                 'Inter',
//     //                 fontSize: 15*ffem,
//     //                 fontWeight: FontWeight.w400,
//     //                 height: 1.3102273305*ffem/fem,
//     //                 color: Color(0xffffffff),
//     //               ),
//     //             ),
//     //           ),
//     //         ),
//     //         Positioned(
//     //           // frame13L65 (0:9815)
//     //           left: 215*fem,
//     //           top: 244*fem,
//     //           child: Container(
//     //             padding: EdgeInsets.fromLTRB(51*fem, 16*fem, 52*fem, 16*fem),
//     //             width: 147*fem,
//     //             height: 184*fem,
//     //             decoration: BoxDecoration (
//     //               border: Border.all(color: Color(0x19f4f4f4)),
//     //               color: Color(0x19ffffff),
//     //               borderRadius: BorderRadius.circular(15*fem),
//     //               boxShadow: [
//     //                 BoxShadow(
//     //                   color: Color(0x115a6cea),
//     //                   offset: Offset(12*fem, 26*fem),
//     //                   blurRadius: 25*fem,
//     //                 ),
//     //               ],
//     //             ),
//     //             child: Text(
//     //               'Lunch',
//     //               style: SafeGoogleFont (
//     //                 'Inter',
//     //                 fontSize: 15*ffem,
//     //                 fontWeight: FontWeight.w400,
//     //                 height: 1.3102273305*ffem/fem,
//     //                 color: Color(0xffffffff),
//     //               ),
//     //             ),
//     //           ),
//     //         ),
//     //       ],
//     //     ),
//     //   ),
//     // );
//   }
// }
//
// // import 'package:flutter/material.dart';
// // import 'package:flutter/gestures.dart';
// // import 'dart:ui';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:ssmsapp1/resources/auth_methods.dart';
// // import 'package:ssmsapp1/presentation/signup_screen.dart';
// // import 'package:ssmsapp1/utils.dart';
// // import 'package:google_sign_in/google_sign_in.dart';
// //
// // class HomeScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     double baseWidth = 375;
// //     double fem = MediaQuery.of(context).size.width / baseWidth;
// //     double ffem = fem * 0.97;
// //     return Material(
// //       // body: SafeArea(
// //       child: SingleChildScrollView(
// //
// //           child: Container(
// //
// //             width: double.infinity,
// //             child: Container(
// //
// //               padding: EdgeInsets.fromLTRB(25*fem, 31*fem, 25*fem, 60*fem),
// //               width: double.infinity,
// //               decoration: BoxDecoration (
// //                 color: Color(0xff0c0c0c),
// //
// //                 image: DecorationImage (
// //                   fit: BoxFit.cover,
// //                   image: AssetImage (
// //                     'assets/images/pattern-bg.png',
// //                   ),
// //                 ),
// //               ),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.center,
// //                 children: [
// //                   Container(
// //                     margin: EdgeInsets.fromLTRB(37.5*fem, 0*fem, 37.5*fem, 0*fem),
// //                     width: double.infinity,
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.center,
// //                       children: [
// //                         Container(
// //                           // logoNKj (0:7698)
// //                           margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
// //                           width: 175*fem,
// //                           height: 139*fem,
// //                           child: Image.asset(
// //                             'assets/images/logo-ssms.png',
// //                           ),
// //                         ),
// //                         Container(
// //
// //                           width: double.infinity,
// //                           height: 64*fem,
// //                           child: Stack(
// //                             children: [
// //                               Positioned(
// //
// //                                 left: 71*fem,
// //                                 top: 0*fem,
// //                                 child: Align(
// //                                   child: SizedBox(
// //                                     width: 107*fem,
// //                                     height: 54*fem,
// //                                     child: Text(
// //                                       'ssms ',
// //                                       textAlign: TextAlign.center,
// //                                       style: SafeGoogleFont (
// //                                         'Viga',
// //                                         fontSize: 40*ffem,
// //                                         color: Color(0xff53E88B),
// //                                         fontWeight: FontWeight.w400,
// //                                         height: 1.345*ffem/fem,
// //                                         letterSpacing: 0.5*fem,
// //                                       ),
// //                                     ),
// //                                   ),
// //                                 ),
// //                               ),
// //                               Positioned(
// //
// //                                 left: 0*fem,
// //                                 top: 48*fem,
// //                                 child: Align(
// //                                   child: SizedBox(
// //                                     width: 250*fem,
// //                                     height: 16*fem,
// //                                     child: Text(
// //                                       'Society for Student Mess Services',
// //                                       textAlign: TextAlign.center,
// //                                       style: SafeGoogleFont (
// //                                         'Inter',
// //                                         fontSize: 13*ffem,
// //                                         fontWeight: FontWeight.w600,
// //                                         height: 1.2125*ffem/fem,
// //                                         letterSpacing: 1*fem,
// //                                         color: Color(0xffffffff),
// //                                       ),
// //                                     ),
// //                                   ),
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                   Container(
// //
// //                     margin: EdgeInsets.fromLTRB(5*fem, 0*fem, 5*fem, 0*fem),
// //                     width: double.infinity,
// //
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.center,
// //                       children: [
// //
// //                         Container(
// //                           // ctabuttonxRf (0:7673)
// //                           margin: EdgeInsets.fromLTRB(92*fem, 20*fem, 92*fem, 580*fem),
// //                           width: double.infinity,
// //                           height: 60*fem,
// //                           decoration: BoxDecoration (
// //                             borderRadius: BorderRadius.circular(15*fem),
// //                             color: Color(0xff53e78b),
// //
// //                           ),
// //                           child: Center(
// //                             child: InkWell(
// //                               onTap: () async {
// //                                 await FirebaseServices().signOut();
// //                                 await AuthMethods().signOut();
// //                                 Navigator.of(context)
// //                                     .pushReplacement(
// //                                     MaterialPageRoute(
// //                                       builder: (context) =>
// //                                       const SignUpScreen(),
// //                                     ));
// //                               },
// //                               child: Text(
// //                                 'Logout',
// //                                 style: SafeGoogleFont (
// //                                   'Inter',
// //                                   fontSize: 16*ffem,
// //                                   fontWeight: FontWeight.w400,
// //                                   height: 1.3102272749*ffem/fem,
// //                                   color: Color(0xffffffff),
// //                                 ),
// //                               ),
// //                             )
// //                           ),
// //                         ),
// //
// //
// //
// //
// //                       ],
// //                     ),
// //                   ),
// //
// //                 ],
// //               ),
// //             ),
// //           )
// //
// //       ),
// //     );
// //
// //   }
// // }
//
//
// // import 'package:carousel_slider/carousel_slider.dart';
// // import 'package:flutter/material.dart';
// //
// //
// // class HomePage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("GFG Slider"),
// //       ),
// //       body: ListView(
// //         children: [
// //           CarouselSlider(
// //             items: [
// //
// //               //1st Image of Slider
// //               Container(
// //                 margin: EdgeInsets.all(6.0),
// //                 decoration: BoxDecoration(
// //                   borderRadius: BorderRadius.circular(8.0),
// //                   image: DecorationImage(
// //                     image: NetworkImage("ADD IMAGE URL HERE"),
// //                     fit: BoxFit.cover,
// //                   ),
// //                 ),
// //               ),
// //
// //               //2nd Image of Slider
// //               Container(
// //                 margin: EdgeInsets.all(6.0),
// //                 decoration: BoxDecoration(
// //                   borderRadius: BorderRadius.circular(8.0),
// //                   image: DecorationImage(
// //                     image: NetworkImage("ADD IMAGE URL HERE"),
// //                     fit: BoxFit.cover,
// //                   ),
// //                 ),
// //               ),
// //
// //               //3rd Image of Slider
// //               Container(
// //                 margin: EdgeInsets.all(6.0),
// //                 decoration: BoxDecoration(
// //                   borderRadius: BorderRadius.circular(8.0),
// //                   image: DecorationImage(
// //                     image: NetworkImage("ADD IMAGE URL HERE"),
// //                     fit: BoxFit.cover,
// //                   ),
// //                 ),
// //               ),
// //
// //               //4th Image of Slider
// //               Container(
// //                 margin: EdgeInsets.all(6.0),
// //                 decoration: BoxDecoration(
// //                   borderRadius: BorderRadius.circular(8.0),
// //                   image: DecorationImage(
// //                     image: NetworkImage("ADD IMAGE URL HERE"),
// //                     fit: BoxFit.cover,
// //                   ),
// //                 ),
// //               ),
// //
// //               //5th Image of Slider
// //               Container(
// //                 margin: EdgeInsets.all(6.0),
// //                 decoration: BoxDecoration(
// //                   borderRadius: BorderRadius.circular(8.0),
// //                   image: DecorationImage(
// //                     image: NetworkImage("ADD IMAGE URL HERE"),
// //                     fit: BoxFit.cover,
// //                   ),
// //                 ),
// //               ),
// //
// //             ],
// //
// //             //Slider Container properties
// //             options: CarouselOptions(
// //               height: 180.0,
// //               enlargeCenterPage: true,
// //               autoPlay: true,
// //               aspectRatio: 16 / 9,
// //               autoPlayCurve: Curves.fastOutSlowIn,
// //               enableInfiniteScroll: true,
// //               autoPlayAnimationDuration: Duration(milliseconds: 800),
// //               viewportFraction: 0.8,
// //             ),
// //           ),
// //         ],
// //       ),
// //
// //     );
// //   }
// // }
//
//
//
//
//
//
//
//
