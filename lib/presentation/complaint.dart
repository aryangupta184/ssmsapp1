import 'package:flutter/material.dart';
import 'package:ssmsapp1/utils.dart';

class ComplaintScreen extends StatefulWidget {
  const ComplaintScreen({Key? key}) : super(key: key);

  @override
  State<ComplaintScreen> createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {
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
                Container(
                  height: 150,
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
                        top: 70,
                        child: Container(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "    Mess Complaints",
                              style: TextStyle(fontSize: 30, color: Color(0xff634831),),
                            ),
                          )



                      ),)

                    ],
                  ),
                ),



                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  padding: EdgeInsets.all(10),
                  height: 120,
                  width: 350,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xffFD9C2E), Color(0xffDA6317)]),
                      borderRadius: BorderRadius.circular(24)),
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16*fem),
                        child: Image.asset(
                          'assets/images/complaint.png',
                          height: 200,


                        ),
                      ),
                      SizedBox(width: 20,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Complaints \nRegarding \nMess Staff",
                          style: TextStyle(fontSize: 20, color: Color(0xffF9C488),),
                        ),
                      )







                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  padding: EdgeInsets.all(10),
                  height: 120,
                  width: 350,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xffFD9C2E), Color(0xffDA6317)]),
                      borderRadius: BorderRadius.circular(24)),
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16*fem),
                        child: Image.asset(
                          'assets/images/complaint.png',
                          height: 200,


                        ),
                      ),
                      SizedBox(width: 20,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Complaints \nRegarding \nMess Food",
                          style: TextStyle(fontSize: 20, color: Color(0xffF9C488),),
                        ),
                      )







                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  padding: EdgeInsets.all(10),
                  height: 120,
                  width: 350,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xffFD9C2E), Color(0xffDA6317)]),
                      borderRadius: BorderRadius.circular(24)),
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16*fem),
                        child: Image.asset(
                          'assets/images/complaint.png',
                          height: 200,


                        ),
                      ),
                      SizedBox(width: 20,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Other \nComplaints",
                          style: TextStyle(fontSize: 20, color: Color(0xffF9C488),),
                        ),
                      )







                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  padding: EdgeInsets.all(10),
                  height: 120,
                  width: 350,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xffFD9C2E), Color(0xffDA6317)]),
                      borderRadius: BorderRadius.circular(24)),
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16*fem),
                        child: Image.asset(
                          'assets/images/complaint.png',
                          height: 200,


                        ),
                      ),
                      SizedBox(width: 20,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Previous \nComplaints",
                          style: TextStyle(fontSize: 20, color: Color(0xffF9C488),),
                        ),
                      )







                    ],
                  ),
                ),



              ],
            ),
          ),
        )
      ],
    );
  }
}
