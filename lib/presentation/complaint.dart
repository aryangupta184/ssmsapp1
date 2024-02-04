import 'package:flutter/material.dart';
import 'package:ssmsapp1/utils.dart';

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
                                        "Feedback Form",
                                        textAlign: TextAlign.right,
                                        style: SafeGoogleFont(
                                          'Viga',
                                          fontSize: 32 ,
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
                                          labelText: 'Other Feedback',
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

                            onPressed:(){
                              Navigator.of(context).pop();

                            },
                            child: Text('Submit Feedback'),
                          ),
                        ],
                      ),)))


        )
    );
  }
}
class _FeedbackPopup3 extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();


  TextEditingController messnameController = TextEditingController();
  TextEditingController staffnameController = TextEditingController();
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
                                        "Feedback Form",
                                        textAlign: TextAlign.right,
                                        style: SafeGoogleFont(
                                          'Viga',
                                          fontSize: 32 ,
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
                                      maxLines: 5,
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

                            onPressed:(){
                              Navigator.of(context).pop();

                            },
                            child: Text('Submit Feedback'),
                          ),
                        ],
                      ),)))


        )
    );
  }
}

class _FeedbackPopup1 extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();


  TextEditingController messnameController = TextEditingController();
  TextEditingController staffnameController = TextEditingController();
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
                                "Feedback Form",
                                textAlign: TextAlign.right,
                                style: SafeGoogleFont(
                                  'Viga',
                                  fontSize: 32 ,
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
                              controller: staffnameController,


                              decoration: InputDecoration(
                                  labelText: 'Staff Name',
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

                    onPressed:(){
                      Navigator.of(context).pop();

                    },
                    child: Text('Submit Feedback'),
                  ),
                ],
              ),)))


      )
    );
  }
}

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


                InkWell(
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (context) => Center(
                        child: _FeedbackPopup1(),
                      ),
                    );
                  },
                  child: Container(
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
                  ) ,
                ),

                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (context) => Center(
                        child: _FeedbackPopup2(),
                      ),
                    );
                  },
                  child: Container(
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

                ),

                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (context) => Center(
                        child: _FeedbackPopup3(),
                      ),
                    );
                  },
                  child: Container(
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
                ),

                SizedBox(
                  height: 20,
                ),



              ],
            ),
          ),
        )
      ],
    );
  }
}
