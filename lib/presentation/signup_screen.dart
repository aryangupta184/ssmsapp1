import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:ssmsapp1/presentation/home_screen.dart';
import 'package:ssmsapp1/presentation/master.dart';
import 'package:ssmsapp1/routes/app_routes.dart';
import 'package:ssmsapp1/utils.dart';
import 'package:ssmsapp1/resources/auth_methods.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
class _FeedbackPopup2 extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();


  TextEditingController messnameController = TextEditingController();
  TextEditingController foodnameController = TextEditingController();
  TextEditingController feedbackController = TextEditingController();

  // Method to Submit Feedback and save it in Google Sheets





  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Material(
            borderRadius: BorderRadius.circular(16),
            color: Color(0xff53E88B),
            child: SizedBox(
                height: 510,
                child: Padding(

                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Form(
                              key: _formKey,
                              child:
                              Padding(padding: EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Menu Item Feedback",
                                        textAlign: TextAlign.right,
                                        style: SafeGoogleFont(
                                          'Viga',
                                          fontSize: 28 ,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,

                                        ),

                                      ),
                                    ),
                                    SizedBox(height: 30,),
                                    TextFormField(

                                      controller: messnameController,
                                      validator: (value) {
                                        if (value.toString().isEmpty) {
                                          return 'Enter Valid Name';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          labelText: 'Mess Name',
                                          fillColor: Colors.white.withOpacity(0.3),
                                          filled: true,
                                          prefixIcon: Icon(
                                              Icons.room_rounded

                                          ),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8)
                                          )


                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    TextFormField(
                                      controller: foodnameController,


                                      decoration: InputDecoration(
                                          labelText: 'Food Name',
                                          fillColor: Colors.white.withOpacity(0.3),
                                          filled: true,
                                          prefixIcon: Icon(
                                              Icons.person

                                          ),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8)
                                          )


                                      ),

                                    ),
                                    SizedBox(height: 10,),

                                    TextFormField(
                                      maxLines: 3,
                                      controller: feedbackController,
                                      validator: (value) {
                                        if (value.toString().isEmpty) {
                                          return 'Enter Valid Feedback';
                                        }
                                        return null;
                                      },
                                      keyboardType: TextInputType.multiline,
                                      decoration: InputDecoration(
                                          labelText: 'Feedback',
                                          fillColor: Colors.white.withOpacity(0.3),
                                          filled: true,
                                          prefixIcon: Icon(
                                              Icons.format_align_center

                                          ),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8)
                                          )

                                      ),
                                    ),
                                  ],
                                ),
                              )
                          ),
                          SizedBox(height: 30,),
                          ElevatedButton(

                            onPressed: () async {
                              // Validate form
                              if (_formKey.currentState!.validate()) {
                                // Get values from controllers
                                String messName = messnameController.text;
                                String foodName = foodnameController.text;
                                String feedback = feedbackController.text;

                                // Add feedback to Firestore collection
                                await FirebaseFirestore.instance.collection('messfeedback').add({
                                  'messName': messName,
                                  'foodName': foodName,
                                  'feedback': feedback,
                                  'timestamp': FieldValue.serverTimestamp(), // Optional: Include a timestamp
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Feedback Submitted Successfully!',style: TextStyle(color: Color(0xff53E88B)),),
                                    duration: Duration(seconds: 2),
                                  ),
                                );

                                // Close the feedback form
                                Navigator.of(context).pop();
                              }
                            },
                            child: Text('Submit Feedback'),
                          ),
                        ],
                      ),)))


        )
    );
  }
}
class DinnerProcessor {
  bool dinnerEncountered = false;

  String item(String item) {
    // Convert the input to lowercase for case-insensitive comparison


    if (dinnerEncountered || isDayOfWeek(item)) {
      dinnerEncountered = true;
      return ""; // Return empty string for "dinner" or any day of the week
    } else {
      return item; // Return the input string otherwise
    }
  }

  bool isDayOfWeek(String input) {
    // List of days of the week
    List<String> daysOfWeek = ["SUNDAY", "MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY", "FRIDAY", "SATURDAY"];


    return daysOfWeek.contains(input);
  }
}

int current = 0;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late Future<List<List<String>>> futureMenu;
  void initState() {
    super.initState();
    futureMenu = fetchRowwiseMenu();
    current = getHalf();
  }

  getHalf() {
    if (newDate.day.toInt() >= 16) {
      return -16 + newDate.day.toInt();
    } else {
      return -1 + newDate.day.toInt();
    }
  }

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

  Future<int> GoogleLogin(BuildContext context, [bool mounted = true]) async {
    await FirebaseServices().signInWithGoogle();
    final FirebaseAuth _auth = FirebaseAuth.instance;
    if (_auth.currentUser!.email!
        .toString()
        .endsWith('@pilani.bits-pilani.ac.in')) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => MasterScreen(),
      ));
    } else {
      await FirebaseServices().signOut();
      await AuthMethods().signOut();
      showDialog(
          barrierDismissible: true,
          context: context,
          builder: (_) {
            return Dialog(
              backgroundColor: Colors.black.withOpacity(0.7),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'BITS Mail Only!',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            );
          });
    }

    // Navigator.of(context).pop();

    if (!mounted)
      return 1;
    else
      return 2;
  }

  String date(newDate) {
    if (newDate.day == DateTime.now().day) {
      return "Today\'s";
    } else {
      return newDate.day.toString() + "-" + newDate.month.toString();
    }
  }

  DateTime start() {
    DateTime now = DateTime.now();
    if (now.day > 15) {
      DateTime dateOf16th = DateTime(now.year, now.month, 16);
      return dateOf16th;
    } else {
      DateTime dateOf1th = DateTime(now.year, now.month, 1);
      return dateOf1th;
    }
  }

  DateTime end() {
    DateTime now = DateTime.now();
    if (now.day > 15) {
      DateTime dateOf16th = DateTime(now.year, now.month, 31);
      return dateOf16th;
    } else {
      DateTime dateOf1th = DateTime(now.year, now.month, 15);
      return dateOf1th;
    }
  }

  DateTime selectedDate = DateTime.now();
  DateTime newDate = DateTime.now();
  bool _isLoading = false;

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
          padding: EdgeInsets.fromLTRB(25 * fem, 31 * fem, 25 * fem, 0 * fem),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xff0D0D0D),
            image: DecorationImage(
              alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth,
              image: AssetImage(
                'assets/images/pattern-bg.png',
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(
                    37.5 * fem, 0 * fem, 37.5 * fem, 0 * fem),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 35,
                    ),
                    Container(
                      width: double.infinity,
                      height: 110 * fem,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0 * fem,
                            top: 0 * fem,
                            child: Center(
                              child: SizedBox(
                                width: 280 * fem,
                                height: 120 * fem,
                                child:
                                 Text(
                                    'ssms ',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont(
                                      'Viga',
                                      fontSize: 80 * ffem,
                                      color: Color(0xFF53E88B),
                                      fontWeight: FontWeight.w400,
                                      height: 1.345 * ffem / fem,
                                      letterSpacing: 0.5 * fem,
                                    ),

                                ),

                              ),
                            ),
                          ),
                          Positioned(
                            left: 0 * fem,
                            top: 90 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 250 * fem,
                                height: 16 * fem,
                                child: Text(
                                  'Society for Student Mess Services',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 13 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2125 * ffem / fem,
                                    letterSpacing: 1 * fem,
                                    color: Colors.white,
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
              Container(
                margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0 * fem),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: 400.0,
                            height: 100.0,
                            child: Align(
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
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: 50.0,
                            height: 100.0,
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                  onTap: () async {
                                    DateTime? dateTime = await showDatePicker(
                                      context: context,
                                      initialDate: selectedDate,
                                      firstDate: start(),
                                      lastDate: end(),
                                      builder: (context, child) {
                                        return Theme(
                                          data: ThemeData
                                              .dark(), // This will change to light theme.
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
                                      borderRadius:
                                          BorderRadius.circular(16 * fem),
                                    ),
                                    child: Image.asset(
                                      'assets/images/icon-notification-calendar.png',
                                      width: 45 * fem,
                                      height: 45 * fem,
                                      color: Color(0xff53E88B),
                                    ),
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 380,
                      width: double.infinity,
                      child: ListView(
                        children: [
                          CarouselSlider(
                            items: [
                              InkWell(
                                onTap: (){
                                  showDialog(
                                    context: context,
                                    builder: (context) => Center(
                                      child:_FeedbackPopup2(),
                                    ),
                                  );

                                },
                                child: Container(
                                    alignment: Alignment.topCenter,
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                                            fontSize: 40 * ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.3102273305 * ffem / fem,
                                            color: Color(0xffFFFFFF),
                                          ),
                                        ),


                                        Container(
                                          height: 240,
                                          child: FutureBuilder<List<List<String>>>(
                                            future: futureMenu,
                                            builder: (context, snapshot) {
                                              if (snapshot.hasData) {
                                                DinnerProcessor processor = DinnerProcessor();
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
                                                                processor.item(item),
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
                                        SizedBox(height: 10,),
                                        Text("Click for feedback...",style: TextStyle(color: Color(0xff53E88B).withOpacity(0.7)),)

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
                              ),

                              InkWell(
                                onTap: (){

                                  showDialog(
                                    context: context,
                                    builder: (context) => Center(
                                      child:_FeedbackPopup2(),
                                    ),
                                  );

                                },
                                child: Container(

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
                                            fontSize: 40 * ffem,
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
                                                DinnerProcessor processor = DinnerProcessor();
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
                                                                processor.item(item),
                                                                overflow:
                                                                TextOverflow.ellipsis,
                                                                softWrap: false,
                                                                style: TextStyle(
                                                                    color:
                                                                    Color(0xffFFFFFF).withOpacity(0.5),
                                                                    fontSize: 18),
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
                                        Text("Click for feedback...",style: TextStyle(color: Color(0xff53E88B).withOpacity(0.5)),)

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
                              ),
                              InkWell(
                                onTap: (){
                                  showDialog(
                                    context: context,
                                    builder: (context) => Center(
                                      child:_FeedbackPopup2(),
                                    ),
                                  );

                                },
                                child: Container(
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
                                            fontSize: 40 * ffem,
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
                                                DinnerProcessor processor = DinnerProcessor();
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
                                                                processor.item(item),
                                                                overflow:
                                                                TextOverflow.ellipsis,
                                                                softWrap: false,
                                                                style: TextStyle(
                                                                    color:
                                                                    Color(0xffFFFFFF).withOpacity(0.5),
                                                                    fontSize: 18),
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
                                        Text("Click for feedback...",style: TextStyle(color: Color(0xff53E88B).withOpacity(0.7)),)

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
                              )
                              //1st Image of Slider
                            ],

                            //Slider Container properties
                            options: CarouselOptions(
                              height: 330.0,
                              enlargeCenterPage: true,
                              autoPlay: false,
                              initialPage: getinitialpage(),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enableInfiniteScroll: false,
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 800),
                              viewportFraction: 0.6,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          2 * fem, 20 * fem, 0 * fem, 10 * fem),
                      child: Text(
                        'Or Continue With',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: 12 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.6652272542 * ffem / fem,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.fromLTRB(
                            2 * fem, 5 * fem, 0 * fem, 30 * fem),
                        padding: EdgeInsets.fromLTRB(
                            20 * fem, 16 * fem, 17 * fem, 16.09 * fem),
                        width: 152 * fem,
                        height: 57 * fem,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15 * fem),
                        ),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // googleicon1PRB (0:7680)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 10 * fem, 0 * fem),
                                width: 24.39 * fem,
                                height: 24.91 * fem,
                                child: Image.asset(
                                  'assets/images/google-icon.png',
                                  width: 24.39 * fem,
                                  height: 24.91 * fem,
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.fromLTRB(
                                      5 * fem, 3 * fem, 0 * fem, 0 * fem),
                                  child: InkWell(
                                    onTap: () {
                                      // Afterthe async operation, toggle the loading state back
                                      setState(() {
                                        _isLoading = !_isLoading;
                                      });
                                      Future.delayed(Duration(seconds: 2), () {
                                        GoogleLogin(context);
                                        setState(() {
                                          _isLoading = !_isLoading;
                                        });
                                      });

                                    },
                                    // onTap: () async {
                                    //   await GoogleLogin(context);
                                    //   Navigator.of(context)
                                    //       .pushReplacement(
                                    //       MaterialPageRoute(
                                    //         builder: (context) =>
                                    //          MasterScreen(),
                                    //       ));
                                    //
                                    // },
                                    child: Container(
                                      child: _isLoading
                                          ? Container(
                                        padding: EdgeInsets.fromLTRB(20*fem, 0*fem, 0*fem, 0*fem) ,

                                              child: SpinKitPulsingGrid(
                                                color: Color(0xff2DD293).withOpacity(0.5),
                                                size: 25.0,
                                              ),
                                            )
                                          : Text(
                                              'BITS Mail',
                                              style: SafeGoogleFont(
                                                'Inter',
                                                fontSize: 14 * ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.2125 * ffem / fem,
                                                letterSpacing: 0.5 * fem,
                                                color: Colors.white,
                                              ),
                                            ),
                                    ),
                                  )),
                            ])),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class FirebaseServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final _googleSignIn = GoogleSignIn();
  Future<bool> signInWithGoogle() async {
    bool res = false;

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      User? user = userCredential.user;

      if (user != null && isEmailAllowed("${user.email}")) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          _firestore.collection('users').doc(user.uid).set({
            'username': user.displayName,
            'uid': user.uid,
            'profilePhoto': user.photoURL,
            'email': user.email,
          });
        }
        res = true;
      }
    } on FirebaseAuthException catch (e) {
      res = false;
    }
    return res;
  }
  // signInWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
  //     if (googleSignInAccount != null) {
  //       final GoogleSignInAuthentication googleSignInAuthentication =
  //       await googleSignInAccount.authentication;
  //       final AuthCredential authCredential = GoogleAuthProvider.credential(
  //           accessToken: googleSignInAuthentication.accessToken,
  //           idToken: googleSignInAuthentication.idToken);
  //       await _auth.signInWithCredential(authCredential);
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     throw e;
  //   }
  // }

  signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

  bool isEmailAllowed(String? email) {
    // Check if the email ends with "@pilani.bits-pilani.ac.in"
    if (email != null &&
        email.toLowerCase().endsWith("@pilani.bits-pilani.ac.in")) {
      return true;
    }
    return false;
  }
}
