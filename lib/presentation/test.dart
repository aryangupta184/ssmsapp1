// import 'package:flutter/material.dart';
// import 'package:flutter/gestures.dart';
// import 'package:intl/intl.dart';
//
// import 'dart:ui';
// import 'package:csv/csv.dart';
//
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:local_auth/local_auth.dart';
// import 'package:ssmsapp1/resources/local_auth_service.dart';
// import 'package:ssmsapp1/resources/menu_method.dart';
// import 'package:ssmsapp1/utils.dart';
//
// import 'package:carousel_slider/carousel_slider.dart';
//
// import 'package:firebase_auth/firebase_auth.dart';
//
// import 'package:qr_flutter/qr_flutter.dart';
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
//   late final LocalAuthentication auth;
//   late final Future<List<MenuModel>> menu;
//
//   bool _supportState = false;
//   List<List<dynamic>> _data = [];
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//
//
//   // void _loadCSV() async {
//   //   final rawData = await rootBundle.loadString("assets/menu.csv");
//   //   List<List<dynamic>> listData = const CsvToListConverter().convert(rawData);
//   //   print(listData);
//   //   setState(() {
//   //     _data = listData;
//   //   });
//   //
//   // }
//   int getinitialpage() {
//     var datetime = DateTime.now();
//     var timeString = DateFormat('HH').format(datetime);
//     var time = int.parse(timeString);
//     if (10<time && 16>time){
//       return 1;
//
//     }
//     else if (time>22 || time<10){
//       return 0;
//
//     }
//     else{
//       return 2;
//     }
//
//
//   }
//
//
//
//   getCurrentUsername(){
//     if (_auth.currentUser!.displayName!=null){
//       return _auth.currentUser!.displayName!.toString();
//
//     }
//   }
//
//   Future<void> _authenticate() async {
//     try {
//       bool authenticated = await auth.authenticate(
//           localizedReason: 'Open QR',
//         options: AuthenticationOptions(
//           stickyAuth: true,
//           biometricOnly: true,
//         )
//       );
//     }  catch (e) {
//       print(e);
//
//     }
//
//
//
//   }
//
//   @override
//   void initState() {
//
//     super.initState();
//
//
//
//     auth = LocalAuthentication();
//     auth.isDeviceSupported().then((bool isSupported) => setState((){
//       _supportState=isSupported;
//
//     }));
//
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
//
//     var size = MediaQuery.of(context).size;
//
//
//     double baseWidth = 375;
//     double fem = MediaQuery.of(context).size.width / baseWidth;
//     double ffem = fem * 0.97;
//     return Material(
//       color: Colors.black,
//       child: Column(
//
//           children: [
//
//             Container(
//             // homepHX (0:9368)
//             width: double.infinity,
//             height: 275*fem,
//             decoration: BoxDecoration (
//               color: Colors.black,
//
//             ),
//             child: Stack(
//               children: [
//
//                 Positioned(
//                   // patternk4h (0:9371)
//                     left: 0*fem,
//                     top: 0*fem,
//                     child: Opacity(
//                       opacity: 0.2,
//                       child: Align(
//                         child: SizedBox(
//                           width: 375*fem,
//                           height: 200*fem,
//                           child: Image.asset(
//                             'assets/images/pattern-bg2_.png',
//                             width: 375*fem,
//                             height: 812*fem,
//                           ),
//                         ),
//                       ),
//                     )
//
//                 ),
//                 Positioned(
//                   // iconnotificationSiD (0:9765)
//                   left: 300*fem,
//                   top: 60*fem,
//                   child: Container(
//
//                     width: 45*fem,
//                     height: 45*fem,
//                     decoration: BoxDecoration (
//                       border: Border.all(color: Colors.deepPurpleAccent),
//                       color: Color(0xff252525),
//                       borderRadius: BorderRadius.circular(16*fem),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Color(0x7f010107),
//                           offset: Offset(0*fem, 0*fem),
//                           blurRadius: 25*fem,
//                         ),
//                       ],
//                     ),
//                     child: GestureDetector(
//                       onTap: () async {
//                         final isAuthenticated = await LocalAuthApi.authenticate();
//                         if(isAuthenticated)
//                         showModalBottomSheet(
//                           context: context,
//                           builder: (BuildContext context){
//                             return Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(24),
//
//                                 color: Colors.black87,
//                               ),
//
//
//
//
//                               height: 400,
//                               child: Center(
//                                   child: Column(
//                                     children: [
//                                       SizedBox(height: 30,),
//                                       QrImageView(
//                                         data: getCurrentUsername(),
//                                         size: 300,
//                                         backgroundColor: Colors.white,
//                                       ),
//                                       SizedBox(height: 20,),
//                                       Container(
//                                         padding: EdgeInsets.all(10),
//                                         decoration: BoxDecoration (
//                                           border: Border.all( color: Colors.deepPurpleAccent),
//                                           color: Color(0x19ffffff),
//                                           borderRadius: BorderRadius.circular(15*fem),
//                                           boxShadow: [
//                                             BoxShadow(
//                                               color: Color(0x115a6cea),
//                                               offset: Offset(12*fem, 26*fem),
//                                               blurRadius: 25*fem,
//                                             ),
//                                           ],
//                                         ),
//                                         child:GestureDetector(
//                                           onTap: (){
//                                             Navigator.pop(context);
//                                           },
//                                           child: Icon(Icons.arrow_back_ios_new,color: Colors.deepPurpleAccent,) ,
//                                         ),
//                                       )
//
//                                     ],
//                                   )
//
//                               ),
//                             );
//                           }
//
//                       );},
//                       child: Icon(Icons.qr_code_2,size: 30,color: Colors.white,),
//                     )
//                   ),
//                 ),
//                 Positioned(
//                   // iconnotificationxAm (0:9772)
//                   left: 300*fem,
//                   top: 220*fem,
//                   child: Align(
//                     child: SizedBox(
//
//                         width: 45*fem,
//                         height: 45*fem,
//                         child: InkWell(
//                           onTap: () async {
//                             DateTime? dateTime = await showDatePicker(
//                                 context: context, initialDate: selectedDate,
//                                 firstDate: DateTime(2020), lastDate: DateTime(2028),
//                                 builder: (context, child) {
//                                   return Theme(
//                                     data: Theme.of(context).copyWith(
//                                       colorScheme: ColorScheme.light(
//                                         primary: Color(0xff6256bf), // <-- SEE HERE
//                                         onPrimary: Color(0xffd256ff), // <-- SEE HERE
//                                         onSurface: Colors.deepPurpleAccent, // <-- SEE HERE
//                                       ),
//                                       textButtonTheme: TextButtonThemeData(
//                                         style: TextButton.styleFrom(
//                                           primary: Color(0xff6256bf), // button text color
//                                         ),
//                                       ),
//                                     ),
//                                     child: child!,
//                                   );
//                                 }
//
//
//                             );
//                             selectedDate=dateTime!;
//                             newDate=dateTime!;
//                             setState(() {
//
//                             });
//
//
//
//
//                           },
//                           child: Image.asset(
//                             'assets/images/icon-notification-calendar.png',
//                             width: 45*fem,
//                             height: 45*fem,
//                             color: Colors.deepPurpleAccent,
//                           ),
//                         )
//
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   // tiiitletext3xu (0:9775)
//                   left: 31*fem,
//                   top: 70*fem,
//                   child: Align(
//
//                     child: SizedBox(
//                       width: 200*fem,
//                       height: 82*fem,
//                       child: Text(
//                         'Your Expenses',
//                         style: SafeGoogleFont (
//                           'Inter',
//                           fontSize: 24*ffem,
//                           fontWeight: FontWeight.w400,
//                           height: 1.3102273018*ffem/fem,
//                           color: Color(0xffffffff),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 10*fem,
//                   top: 120*fem,
//                   child: Container(
//                     margin: EdgeInsets.symmetric(horizontal: 25),
//                     padding: EdgeInsets.all(15),
//                     height: 80,
//
//
//                     decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                             colors: [Color(0xffD256FF), Color(0xff6256BF)]),
//                         borderRadius: BorderRadius.circular(24)),
//                     child: Row(
//                         children: [
//
//                           Align(alignment: Alignment.center,child: Text('Rs. Cost',style: SafeGoogleFont (
//                             'Inter',
//                             fontSize: 24*ffem,
//                             fontWeight: FontWeight.w400,
//                             height: 1.3102273018*ffem/fem,
//                             color: Color(0xffffffff),
//                           ),),),
//                           SizedBox(
//                             width: 55,
//                           ),
//                           Align(alignment: Alignment.centerRight,child: Text(DateFormat.MMMM().format(DateTime.now()).toString(),style: SafeGoogleFont (
//                             'Inter',
//                             fontSize: 24*ffem,
//                             fontWeight: FontWeight.w400,
//                             height: 1.3102273018*ffem/fem,
//                             color: Colors.tealAccent,
//                           ),),),
//
//                         ]
//                     ),
//                   ),),
//                 Positioned(
//                   // tiiitletext3xu (0:9775)
//                   left: 31*fem,
//                   top: 230*fem,
//                   child: Align(
//                     child: SizedBox(
//                       width: 200*fem,
//                       height: 82*fem,
//                       child: Text(
//                         date(newDate)+
//                             // newDate.day.toString()+"-"+newDate.month.toString()+
//                             ' Menu',
//                         style: SafeGoogleFont (
//                           'Inter',
//                           fontSize: 24*ffem,
//                           fontWeight: FontWeight.w400,
//                           height: 1.3102273018*ffem/fem,
//                           color: Color(0xffffffff),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//
//
//
//
//
//
//
//
//               ],
//             ),
//           ),
//           // Container(width: double.infinity,
//           //   height: 20*fem,
//           //   decoration: BoxDecoration (
//           //     color: Colors.black,
//           //
//           //   ),
//           // child: SizedBox(height: 20,),),
//           Container(
//             padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
//             width: double.infinity,
//             height: 390*fem,
//             decoration: BoxDecoration (
//               color: Colors.black,
//
//             ),
//             child: ListView(
//               children: [
//                 CarouselSlider(
//                   items: [
//                     Container(
//                         alignment: Alignment.center,
//                         // padding: EdgeInsets.fromLTRB(39*fem, 16*fem, 40*fem, 16*fem),
//                         width: 250*fem,
//
//                         decoration: BoxDecoration (
//                           border: Border.all( color:Colors.deepPurpleAccent),
//                           color: Color(0x19ffffff),
//                           borderRadius: BorderRadius.circular(15*fem),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Color(0x115a6cea),
//                               offset: Offset(12*fem, 26*fem),
//                               blurRadius: 25*fem,
//                             ),
//                           ],
//                         ),
//                         child: Column(
//                           children: [
//                             Text(
//                               'Breakfast',
//                               style: SafeGoogleFont (
//                                 'Inter',
//                                 fontSize: 36 *ffem,
//                                 fontWeight: FontWeight.w500,
//                                 height: 1.3102273305*ffem/fem,
//                                 color: Colors.deepPurpleAccent,
//                               ),
//                             ),
//                             FutureBuilder<List<MenuModel>>(
//                               future: fetchMenu(),
//                               builder: (context, snapshot) {
//                                 if (snapshot.hasError) print(snapshot.error);
//                                 if(snapshot.hasData){
//                                   return ListView.builder(itemBuilder: (context,index){
//
//                                   });
//                                 }
//                                 else{
//                                   return Center(child: CircularProgressIndicator());
//                                 }
//
//                               },
//                             ),
//                             const SizedBox(height: 20,),
//                             Text(
//                               _data[1][newDate.day-1],
//                               style: SafeGoogleFont (
//                                 'Inter',
//                                 fontSize: 16 *ffem,
//                                 fontWeight: FontWeight.w400,
//                                 height: 1.3102273305*ffem/fem,
//                                 color: Color(0xffffffff),
//                               ),
//                             ),
//                             const SizedBox(height: 5,),
//                             Text(
//                               _data[2][newDate.day-1],
//                               style: SafeGoogleFont (
//                                 'Inter',
//                                 fontSize: 16 *ffem,                             fontWeight: FontWeight.w400,
//                                 height: 1.3102273305*ffem/fem,
//                                 color: Color(0xffffffff),
//                               ),
//                             ),
//                             const SizedBox(height: 5,),
//                             Text(
//                               _data[3][newDate.day-1],
//                               style: SafeGoogleFont (
//                                 'Inter',
//                                 fontSize: 16 *ffem,                             fontWeight: FontWeight.w400,
//                                 height: 1.3102273305*ffem/fem,
//                                 color: Color(0xffffffff),
//                               ),
//                             ),
//                             const SizedBox(height: 5,),
//                             Text(
//                               _data[4][newDate.day-1],
//                               style: SafeGoogleFont (
//                                 'Inter',
//                                 fontSize: 16 *ffem,                             fontWeight: FontWeight.w400,
//                                 height: 1.3102273305*ffem/fem,
//                                 color: Color(0xffffffff),
//                               ),
//                             ),
//                             const SizedBox(height: 5,),
//                             Text(
//                               _data[5][newDate.day-1],
//                               style: SafeGoogleFont (
//                                 'Inter',
//                                 fontSize: 16 *ffem,                             fontWeight: FontWeight.w400,
//                                 height: 1.3102273305*ffem/fem,
//                                 color: Color(0xffffffff),
//                               ),
//                             ),
//                             const SizedBox(height: 5,),
//                             Text(
//                               _data[6][newDate.day-1],
//                               style: SafeGoogleFont (
//                                 'Inter',
//                                 fontSize: 16 *ffem,                             fontWeight: FontWeight.w400,
//                                 height: 1.3102273305*ffem/fem,
//                                 color: Color(0xffffffff),
//                               ),
//                             ),
//                             const SizedBox(height: 5,),
//                             Text(
//                               _data[7][newDate.day-1],
//                               style: SafeGoogleFont (
//                                 'Inter',
//                                 fontSize: 16 *ffem,                             fontWeight: FontWeight.w400,
//                                 height: 1.3102273305*ffem/fem,
//                                 color: Color(0xffffffff),
//                               ),
//                             ),
//                             const SizedBox(height: 5,),
//                             Text(
//                               _data[8][newDate.day-1],
//                               style: SafeGoogleFont (
//                                 'Inter',
//                                 fontSize: 16 *ffem,                             fontWeight: FontWeight.w400,
//                                 height: 1.3102273305*ffem/fem,
//                                 color: Color(0xffffffff),
//                               ),
//                             ),
//                             const SizedBox(height: 5,),
//                             Text(
//                               _data[9][newDate.day-1],
//                               style: SafeGoogleFont (
//                                 'Inter',
//                                 fontSize: 16 *ffem,                             fontWeight: FontWeight.w400,
//                                 height: 1.3102273305*ffem/fem,
//                                 color: Color(0xffffffff),
//                               ),
//                             ),
//
//                           ],
//                         )
//
//
//                     ),
//
//                     Container(
//                         alignment: Alignment.center,
//                         // padding: EdgeInsets.fromLTRB(40*fem, 16*fem, 40*fem, 16*fem),
//                         width: 250*fem,
//                         height: 100*fem,
//                         decoration: BoxDecoration (
//                           border: Border.all( color: Colors.deepPurpleAccent),
//                           color: Color(0x19ffffff),
//                           borderRadius: BorderRadius.circular(15*fem),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Color(0x115a6cea),
//                               offset: Offset(12*fem, 26*fem),
//                               blurRadius: 25*fem,
//                             ),
//                           ],
//                         ),
//                         child: Column(
//                           children: [
//                             Text(
//                               'Lunch',
//                               style: SafeGoogleFont (
//                                 'Inter',
//                                 fontSize: 36 *ffem,
//                                 fontWeight: FontWeight.w500,
//                                 height: 1.3102273305*ffem/fem,
//                                 color: Colors.deepPurpleAccent,
//                               ),
//                             ),
//                             const SizedBox(height: 20,),
//                             Text(
//                               _data[12][newDate.day-1],
//                               style: SafeGoogleFont (
//                                 'Inter',
//                                 fontSize: 16 *ffem,                               fontWeight: FontWeight.w400,
//                                 height: 1.3102273305*ffem/fem,
//                                 color: Color(0xffffffff),
//                               ),
//                             ),
//                             const SizedBox(height: 5,),
//                             Text(
//                               _data[13][newDate.day-1],
//                               style: SafeGoogleFont (
//                                 'Inter',
//                                 fontSize: 16 *ffem,                               fontWeight: FontWeight.w400,
//                                 height: 1.3102273305*ffem/fem,
//                                 color: Color(0xffffffff),
//                               ),
//                             ),
//                             const SizedBox(height: 5,),
//                             Text(
//                               _data[14][newDate.day-1],
//                               style: SafeGoogleFont (
//                                 'Inter',
//                                 fontSize: 16 *ffem,                               fontWeight: FontWeight.w400,
//                                 height: 1.3102273305*ffem/fem,
//                                 color: Color(0xffffffff),
//                               ),
//                             ),
//                             const SizedBox(height: 5,),
//                             Text(
//                               _data[15][newDate.day-1],
//                               style: SafeGoogleFont (
//                                 'Inter',
//                                 fontSize: 16 *ffem,                               fontWeight: FontWeight.w400,
//                                 height: 1.3102273305*ffem/fem,
//                                 color: Color(0xffffffff),
//                               ),
//                             ),
//                             const SizedBox(height: 5,),
//                             Text(
//                               _data[16][newDate.day-1],
//                               style: SafeGoogleFont (
//                                 'Inter',
//                                 fontSize: 16 *ffem,                               fontWeight: FontWeight.w400,
//                                 height: 1.3102273305*ffem/fem,
//                                 color: Color(0xffffffff),
//                               ),
//                             ),
//                             const SizedBox(height: 5,),
//                             Text(
//                               _data[17][newDate.day-1],
//                               style: SafeGoogleFont (
//                                 'Inter',
//                                 fontSize: 16 *ffem,                               fontWeight: FontWeight.w400,
//                                 height: 1.3102273305*ffem/fem,
//                                 color: Color(0xffffffff),
//                               ),
//                             ),
//                             const SizedBox(height: 5,),
//                             Text(
//                               _data[18][newDate.day-1],
//                               style: SafeGoogleFont (
//                                 'Inter',
//                                 fontSize: 16 *ffem,                               fontWeight: FontWeight.w400,
//                                 height: 1.3102273305*ffem/fem,
//                                 color: Color(0xffffffff),
//                               ),
//                             ),
//                             const SizedBox(height: 5,),
//                             Text(
//                               _data[19][newDate.day-1],
//                               style: SafeGoogleFont (
//                                 'Inter',
//                                 fontSize: 16 *ffem,                               fontWeight: FontWeight.w400,
//                                 height: 1.3102273305*ffem/fem,
//                                 color: Color(0xffffffff),
//                               ),
//                             ),
//
//
//                           ],
//                         )
//                     ),
//                     Container(
//                         alignment: Alignment.center,
//                         // padding: EdgeInsets.fromLTRB(39*fem, 16*fem, 40*fem, 16*fem),
//                         width: 250*fem,
//                         height: 350*fem,
//                         decoration: BoxDecoration (
//                           border: Border.all( color: Colors.deepPurpleAccent),
//                           color: Color(0x19ffffff),
//                           borderRadius: BorderRadius.circular(15*fem),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Color(0x115a6cea),
//                               offset: Offset(12*fem, 26*fem),
//                               blurRadius: 25*fem,
//                             ),
//                           ],
//                         ),
//                         child: Column(
//                           children: [
//                             Text(
//                               'Dinner',
//                               style: SafeGoogleFont (
//                                 'Inter',
//                                 fontSize: 36 *ffem,
//                                 fontWeight: FontWeight.w500,
//                                 height: 1.3102273305*ffem/fem,
//                                 color: Colors.deepPurpleAccent,
//                               ),
//                             ),
//                             const SizedBox(height: 20,),
//                             Text(
//                               _data[22][newDate.day-1],
//                               style: SafeGoogleFont (
//                                 'Inter',
//                                 fontSize: 16 *ffem,                               fontWeight: FontWeight.w400,
//                                 height: 1.3102273305*ffem/fem,
//                                 color: Color(0xffffffff),
//                               ),
//                             ),
//                             const SizedBox(height: 5,),
//                             Text(
//                               _data[23][newDate.day-1],
//                               style: SafeGoogleFont (
//                                 'Inter',
//                                 fontSize: 16 *ffem,                               fontWeight: FontWeight.w400,
//                                 height: 1.3102273305*ffem/fem,
//                                 color: Color(0xffffffff),
//                               ),
//                             ),
//                             const SizedBox(height: 5,),
//                             Text(
//                               _data[24][newDate.day-1],
//                               style: SafeGoogleFont (
//                                 'Inter',
//                                 fontSize: 16 *ffem,                               fontWeight: FontWeight.w400,
//                                 height: 1.3102273305*ffem/fem,
//                                 color: Color(0xffffffff),
//                               ),
//                             ),
//                             const SizedBox(height: 5,),
//                             Text(
//                               _data[25][newDate.day-1],
//                               style: SafeGoogleFont (
//                                 'Inter',
//                                 fontSize: 16 *ffem,                               fontWeight: FontWeight.w400,
//                                 height: 1.3102273305*ffem/fem,
//                                 color: Color(0xffffffff),
//                               ),
//                             ),
//                             const SizedBox(height: 5,),
//                             Text(
//                               _data[26][newDate.day-1],
//                               style: SafeGoogleFont (
//                                 'Inter',
//                                 fontSize: 16 *ffem,                               fontWeight: FontWeight.w400,
//                                 height: 1.3102273305*ffem/fem,
//                                 color: Color(0xffffffff),
//                               ),
//                             ),
//                             const SizedBox(height: 5,),
//                             Text(
//                               _data[27][newDate.day-1],
//                               style: SafeGoogleFont (
//                                 'Inter',
//                                 fontSize: 16 *ffem,                               fontWeight: FontWeight.w400,
//                                 height: 1.3102273305*ffem/fem,
//                                 color: Color(0xffffffff),
//                               ),
//                             ),
//                             const SizedBox(height: 5,),
//                             Text(
//                               _data[28][newDate.day-1],
//                               style: SafeGoogleFont (
//                                 'Inter',
//                                 fontSize: 16 *ffem,                               fontWeight: FontWeight.w400,
//                                 height: 1.3102273305*ffem/fem,
//                                 color: Color(0xffffffff),
//                               ),
//                             ),
//
//
//
//                           ],
//                         )
//                     ),
//
//
//                     //1st Image of Slider
//
//
//                   ],
//
//                   //Slider Container properties
//                   options: CarouselOptions(
//                     height: 350.0,
//                     enlargeCenterPage: true,
//                     autoPlay: false,
//                     initialPage: getinitialpage(),
//
//                     autoPlayCurve: Curves.fastOutSlowIn,
//                     enableInfiniteScroll: false,
//                     autoPlayAnimationDuration: Duration(milliseconds: 800),
//                     viewportFraction: 0.6,
//                   ),
//                 ),
//               ],
//             ),),
//
//           ]
//         ),
//
//     );
//
//   }
//
// }
//
