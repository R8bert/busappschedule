import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:busway/splash_screens/utils.dart';
import 'package:busway/home/home.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      // splashiFj (23:452)
      width:  double.infinity,
      height:  844*fem,
      decoration:  BoxDecoration (
        color:  Color(0xffffffff),
        borderRadius:  BorderRadius.circular(40*fem),
      ),
      child:
      Stack(
        children:  [
          Positioned(
            // ellipse24U1 (23:453)
            left:  -280*fem,
            top:  51.0000171661*fem,
            child:
            Align(
              child:
              SizedBox(
                width:  773.09*fem,
                height:  773.55*fem,
                child:
                Image.asset(
                  'assets/images/ellipse-2-PTo.png',
                  width:  773.09*fem,
                  height:  773.55*fem,
                ),
              ),
            ),
          ),
          Positioned(
            // ellipse1dfX (23:454)
            left:  -165*fem,
            top:  164.2959442139*fem,
            child:
            Align(
              child:
              SizedBox(
                width:  546.77*fem,
                height:  546.77*fem,
                child:
                Image.asset(
                  'assets/images/ellipse-1.png',
                  width:  546.77*fem,
                  height:  546.77*fem,
                ),
              ),
            ),
          ),
          Positioned(
            // prevui1iBB (23:455)
            left:  17*fem,
            top:  186*fem,
            child:
            Align(
              child:
              SizedBox(
                width:  357*fem,
                height:  267*fem,
                child:
                Image.asset(
                  'assets/images/prevui-1-4j3.png',
                  fit:  BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            // rectangle3c1f (23:456)
            left:  0*fem,
            top:  449*fem,
            child:
            Align(
              child:
              SizedBox(
                width:  390*fem,
                height:  395*fem,
                child:
                Container(
                  decoration:  BoxDecoration (
                    color:  Color(0xffffffff),
                    borderRadius:  BorderRadius.only (
                      topLeft:  Radius.circular(50*fem),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            // rectangle104uF (126:393)
            left:  0*fem,
            top:  449*fem,
            child:
            Align(
              child:
              SizedBox(
                width:  390*fem,
                height:  395*fem,
                child:
                Container(
                  decoration:  BoxDecoration (
                    color:  Color(0xffffffff),
                    borderRadius:  BorderRadius.only (
                      topLeft:  Radius.circular(50*fem),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            // teajutmnoideacumxUq (23:457)
            left:  54*fem,
            top:  499*fem,
            child:
            Align(
              child:
              SizedBox(
                width:  285*fem,
                height:  68*fem,
                child:
                RichText(
                  textAlign:  TextAlign.right,
                  text:
                  TextSpan(
                    style:  SafeGoogleFont (
                      'Poppins',
                      fontSize:  33.1800003052*ffem,
                      fontWeight:  FontWeight.w700,
                      height:  1.0247136735*ffem/fem,
                      letterSpacing:  -0.3318000031*fem,
                      color:  Color(0xff1c1c1c),
                    ),
                    children:  [
                      TextSpan(
                        text:  'Te ',
                      ),
                      TextSpan(
                        text:  'ajutăm',
                        style:  SafeGoogleFont (
                          'Poppins',
                          fontSize:  33.1800003052*ffem,
                          fontWeight:  FontWeight.w700,
                          height:  1.0247136735*ffem/fem,
                          letterSpacing:  -0.3318000031*fem,
                          color:  Color(0xff7289da),
                        ),
                      ),
                      TextSpan(
                        text:  ' noi de acum!',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            // creaziuncontiarnoiosatinemevid (23:458)
            left:  40*fem,
            top:  585*fem,
            child:
            Align(
              child:
              SizedBox(
                width:  275*fem,
                height:  66*fem,
                child:
                Text(
                  'Crează-ţi un cont iar noi o sa tinem evidenta utilizării tale personalizate',
                  textAlign: TextAlign.right,
                  style:  SafeGoogleFont (
                    'Poppins',
                    decoration: TextDecoration.none,
                    fontSize:  19.2000007629*ffem,
                    fontWeight:  FontWeight.w500,
                    height:  1.1458332878*ffem/fem,
                    letterSpacing:  -0.1920000076*fem,
                    color:  Color(0xff7f7f7f),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            // frame1HL5 (23:459)
            left:  36*fem,
            top:  666*fem,
            child:
            Container(
              width:  310*fem,
              height:  44*fem,
              decoration:  BoxDecoration (
                borderRadius:  BorderRadius.circular(7*fem),
                gradient:  LinearGradient (
                  begin:  Alignment(-0.245, -3.5),
                  end:  Alignment(0.348, 3.591),
                  colors:  <Color>[Color(0xff7289da), Color(0xffaebceb), Color(0xffcbd1ea)],
                  stops:  <double>[0, 0.5, 1],
                ),
                boxShadow:  [
                  BoxShadow(
                    color:  Color(0x0c000000),
                    offset:  Offset(4*fem, 4*fem),
                    blurRadius:  4*fem,
                  ),
                ],
              ),
              child:
              Center(
                child:
                Text(
                  'INTRĂ IN CONT',
                  style:  SafeGoogleFont (
                    'Poppins',
                    fontSize:  16*ffem,
                    fontWeight:  FontWeight.w600,
                    height:  1.375*ffem/fem,
                    color:  Color(0xff000000),
                    decoration: TextDecoration.none,
                  ),

                ),

              ),

            ),


          ),
        Positioned(
          // nuaidejacontcreazunulacumaiV (23:462)
          left:  100*fem,
          top:  775*fem,
          child:
            GestureDetector(
              child: Text(
                'Nu am nevoie de un cont',
                style:  SafeGoogleFont (
                  'Poppins',
                  fontSize:  16*ffem,
                  fontWeight:  FontWeight.w600,
                  height:  1.375*ffem/fem,
                  color:  Color(0xff7289da),
                  decoration: TextDecoration.none,
                ),
              ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
              },

            ),
        ),
          Positioned(
            // nuaidejacontcreazunulacumaiV (23:462)
            left:  71*fem,
            top:  735*fem,
            child:
            Align(
              child:
              SizedBox(
                width:  250*fem,
                height:  22*fem,
                child:
                RichText(
                  textAlign:  TextAlign.center,
                  text:
                  TextSpan(
                    style:  SafeGoogleFont (
                      'Poppins',
                      fontSize:  14*ffem,
                      fontWeight:  FontWeight.w500,
                      height:  1.5714285714*ffem/fem,
                      letterSpacing:  -0.14*fem,
                      color:  Color(0xff000000),
                    ),
                    children:  [
                      TextSpan(
                        text:  'N',
                      ),
                      TextSpan(
                        text:  'u ai deja cont  ? ',
                        style:  SafeGoogleFont (
                          'Poppins',
                          fontSize:  14*ffem,
                          fontWeight:  FontWeight.w500,
                          height:  1.5714285714*ffem/fem,
                          letterSpacing:  -0.14*fem,
                          color:  Color(0xff000000),
                        ),
                      ),
                      TextSpan(
                        text:  'Crează unul acum',
                        style:  SafeGoogleFont (
                          'Poppins',
                          fontSize:  14*ffem,
                          fontWeight:  FontWeight.w500,
                          height:  1.5714285714*ffem/fem,
                          letterSpacing:  -0.14*fem,
                          decoration:  TextDecoration.underline,
                          color:  Color(0xff7289da),
                          decorationColor:  Color(0xff7289da),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            // ellipse3U73 (23:463)
            left:  151*fem,
            top:  99*fem,
            child:
            Align(
              child:
              SizedBox(
                width:  87.25*fem,
                height:  87.25*fem,
                child:
                Image.asset(
                  'assets/images/ellipse-3.png',
                  width:  87.25*fem,
                  height:  87.25*fem,
                ),
              ),
            ),
          ),
        ],
      ),
  );
  }
}
