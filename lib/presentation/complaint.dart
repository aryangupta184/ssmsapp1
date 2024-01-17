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
          'assets/images/pattern-bg.png',
        ),
        Scaffold(
          backgroundColor: Color(0xff0D0D0D),
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
                          child: Image.asset(
                            'assets/images/pattern-bg2.png',
                            fit: BoxFit.fitWidth,
                            width: 375 * fem,
                            height: 812 * fem,


                          ),),
                      Positioned(
                        top: 70,
                        child: Container(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "    Mess Complaints",
                              style: TextStyle(fontSize: 30, color: Color(0xffFFFFFF),),
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
                          colors: [Color(0xff53E88B), Color(0xff15BE77)]),
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
                          style: TextStyle(fontSize: 20, color: Color(0x90FFFFFF),),
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
                          colors: [Color(0xff53E88B), Color(0xff15BE77)]),
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
                          style: TextStyle(fontSize: 20, color: Color(0x90FFFFFF),),
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
                          colors: [Color(0xff53E88B), Color(0xff15BE77)]),
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
                          style: TextStyle(fontSize: 20, color: Color(0x90FFFFFF),),
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
                          colors: [Color(0xff53E88B), Color(0xff15BE77)]),
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
                          style: TextStyle(fontSize: 20, color: Color(0x90FFFFFF),),
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
