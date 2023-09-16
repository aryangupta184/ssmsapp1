import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:ssmsapp1/presentation/home_screen.dart';
import 'package:ssmsapp1/routes/app_routes.dart';
import 'package:ssmsapp1/utils.dart';
import 'package:ssmsapp1/resources/auth_methods.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}



class _SignUpScreenState extends State<SignUpScreen> {

  Future<int> GoogleLogin(BuildContext context, [bool mounted = true]) async {
    showDialog(

        barrierDismissible: false,
        context: context,
        builder: (_) {
          return Dialog(
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Searching for Google Accounts....')
                ],
              ),
            ),
          );
        });



    await FirebaseServices().signInWithGoogle();
    Navigator.of(context).pop();

    if (!mounted) return 1;

    else return 2;

  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);
    if (res == 'success') {
      if (context.mounted) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => HomeScreen()
            ),
                (route) => false);

        setState(() {
          _isLoading = false;
        });
      }
    } else {
      setState(() {
        _isLoading = false;
      });

    }
  }
  
  
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

                padding: EdgeInsets.fromLTRB(25*fem, 31*fem, 25*fem, 40*fem),
                width: double.infinity,
                decoration: BoxDecoration (
                  color: Color(0xff0c0c0c),

                  image: DecorationImage (
                    fit: BoxFit.cover,
                    image: AssetImage (
                      'assets/images/pattern-bg.png',
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(37.5*fem, 0*fem, 37.5*fem, 0*fem),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // logoNKj (0:7698)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                            width: 175*fem,
                            height: 139*fem,
                            child: Image.asset(
                              'assets/images/logo-ssms.png',
                            ),
                          ),
                          Container(

                            width: double.infinity,
                            height: 64*fem,
                            child: Stack(
                              children: [
                                Positioned(

                                  left: 71*fem,
                                  top: 0*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 107*fem,
                                      height: 54*fem,
                                      child: Text(
                                        'ssms ',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont (
                                          'Viga',
                                          fontSize: 40*ffem,
                                          color: Color(0xffd256ff),
                                          fontWeight: FontWeight.w400,
                                          height: 1.345*ffem/fem,
                                          letterSpacing: 0.5*fem,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(

                                  left: 0*fem,
                                  top: 48*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 250*fem,
                                      height: 16*fem,
                                      child: Text(
                                        'Society for Student Mess Services',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont (
                                          'Inter',
                                          fontSize: 13*ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.2125*ffem/fem,
                                          letterSpacing: 1*fem,
                                          color: Color(0xffffffff),
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

                      margin: EdgeInsets.fromLTRB(5*fem, 0*fem, 5*fem, 0*fem),
                      width: double.infinity,

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                                  Container(

                                    margin: EdgeInsets.fromLTRB(0*fem, 50*fem, 0*fem, 12*fem),
                                    padding: EdgeInsets.fromLTRB(15*fem, 0*fem, 15*fem, 0*fem),
                                    width: double.infinity,
                                    decoration: BoxDecoration (
                                      color: Color(0x19ffffff),
                                      borderRadius: BorderRadius.circular(15*fem),
                                    ),
                                    child: TextField(
                                      controller: _emailController,
                                      decoration: InputDecoration(
                                        labelText: "Email"
                                      ),
                                      style: SafeGoogleFont (
                                        'Inter',
                                        fontSize: 16*ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.2125*ffem/fem,
                                        letterSpacing: 0.5*fem,
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                          Container(
                            // passwordformiVP (0:7689)
                            padding: EdgeInsets.fromLTRB(15*fem, 0*fem, 15*fem, 0*fem),
                            width: double.infinity,
                            decoration: BoxDecoration (
                              color: Color(0x19ffffff),
                              borderRadius: BorderRadius.circular(15*fem),
                            ),
                            child: TextField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                  labelText: "Password"
                              ),
                              style: SafeGoogleFont (
                                'Inter',
                                fontSize: 16*ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.2125*ffem/fem,
                                letterSpacing: 0.5*fem,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                          Container(

                            margin: EdgeInsets.fromLTRB(2*fem, 20*fem, 0*fem, 25*fem),
                            child: Text(
                              'Or Continue With',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont (
                                'Inter',
                                fontSize: 12*ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.6652272542*ffem/fem,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.fromLTRB(2*fem, 5*fem, 0*fem, 30*fem),
                            padding: EdgeInsets.fromLTRB(20*fem, 16*fem, 17*fem, 16.09*fem),
                            width: 152*fem,
                            height: 57*fem,
                            decoration: BoxDecoration (

                              color: Color(0x19ffffff),
                              borderRadius: BorderRadius.circular(15*fem),

                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // googleicon1PRB (0:7680)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 10*fem, 0*fem),
                                  width: 24.39*fem,
                                  height: 24.91*fem,
                                  child: Image.asset(
                                    'assets/images/google-icon.png',
                                    width: 24.39*fem,
                                    height: 24.91*fem,
                                  ),
                                ),
                                Container(
                                  // bitsmailtMw (0:7679)
                                  margin: EdgeInsets.fromLTRB(5*fem, 3*fem, 0*fem, 0*fem),
                                  child: InkWell(
                                    onTap: () async {
                                      await GoogleLogin(context);
                                      Navigator.of(context)
                                          .pushReplacement(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                             HomeScreen(),
                                          ));

                                    },
                                    child: Text(
                                      'BITS Mail',
                                      style: SafeGoogleFont (
                                        'Inter',
                                        fontSize: 14*ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.2125*ffem/fem,
                                        letterSpacing: 0.5*fem,
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  )

                                ),
                          ]
                            )
                          ),
                          Container(
                            // forgotpasswordlinkFn9 (0:7695)
                            margin: EdgeInsets.fromLTRB(3*fem, 0*fem, 0*fem, 0*fem),
                            child: Text(
                              'Forgot Your Password?',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont (
                                'Inter',
                                fontSize: 12*ffem,
                                color: Color(0xffd256ff),
                                fontWeight: FontWeight.w400,
                                height: 1.6652272542*ffem/fem,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          Container(
                            // ctabuttonxRf (0:7673)
                            margin: EdgeInsets.fromLTRB(82*fem, 20*fem, 82*fem, 80*fem),
                            width: double.infinity,
                            height: 57*fem,
                            decoration: BoxDecoration (
                              borderRadius: BorderRadius.circular(15*fem),
                              gradient: LinearGradient(
                                colors: [Color(0xffd256ff), Color(0xff6256bf)],
                                stops: [0, 1],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              )


                            ),
                            child: Center(
                              child:InkWell(
                                onTap: loginUser,
                                child: Text(
                                  'Login',
                                  style: SafeGoogleFont (
                                    'Inter',
                                    fontSize: 16*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.3102272749*ffem/fem,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              )
                            ),
                          ),




                        ],
                      ),
                    ),

                  ],
                ),
              ),
            )

        ),
      );

  }
}
class FirebaseServices {
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();

  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);
        await _auth.signInWithCredential(authCredential);
      }
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }

  signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}