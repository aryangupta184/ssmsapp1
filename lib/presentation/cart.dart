import 'package:flutter/material.dart';

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
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              padding: EdgeInsets.all(15),
              height: 150,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xffD256FF), Color(0xff6256BF)]),
                  borderRadius: BorderRadius.circular(24)),
              child: Row(
                children: [
                  SizedBox(width: 15,),
                  Column(
                    children: [
                      Text(
                        "Pitstop Items \n Today",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 20
                        ),


                      ),
                      SizedBox(height: 40,),
                      InkWell(
                        child: Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16)
                          ),
                          child: Text(
                            "Reserve Now",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.deepPurpleAccent
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(width: 15,),
                  VerticalDivider(
                    color: Colors.black,
                    width: 2,
                    thickness: 2,
                  ),
                  SizedBox(width: 15,),

                  Column(
                    children: [
                      Text(
                        "Mess Extras \n Today",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 20
                        ),


                      ),
                      SizedBox(height: 40,),
                      InkWell(

                        child: Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16)
                          ),
                          child: Text(
                            "Reserve Now",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.deepPurpleAccent
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
