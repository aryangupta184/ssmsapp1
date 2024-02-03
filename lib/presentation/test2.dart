import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

import 'dart:ui';
import 'package:csv/csv.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'package:local_auth/local_auth.dart';
import 'package:ssmsapp1/resources/local_auth_service.dart';
import 'package:ssmsapp1/resources/menu_method.dart';
import 'package:ssmsapp1/utils.dart';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:qr_flutter/qr_flutter.dart';

import 'package:google_fonts/google_fonts.dart';

import '../resources/menu_method.dart';
import '../resources/menu_method.dart';

int current = 0;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late Future<List<List<String>>> futureMenu;

  late final LocalAuthentication auth;

  bool _supportState = false;
  List<List<dynamic>> _data = [];
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // void _loadCSV() async {
  //   final rawData = await rootBundle.loadString("assets/menu.csv");
  //   List<List<dynamic>> listData = const CsvToListConverter().convert(rawData);
  //   print(listData);
  //   setState(() {
  //     _data = listData;
  //   });
  //
  // }
  int getinitialpage() {
    var datetime = DateTime.now();
    var timeString = DateFormat('HH').format(datetime);
    var time = int.parse(timeString);
    if (10 <= time && 16 >= time) {
      return 1;
    } else if (time < 10) {
      return 0;
    } else {
      return 2;
    }
  }

  getHalf() {
    if (newDate.day.toInt() >= 16) {
      return -16 + newDate.day.toInt();
    } else {
      return -1 + newDate.day.toInt();
    }
  }

  getCurrentUsername() {
    if (_auth.currentUser!.email != null) {
      String bar;
      bar=_auth.currentUser!.email.toString()[0].toUpperCase()+_auth.currentUser!.email.toString()[3]+_auth.currentUser!.email.toString()[4]+_auth.currentUser!.email.toString()[5]+_auth.currentUser!.email.toString()[6]+_auth.currentUser!.email.toString()[7]+_auth.currentUser!.email.toString()[8]+'123';


      return bar;
    }
  }

  Future<void> _authenticate() async {
    try {
      bool authenticated = await auth.authenticate(
          localizedReason: 'Open QR',
          options: AuthenticationOptions(
            stickyAuth: true,
            biometricOnly: true,
          ));
    } catch (e) {
      print(e);
    }
  }

  Widget setupAlertDialoadContainer(context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xff0D0D0D)),
        borderRadius: BorderRadius.circular(16),
        color: Color(0xff0D0D0D),
        boxShadow: [
          BoxShadow(
            color:
                Color(0xff0D0D0D).withOpacity(0.5), // Adjust opacity as needed
            blurRadius: 25.0, // Adjust blur radius as needed
            spreadRadius: 15.0, // Adjust spread radius as needed
            offset: Offset(0.0, 4.0), // Adjust offset as needed
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            child: SizedBox(
              width: 200,
              height: 50,
              child: Text(
                'Notifications',
                style: SafeGoogleFont(
                  'Inter',
                  fontSize: 27,
                  fontWeight: FontWeight.w400,
                  height: 1.6,
                  color: Color(0xff53E88B),
                ),
              ),
            ),
          ),
          Container(
            height: 300.0, // Change as per your requirement
            width: 300.0, // Change as per your requirement
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Container(
                    padding: EdgeInsets.fromLTRB(11, 12, 11, 8),
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff53E88B)),
                      color: Color(0x10634831),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      'List Item $index',
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        height: 1.2,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff53E88B)),
                  color: Color(0x10634831),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Color(0xff53E88B),
                  ),
                ),
              )),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    futureMenu = fetchRowwiseMenu();
    current = getHalf();

    auth = LocalAuthentication();
    auth.isDeviceSupported().then((bool isSupported) => setState(() {
          _supportState = isSupported;
        }));
  }

  String date(newDate) {
    if (newDate.day == DateTime.now().day) {
      return "Today\'s";
    } else {
      return newDate.day.toString() + "-" + newDate.month.toString();
    }
  }

  DateTime start(){
    DateTime now = DateTime.now();
    if(now.day>15){
      DateTime dateOf16th = DateTime(now.year, now.month, 16);
        return dateOf16th;
    }
    else{
      DateTime dateOf1th = DateTime(now.year, now.month, 1);
        return dateOf1th;

    }
  }
  DateTime end(){
    DateTime now = DateTime.now();
    if(now.day>15){
      DateTime dateOf16th = DateTime(now.year, now.month, 31);
      return dateOf16th;
    }
    else{
      DateTime dateOf1th = DateTime(now.year, now.month, 15);
      return dateOf1th;

    }
  }
  DateTime selectedDate = DateTime.now();
  DateTime newDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Material(
      color: Color(0xff0D0D0D),
      child: Column(children: [
        Container(
          // homepHX (0:9368)
          width: double.infinity,
          height: 320 * fem,

          decoration: BoxDecoration(
            color: Color(0xff0D0D0D),
          ),
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
                ),
              ),
              Positioned(
                // iconnotificationxAm (0:9772)
               right: 30*fem,
                top: 275 * fem,
                child: Align(
                  child: SizedBox(
                      width: 45 * fem,
                      height: 45 * fem,
                      child: InkWell(
                          onTap: () async {
                            DateTime? dateTime = await showDatePicker(
                                context: context,
                                initialDate: selectedDate,
                                firstDate: start(),
                                lastDate: end(),
                              builder: (context, child) {
                                return Theme(
                                  data: ThemeData.dark(), // This will change to light theme.
                                  child: child!,
                                );
                              },

                                // builder: (context, child) {
                                //   // return Theme(
                                //   //   data: Theme.of(context).copyWith(
                                //   //     colorScheme: ColorScheme.dark(
                                //   //       primary: Color(0x50FFFFFF)
                                //   //       // <-- SEE HERE
                                //   //     ),
                                //   //     textButtonTheme: TextButtonThemeData(
                                //   //       style: TextButton.styleFrom(
                                //   //         primary: Color(
                                //   //             0xff0D0D0D), // button text color
                                //   //       ),
                                //   //     ),
                                //   //   ),
                                //   //   child: child!,
                                //   // );
                                // }
                                );
                            selectedDate = dateTime!;
                            newDate = dateTime!;

                            setState(() {
                              current = getHalf();
                            });
                          },
                          child: Container(
                            width: 45 * fem,
                            height: 45 * fem,
                            decoration: BoxDecoration(
                              color: Color(0x10FFFFFF),
                              borderRadius: BorderRadius.circular(16 * fem),
                            ),
                            child: Image.asset(
                              'assets/images/icon-notification-calendar.png',
                              width: 45 * fem,
                              height: 45 * fem,
                              color: Color(0xff53E88B),
                            ),
                          ))),
                ),
              ),
              // Positioned(
              //   // iconnotificationxAm (0:9772)
              //   right: 30 * fem,
              //   top: 30 * fem,
              //   child: Align(
              //     child: SizedBox(
              //         width: 45 * fem,
              //         height: 45 * fem,
              //         child: InkWell(
              //             onTap: () {
              //               showDialog(
              //                   context: context,
              //                   builder: (BuildContext context) {
              //                     return AlertDialog(
              //                       backgroundColor: Color(0xff0D0D0D),
              //                       shape: RoundedRectangleBorder(
              //                           borderRadius:
              //                               BorderRadius.circular(16)),
              //                       content:
              //                           setupAlertDialoadContainer(context),
              //                     );
              //                   });
              //             },
              //             child: Container(
              //               width: 45 * fem,
              //               height: 45 * fem,
              //               decoration: BoxDecoration(
              //                 color: Color(0x20FFFFFF),
              //                 borderRadius: BorderRadius.circular(16 * fem),
              //               ),
              //               child: Icon(
              //                 Icons.notifications_none,
              //                 size: 30,
              //                 color: Color(0xff53E88B),
              //               ),
              //             ))),
              //   ),
              // ),


              Positioned(
                // iconnotificationxAm (0:9772)
                right: 30 * fem,
                top: 30 * fem,
                child: Align(
                  child: SizedBox(
                      width: 45 * fem,
                      height: 45 * fem,
                      child: InkWell(
                          onTap: () async {

                            final isAuthenticated = await LocalAuthApi.authenticate();
                            if (isAuthenticated)
                              showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SizedBox(

                                      // decoration: BoxDecoration(
                                      //   borderRadius: BorderRadius.circular(24),
                                      //   color: Colors.black87,
                                      // ),
                                      height: 250,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 40,
                                                ),
                                                Container(height: 80,
                                                  child: SfBarcodeGenerator(value: getCurrentUsername(),showValue: false,barColor: Colors.black,),
                                                    ),
                                                // QrImageView(
                                                //   data: getCurrentUsername(),
                                                //   size: 300,
                                                //   backgroundColor: Color(0xffFFFFFF),
                                                // ),
                                                SizedBox(
                                                  height: 30,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(

                                                    borderRadius:
                                                    BorderRadius.circular(15 * fem),
                                                    color: Colors.black87
                                                  ),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Icon(
                                                      Icons.arrow_back_ios_new,
                                                      size: 30,
                                                      color: Color(0xff53E88B),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )),
                                      )

                                    );
                                  });

                          },
                          child: Container(
                            width: 45 * fem,
                            height: 45 * fem,
                            decoration: BoxDecoration(
                              color: Color(0x20FFFFFF),
                              borderRadius: BorderRadius.circular(16 * fem),
                            ),
                            child: Icon(
                              Icons.qr_code_scanner_rounded,
                              size: 30,
                              color: Color(0xff53E88B),
                            ),
                          ))),
                ),
              ),
              Positioned(
                // tiiitletext3xu (0:9775)
                left: 30 * fem,
                top: 100 * fem,
                child: SvgPicture.asset(
                  'assets/images/frame14.svg',


                ),
              ),
              Positioned(
                // tiiitletext3xu (0:9775)
                left: 30 * fem,
                top: 275 * fem,

                child: Align(
                  child: SizedBox(
                    width: 200 * fem,
                    height: 82 * fem,
                    child: Text(
                      date(newDate) +
                          // newDate.day.toString()+"-"+newDate.month.toString()+
                          ' Menu',
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 30 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.3102273018 * ffem / fem,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Container(width: double.infinity,
        //   height: 20*fem,
        //   decoration: BoxDecoration (
        //     color: Colors.black,
        //
        //   ),
        // child: SizedBox(height: 20,),),
        Container(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          width: double.infinity,
          height: 350 * fem,
          decoration: BoxDecoration(
            color: Color(0xffF0D0D0D),
          ),
          child: Stack(

            children:[
              Positioned(
                child: ListView(
                  children: [
                    CarouselSlider(
                      items: [
                        Container(
                            alignment: Alignment.topCenter,
                            // padding: EdgeInsets.fromLTRB(39*fem, 16*fem, 40*fem, 16*fem),
                            width: 250 * fem,
                            decoration: BoxDecoration(
                              color: Color(0x10FFFFFF),
                              borderRadius: BorderRadius.circular(15 * fem),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'Breakfast',
                                  style: SafeGoogleFont(
                                    'Viva',
                                    fontSize: 36 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.3102273305 * ffem / fem,
                                    color: Color(0xffFFFFFF),
                                  ),
                                ),

                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 240,
                                  child: FutureBuilder<List<List<String>>>(
                                    future: futureMenu,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return ListView.builder(
                                          itemCount: 1,
                                          itemBuilder: (context, rowIndex) {
                                            return ListTile(
                                                title: Center(
                                                  child: Column(
                                                    children: snapshot.data![current]
                                                        .skip(3)
                                                        .take(9)
                                                        .map((item) => Container(
                                                      padding: EdgeInsets.all(4),
                                                      child: Text(
                                                        item,
                                                        overflow:
                                                        TextOverflow.ellipsis,
                                                        softWrap: false,
                                                        style: TextStyle(
                                                            color:
                                                            Color(0xffFFFFFF).withOpacity(0.5),
                                                            fontSize: 16),
                                                      ),
                                                    ))
                                                        .toList(),
                                                  ),
                                                ));
                                          },
                                        );
                                      } else if (snapshot.hasError) {
                                        return Center(
                                            child: Text("An error occurred"));
                                      }

                                      return SpinKitPulsingGrid(
                                        color: Color(0xff2DD293).withOpacity(0.5),
                                        size: 40.0,
                                      );
                                    },
                                  ),
                                ),

                                // Text(
                                //   _data[1][newDate.day-1],
                                //   style: SafeGoogleFont (
                                //     'Inter',
                                //     fontSize: 16 *ffem,
                                //     fontWeight: FontWeight.w400,
                                //     height: 1.3102273305*ffem/fem,
                                //     color: Color(0xffffffff),
                                //   ),
                                // ),
                                // const SizedBox(height: 5,),
                                // Text(
                                //   _data[2][newDate.day-1],
                                //   style: SafeGoogleFont (
                                //     'Inter',
                                //     fontSize: 16 *ffem,                             fontWeight: FontWeight.w400,
                                //     height: 1.3102273305*ffem/fem,
                                //     color: Color(0xffffffff),
                                //   ),
                                // ),
                                // const SizedBox(height: 5,),
                                // Text(
                                //   _data[3][newDate.day-1],
                                //   style: SafeGoogleFont (
                                //     'Inter',
                                //     fontSize: 16 *ffem,                             fontWeight: FontWeight.w400,
                                //     height: 1.3102273305*ffem/fem,
                                //     color: Color(0xffffffff),
                                //   ),
                                // ),
                                // const SizedBox(height: 5,),
                                // Text(
                                //   _data[4][newDate.day-1],
                                //   style: SafeGoogleFont (
                                //     'Inter',
                                //     fontSize: 16 *ffem,                             fontWeight: FontWeight.w400,
                                //     height: 1.3102273305*ffem/fem,
                                //     color: Color(0xffffffff),
                                //   ),
                                // ),
                                // const SizedBox(height: 5,),
                                // Text(
                                //   _data[5][newDate.day-1],
                                //   style: SafeGoogleFont (
                                //     'Inter',
                                //     fontSize: 16 *ffem,                             fontWeight: FontWeight.w400,
                                //     height: 1.3102273305*ffem/fem,
                                //     color: Color(0xffffffff),
                                //   ),
                                // ),
                                // const SizedBox(height: 5,),
                                // Text(
                                //   _data[6][newDate.day-1],
                                //   style: SafeGoogleFont (
                                //     'Inter',
                                //     fontSize: 16 *ffem,                             fontWeight: FontWeight.w400,
                                //     height: 1.3102273305*ffem/fem,
                                //     color: Color(0xffffffff),
                                //   ),
                                // ),
                                // const SizedBox(height: 5,),
                                // Text(
                                //   _data[7][newDate.day-1],
                                //   style: SafeGoogleFont (
                                //     'Inter',
                                //     fontSize: 16 *ffem,                             fontWeight: FontWeight.w400,
                                //     height: 1.3102273305*ffem/fem,
                                //     color: Color(0xffffffff),
                                //   ),
                                // ),
                                // const SizedBox(height: 5,),
                                // Text(
                                //   _data[8][newDate.day-1],
                                //   style: SafeGoogleFont (
                                //     'Inter',
                                //     fontSize: 16 *ffem,                             fontWeight: FontWeight.w400,
                                //     height: 1.3102273305*ffem/fem,
                                //     color: Color(0xffffffff),
                                //   ),
                                // ),
                                // const SizedBox(height: 5,),
                                // Text(
                                //   _data[9][newDate.day-1],
                                //   style: SafeGoogleFont (
                                //     'Inter',
                                //     fontSize: 16 *ffem,                             fontWeight: FontWeight.w400,
                                //     height: 1.3102273305*ffem/fem,
                                //     color: Color(0xffffffff),
                                //   ),
                                // ),
                              ],
                            )),

                        Container(
                            alignment: Alignment.center,
                            // padding: EdgeInsets.fromLTRB(40*fem, 16*fem, 40*fem, 16*fem),
                            width: 250 * fem,
                            height: 100 * fem,
                            decoration: BoxDecoration(

                              color: Color(0x10FFFFFF),
                              borderRadius: BorderRadius.circular(15 * fem),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'Lunch',
                                  style: SafeGoogleFont(
                                    'Viva',
                                    fontSize: 36 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.3102273305 * ffem / fem,
                                    color: Color(0xffFFFFFF),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 235,
                                  child: FutureBuilder<List<List<String>>>(
                                    future: futureMenu,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return ListView.builder(
                                          itemCount: 1,
                                          itemBuilder: (context, rowIndex) {
                                            return ListTile(
                                                title: Center(
                                                  child: Column(
                                                    children: snapshot.data![current]
                                                        .skip(14)
                                                        .take(8)
                                                        .map((item) => Container(
                                                      padding: EdgeInsets.all(4),
                                                      child: Text(
                                                        item,
                                                        overflow:
                                                        TextOverflow.ellipsis,
                                                        softWrap: false,
                                                        style: TextStyle(
                                                            color:
                                                            Color(0xffFFFFFF).withOpacity(0.5),
                                                            fontSize: 16),
                                                      ),
                                                    ))
                                                        .toList(),
                                                  ),
                                                ));
                                          },
                                        );
                                      } else if (snapshot.hasError) {
                                        return Center(
                                            child: Text("An error occurred"));
                                      }

                                      return SpinKitPulsingGrid(
                                        color: Color(0xff2DD293).withOpacity(0.5),
                                        size: 40.0,
                                      );
                                    },
                                  ),
                                ),
                                // Text(
                                //   _data[12][newDate.day-1],
                                //   style: SafeGoogleFont (
                                //     'Inter',
                                //     fontSize: 16 *ffem,                               fontWeight: FontWeight.w400,
                                //     height: 1.3102273305*ffem/fem,
                                //     color: Color(0xffffffff),
                                //   ),
                                // ),
                                // const SizedBox(height: 5,),
                                // Text(
                                //   _data[13][newDate.day-1],
                                //   style: SafeGoogleFont (
                                //     'Inter',
                                //     fontSize: 16 *ffem,                               fontWeight: FontWeight.w400,
                                //     height: 1.3102273305*ffem/fem,
                                //     color: Color(0xffffffff),
                                //   ),
                                // ),
                                // const SizedBox(height: 5,),
                                // Text(
                                //   _data[14][newDate.day-1],
                                //   style: SafeGoogleFont (
                                //     'Inter',
                                //     fontSize: 16 *ffem,                               fontWeight: FontWeight.w400,
                                //     height: 1.3102273305*ffem/fem,
                                //     color: Color(0xffffffff),
                                //   ),
                                // ),
                                // const SizedBox(height: 5,),
                                // Text(
                                //   _data[15][newDate.day-1],
                                //   style: SafeGoogleFont (
                                //     'Inter',
                                //     fontSize: 16 *ffem,                               fontWeight: FontWeight.w400,
                                //     height: 1.3102273305*ffem/fem,
                                //     color: Color(0xffffffff),
                                //   ),
                                // ),
                                // const SizedBox(height: 5,),
                                // Text(
                                //   _data[16][newDate.day-1],
                                //   style: SafeGoogleFont (
                                //     'Inter',
                                //     fontSize: 16 *ffem,                               fontWeight: FontWeight.w400,
                                //     height: 1.3102273305*ffem/fem,
                                //     color: Color(0xffffffff),
                                //   ),
                                // ),
                                // const SizedBox(height: 5,),
                                // Text(
                                //   _data[17][newDate.day-1],
                                //   style: SafeGoogleFont (
                                //     'Inter',
                                //     fontSize: 16 *ffem,                               fontWeight: FontWeight.w400,
                                //     height: 1.3102273305*ffem/fem,
                                //     color: Color(0xffffffff),
                                //   ),
                                // ),
                                // const SizedBox(height: 5,),
                                // Text(
                                //   _data[18][newDate.day-1],
                                //   style: SafeGoogleFont (
                                //     'Inter',
                                //     fontSize: 16 *ffem,                               fontWeight: FontWeight.w400,
                                //     height: 1.3102273305*ffem/fem,
                                //     color: Color(0xffffffff),
                                //   ),
                                // ),
                                // const SizedBox(height: 5,),
                                // Text(
                                //   _data[19][newDate.day-1],
                                //   style: SafeGoogleFont (
                                //     'Inter',
                                //     fontSize: 16 *ffem,                               fontWeight: FontWeight.w400,
                                //     height: 1.3102273305*ffem/fem,
                                //     color: Color(0xffffffff),
                                //   ),
                                // ),
                              ],
                            )),
                        Container(
                            alignment: Alignment.center,
                            // padding: EdgeInsets.fromLTRB(39*fem, 16*fem, 40*fem, 16*fem),
                            width: 250 * fem,
                            height: 350 * fem,
                            decoration: BoxDecoration(

                              color: Color(0x10FFFFFF),
                              borderRadius: BorderRadius.circular(15 * fem),
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: 5,),
                                Text(
                                  'Dinner',
                                  style: SafeGoogleFont(
                                    'Viva',
                                    fontSize: 36 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.3102273305 * ffem / fem,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 235,
                                  child: FutureBuilder<List<List<String>>>(
                                    future: futureMenu,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return ListView.builder(
                                          itemCount: 1,
                                          itemBuilder: (context, rowIndex) {
                                            return ListTile(
                                                title: Center(
                                                  child: Column(
                                                    children: snapshot.data![current]
                                                        .skip(24)
                                                        .take(7)
                                                        .map((item) => Container(
                                                      padding: EdgeInsets.all(4),
                                                      child: Text(
                                                        item,
                                                        overflow:
                                                        TextOverflow.ellipsis,
                                                        softWrap: false,
                                                        style: TextStyle(
                                                            color:
                                                            Color(0xffFFFFFF).withOpacity(0.5),
                                                            fontSize: 16),
                                                      ),
                                                    ))
                                                        .toList(),
                                                  ),
                                                ));
                                          },
                                        );
                                      } else if (snapshot.hasError) {
                                        return Center(
                                            child: Text("An error occurred"));
                                      }

                                      return SpinKitPulsingGrid(
                                        color: Color(0xff2DD293).withOpacity(0.5),
                                        size: 40.0,
                                      );
                                      // return Shimmer.fromColors(
                                      //   baseColor: Colors.white10,
                                      //   highlightColor: Colors.white,
                                      //   child: Text(
                                      //     'Loading ...',
                                      //     style: TextStyle(
                                      //       fontSize: 24,
                                      //       fontWeight: FontWeight.bold,
                                      //     ),
                                      //   ),
                                      // );
                                    },
                                  ),
                                ),
                                // Text(
                                //   _data[22][newDate.day-1],
                                //   style: SafeGoogleFont (
                                //     'Inter',
                                //     fontSize: 16 *ffem,                               fontWeight: FontWeight.w400,
                                //     height: 1.3102273305*ffem/fem,
                                //     color: Color(0xffffffff),
                                //   ),
                                // ),
                                // const SizedBox(height: 5,),
                                // Text(
                                //   _data[23][newDate.day-1],
                                //   style: SafeGoogleFont (
                                //     'Inter',
                                //     fontSize: 16 *ffem,                               fontWeight: FontWeight.w400,
                                //     height: 1.3102273305*ffem/fem,
                                //     color: Color(0xffffffff),
                                //   ),
                                // ),
                                // const SizedBox(height: 5,),
                                // Text(
                                //   _data[24][newDate.day-1],
                                //   style: SafeGoogleFont (
                                //     'Inter',
                                //     fontSize: 16 *ffem,                               fontWeight: FontWeight.w400,
                                //     height: 1.3102273305*ffem/fem,
                                //     color: Color(0xffffffff),
                                //   ),
                                // ),
                                // const SizedBox(height: 5,),
                                // Text(
                                //   _data[25][newDate.day-1],
                                //   style: SafeGoogleFont (
                                //     'Inter',
                                //     fontSize: 16 *ffem,                               fontWeight: FontWeight.w400,
                                //     height: 1.3102273305*ffem/fem,
                                //     color: Color(0xffffffff),
                                //   ),
                                // ),
                                // const SizedBox(height: 5,),
                                // Text(
                                //   _data[26][newDate.day-1],
                                //   style: SafeGoogleFont (
                                //     'Inter',
                                //     fontSize: 16 *ffem,                               fontWeight: FontWeight.w400,
                                //     height: 1.3102273305*ffem/fem,
                                //     color: Color(0xffffffff),
                                //   ),
                                // ),
                                // const SizedBox(height: 5,),
                                // Text(
                                //   _data[27][newDate.day-1],
                                //   style: SafeGoogleFont (
                                //     'Inter',
                                //     fontSize: 16 *ffem,                               fontWeight: FontWeight.w400,
                                //     height: 1.3102273305*ffem/fem,
                                //     color: Color(0xffffffff),
                                //   ),
                                // ),
                                // const SizedBox(height: 5,),
                                // Text(
                                //   _data[28][newDate.day-1],
                                //   style: SafeGoogleFont (
                                //     'Inter',
                                //     fontSize: 16 *ffem,                               fontWeight: FontWeight.w400,
                                //     height: 1.3102273305*ffem/fem,
                                //     color: Color(0xffffffff),
                                //   ),
                                // ),
                              ],
                            )),

                        //1st Image of Slider
                      ],

                      //Slider Container properties
                      options: CarouselOptions(
                        height: 310.0,
                        enlargeCenterPage: true,
                        autoPlay: false,
                        initialPage: getinitialpage(),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: false,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 0.7,

                      ),
                    ),
                  ],
                ),
              )
            ]
          )

        ),
        // Container(
        //   color: Color(0xffFFEEDD),
        //   height: 77,
        //   child: Column(
        //     children: [
        //       SizedBox(
        //         height: 10,
        //       ),
        //       Container(
        //           width: 60 * fem,
        //           height: 60 * fem,
        //           decoration: BoxDecoration(
        //             border: Border.all(color: Color(0xffDA6317)),
        //             color: Color(0x30DF6F20),
        //             borderRadius: BorderRadius.circular(16 * fem),
        //           ),
        //           child: GestureDetector(
        //             onTap: () async {
        //               final isAuthenticated = await LocalAuthApi.authenticate();
        //               if (isAuthenticated)
        //                 showModalBottomSheet(
        //                     context: context,
        //                     builder: (BuildContext context) {
        //                       return Container(
        //                         decoration: BoxDecoration(
        //                           borderRadius: BorderRadius.circular(24),
        //                           color: Color(0x80FEC584),
        //                         ),
        //                         height: 400,
        //                         child: Center(
        //                             child: Column(
        //                           children: [
        //                             SizedBox(
        //                               height: 30,
        //                             ),
        //                             QrImageView(
        //                               data: getCurrentUsername(),
        //                               size: 300,
        //                               backgroundColor: Color(0xffFFEEDD),
        //                             ),
        //                             SizedBox(
        //                               height: 20,
        //                             ),
        //                             Container(
        //                               padding: EdgeInsets.all(10),
        //                               decoration: BoxDecoration(
        //                                 border: Border.all(
        //                                     color: Color(0xffDA6317)),
        //                                 color: Color(0x19ffffff),
        //                                 borderRadius:
        //                                     BorderRadius.circular(15 * fem),
        //                               ),
        //                               child: GestureDetector(
        //                                 onTap: () {
        //                                   Navigator.pop(context);
        //                                 },
        //                                 child: Icon(
        //                                   Icons.arrow_back_ios_new,
        //                                   color: Color(0x30DF6F20),
        //                                 ),
        //                               ),
        //                             )
        //                           ],
        //                         )),
        //                       );
        //                     });
        //             },
        //             child: Icon(
        //               Icons.qr_code_2,
        //               size: 50,
        //               color: Color(0xffDA6317),
        //             ),
        //           ))
        //     ],
        //   ),
        // )
      ]),
    );
  }
}
