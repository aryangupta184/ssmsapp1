import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';
import 'package:ssmsapp1/resources/form_controller.dart';
import 'package:ssmsapp1/models/form.dart';



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
  final FirebaseAuth _auth = FirebaseAuth.instance;


  TextEditingController messnameController = TextEditingController();
  TextEditingController foodnameController = TextEditingController();
  TextEditingController feedbackController = TextEditingController();



  void _submitForm() {


      FeedbackForm feedbackForm = FeedbackForm(

          _auth.currentUser!.email.toString(),
          messnameController.text,
          foodnameController.text,
          feedbackController.text
      );

      FormController formController = FormController((String response){
        print("Response: $response");
        if(response == FormController.STATUS_SUCCESS){
          print("check excel");
          //

        } else {

        }
      });



      // Submit 'feedbackForm' and save it in Google Sheet

      formController.submitForm(feedbackForm);



  }

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
                                          fontSize: 28   ,
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
                              _submitForm();
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


class ListItem {
  String title;
  int likes;
  int dislikes;

  ListItem({
    required this.title,
    required this.likes,
    required this.dislikes,
  });
}


class LikesListView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('menurate').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }

        List<DocumentSnapshot> documents = snapshot.data!.docs;
        print(documents);

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
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Food Feedback",
                          textAlign: TextAlign.right,
                          style: SafeGoogleFont(
                            'Viga',
                            fontSize: 32 ,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,

                          ),

                        ),
                      ),
                      SizedBox(height: 15,),
                      Container(
                        height: 400,
                        child: ListView.builder(
                          itemCount: documents.length,
                          itemBuilder: (context, index) {
                            bool voted=false;
                            ListItem item = ListItem(
                              title: documents[index]['title'],
                              likes: documents[index]['likes'],
                              dislikes: documents[index]['dislikes'],
                            );

                            return ListTile(
                              title: Text(item.title),
                              subtitle: Text('Likes: ${item.likes}, Dislikes: ${item.dislikes}'),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.thumb_up),
                                    onPressed: () {
                                      voted?0:_handleLike(item, isThumbsUp: true);
                                      voted=true;
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.thumb_down),
                                    onPressed: () => _handleLike(item, isThumbsUp: false),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );




      },
    );
  }

  Future<void> _handleLike(ListItem item, {required bool isThumbsUp}) async {
    final int incrementValue = isThumbsUp ? 1 : -1;


    // Reference to the document
    final documentReference =
    FirebaseFirestore.instance.collection('menurate').doc(item.title);

    // Check if the document exists
    final documentSnapshot = await documentReference.get();
    if (documentSnapshot.exists) {
      // Document exists, update the fields
      await documentReference.update({
        'likes': item.likes + incrementValue,
        'dislikes': item.dislikes + (isThumbsUp ? 0 : incrementValue),
      });
    } else {
      // Document does not exist, create it with the specified ID and fields
      await documentReference.set({
        'title': item.title,
        'likes': isThumbsUp ? incrementValue : 0,
        'dislikes': isThumbsUp ? 0 : incrementValue,
      });
    }
  }
}
Widget card(String name, String time1,String time2,String time3, BuildContext context) {
  return Card(
      color: Color(0x20FFFFFF),
      margin: EdgeInsets.all(2.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),

      child: Container(
        margin: EdgeInsets.symmetric(vertical:4,horizontal: 6),
        padding:EdgeInsets.symmetric(vertical:6,horizontal: 4),
        child:Column(
          children: [

            AutoSizeText(
                name,

                style: SafeGoogleFont(
                  'viva',
                  fontSize: 28.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
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


            AutoSizeText(
              time1,

              style: SafeGoogleFont(
                'viva',
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1, // Limit the text to 2 lines

              // Handle overflow with ellipsis
            ),
              AutoSizeText(
                time2,

                style: SafeGoogleFont(
                  'viva',
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1, // Limit the text to 2 lines

                // Handle overflow with ellipsis
              ),
            AutoSizeText(
              time3,

              style: SafeGoogleFont(
                'viva',
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.w600,
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






          ],
        ) ,
      )

  );
}
class _TimePopup extends StatelessWidget {

  List<String> time1 =['7:30AM - 9:30AM','11:30AM - 1:30PM', '6:15PM - 8:15PM'];
  List<String> time2 =['8:00AM - 10:00AM ','12:00PM - 2:00PM', '8:00PM (Last Entry Time)'];
  List<String> time3 =['(Sundays and Holidays)','(Sundays and Holidays)',""];

  List<String> meal =['Breakfast','Lunch','Dinner'];



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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Mess Timings",
                      textAlign: TextAlign.right,
                      style: SafeGoogleFont(
                        'Viga',
                        fontSize: 32 ,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,

                      ),

                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    height: 400,
                    child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return card(meal[index],time1[index],time2[index],time3[index], context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

int current = 0;

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
          height: 300 * fem,

          decoration: BoxDecoration(
            color: Color(0xff0D0D0D),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 50 * fem,
                top: 80 * fem,
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


                    // Text(
                    //   'ssms ',
                    //   textAlign: TextAlign.center,
                    //   style: SafeGoogleFont(
                    //     'Viga',
                    //     fontSize: 80 * ffem,
                    //     color: Color(0xFF53E88B),
                    //     fontWeight: FontWeight.w400,
                    //     height: 1.345 * ffem / fem,
                    //     letterSpacing: 0.5 * fem,
                    //   ),
                    // ),
                  ),
                ),
              ),
              Positioned(
                left: 60 * fem,
                top: 170 * fem,
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
                top: 245 * fem,
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
                              color: Color(0x20FFFFFF),
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
                right: 90 * fem,
                top: 30 * fem,
                child: Align(
                  child: SizedBox(
                      width: 45 * fem,
                      height: 45 * fem,
                      child: InkWell(
                          onTap: () async {
                            showDialog(
                              context: context,
                              builder: (context) => Center(
                                child: _TimePopup(),
                              ),
                            );
                          },
                          child: Container(
                            width: 45 * fem,
                            height: 45 * fem,
                            decoration: BoxDecoration(
                              color: Color(0x20FFFFFF),
                              borderRadius: BorderRadius.circular(16 * fem),
                            ),
                            child: Icon(
                              Icons.watch_later_outlined,
                              size: 30,
                              color: Color(0xff53E88B),
                            ),
                          ))),
                ),
              ),


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
                                                Container(
                                                  width: 600,
                                                  height: 30,
                                                  child: FittedBox(

                                                    fit: BoxFit.fill,
                                                    // child: Text(
                                                    //   "Disabled for Shubh's Testing",
                                                    //   style: TextStyle(color: Colors.red),
                                                    // ),




                                                     child: SfBarcodeGenerator(value: getCurrentUsername(),showValue: false,barColor: Colors.black,),
                                                  ),
                                                ),

                                                // QrImageView(
                                                //   data: getCurrentUsername(),
                                                //   size: 300,
                                                //   backgroundColor: Color(0xffFFFFFF),
                                                // ),
                                                SizedBox(
                                                  height: 70,
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
              // Positioned(
              //   // tiiitletext3xu (0:9775)
              //   left: 30 * fem,
              //   top: 100 * fem,
              //   child: SvgPicture.asset(
              //     'assets/images/frame14.svg',
              //
              //
              //   ),
              // ),
              Positioned(
                // tiiitletext3xu (0:9775)
                left: 30 * fem,
                top: 245 * fem,

                child: Align(
                  child: SizedBox(
                    width: 200 * fem,
                    height: 82 * fem,
                    child: Text(
                      date(newDate) +
                          // newDate.day.toString()+"-"+newDate.month.toString()+
                          ' Menu',
                      style: SafeGoogleFont(
                        'Viva',
                        fontSize: 34 * ffem,
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
          height: 370 * fem,
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
