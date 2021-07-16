import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flux_payments/config/size_config.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();
//  static const Color asd= radial-gradient(58.47% 345.64% at 79.03% 49.02%, 0xFFB772EE 0%, 0xFF7041EE 100%);
  static const Color darkGreen = Color(0x7041EE66);
  static const Color main = Color(0xFF7041EE);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color navyBlue = Color(0xFF070417);
  static const Color offWhite = Color(0xFFE9E9FF);
  static const Color red = Color(0xFFFA3E3E);
  static const Color violet = Color(0xFFAD21B9);
  static const Color lightBlue = Color(0xFF21B0B9);
  static const Color greenShade1 = Color(0x7041EE80);
  static const Color dirtyGreen = Color(0x9797971A);
  static const Color lightGreen = Color(0x7041EE33);
  static const Color grey = Color(0x97979766);
  static const Color muddyYellow = Color(0xFFCE881E);
  static const Color seaGreen = Color(0xFF258758);
  static const Color lightPink = Color(0xFFBF3197);
  static const Color yellow = Color(0xFFCEA71E);
  static const Color darkPink = Color(0xFFB20637);
  static const Color whiteShade = Color(0xFFF6F6FF);
  static const Color blueShade5 = Color(0xF7041761);
  static const Color darkShade = Color(0xFF251B18);
  static const Color greenShade2 = Color(0x7041EE99);
  static const Color moderateOrange = Color(0xFFCE6334);
//static const Color asd= linear-gradient(79.4deg, 0xFFE933B6 -2.13%, 0xFF00F0FF 101.83%);
  static const Gradient gd1 = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [Color(0xFFE933B6), Color(0xFF00F0FF)]);

  static const Color greyShade2 = Color(0xFFEDEDED);
  static const Color greyShade3 = Color(0xFFF0F0F0);
  static const Color yellowShade1 = Color(0xFFF79F19);
  static const Color blueShade4 = Color(0xFF00004D);
  static const Color greenShade = Color(0xFF6FB94D);
  static const Color pinkShade = Color(0xFF70424D);
  static const Color brownishPink = Color(0xFF9B474D);
  static const Color greenShade3 = Color(0xFF3EC684);
//static const Color asd= linear-gradient(90deg, 0xFF616161 0%, 0xFF9BC5C3 100%);

  static const Color greenShade4 = Color(0xFF65A243);
//static const Color asd= linear-gradient(104.32deg, rgba(112, 65, 238, 0.7) 20.79%, rgba(112, 65, 238, 0.3) 70.39%);
  static const Color blueShade3 = Color(0xDA00004D);
//static const Color asd= linear-gradient(80.11deg, 0xFFE9B633 10.7%, 0xFF3EC684 101.93%);
//static const Color asd= linear-gradient(135deg, 0xFFF0FF00 0%, 0xFF58CFFB 100%);
  static const Color blueShade2 = Color(0xFA3E3EB2);
  static const Color brownShade = Color(0xFA3E3E1A);
  static const Color yellowShade2 = Color(0xFFFCF296);
//static const Color asd= linear-gradient(135deg, 0xFFFDEB71 0%, 0xFFF8D800 100%);
  static const Color blueShade1 = Color(0xFF01538A);
  static const Color greenShade5 = Color(0xF581ED4D);
//static const Color asd= linear-gradient(119.25deg, rgba(52, 184, 225, 0.8) 14%, rgba(223, 150, 40, 0.7) 76.76%);
//static const Color asd= linear-gradient(124.79deg, rgba(52, 225, 131, 0.8) 13.73%, 0xFFF4AFE1 75.72%);
//static const Color asd= linear-gradient(135deg, 0xFF65FDF0 0%, 0xFF1D6FA3 100%);
  static const lightGrey = Color(0xFFC4C4C4);
//static const Color asd= linear-gradient(135deg, 0xFFF5CBFF 0%, 0xFFC346C2 100%);
//static const Color asd= linear-gradient(95.44deg, 0xFFF79F19 23.29%, rgba(196, 196, 196, 0) 161.49%);
//static const Color asd= linear-gradient(239.62deg, 0xFFFA3E3E 9.78%, rgba(196, 196, 196, 0) 185.25%);/
//static const Color asd= linear-gradient(135deg, 0xFFFAD7A1 0%, 0xFFE96D71 100%);
//static const Color asd= linear-gradient(135deg, 0xFFFDD819 0%, 0xFFE80505 100%);
  static const Color greyShade = Color(0xFF5C614D);
//static const Color asd= radial-gradient(88.27% 89.13% at 75.32% 80.29%, 0xFFFFAC2F 0%, 0xFF242C79 0.01%, 0xFFEC7174 100%);
//static const Color asd= linear-gradient(135deg, 0xFFFFCF71 0%, 0xFF2376DD 100%);
//static const Color asd= linear-gradient(135deg, 0xFFFFD3A5 0%, 0xFFFD6585 100%);
//static const Color asd= linear-gradient(135deg, 0xFFFFF3B0 0%, 0xFFCA26FF 100%);

  static final TextStyle display1 = GoogleFonts.montserrat(
    // h4 -> display1
    fontWeight: FontWeight.w400,
    fontSize: SizeConfig.heightMultiplier * 5,
    letterSpacing: SizeConfig.widthMultiplier / 10,
    height: SizeConfig.heightMultiplier / 10,
    color: Color(0xff000000),
  );
   static final TextStyle display2bold = GoogleFonts.montserrat(
  
    fontWeight: FontWeight.w700,
    fontSize: SizeConfig.heightMultiplier * 3.2,
    letterSpacing: SizeConfig.widthMultiplier / 10,
    height: SizeConfig.heightMultiplier / 10,
    color: Color(0xffffffff),
  );
   static final TextStyle display2 = GoogleFonts.montserrat(
  
    fontWeight: FontWeight.w400,
    fontSize: SizeConfig.heightMultiplier * 2.3,
    letterSpacing: SizeConfig.widthMultiplier / 10,
    height: SizeConfig.heightMultiplier / 10,
    color: Color(0xffffffff),
  );
    static final TextStyle display3 = GoogleFonts.montserrat(
  
    fontWeight: FontWeight.w400,
    fontSize: SizeConfig.heightMultiplier * 1.5,
    letterSpacing: SizeConfig.widthMultiplier / 10,
    height: SizeConfig.heightMultiplier / 10,
    color: Color(0xffffffff),
  );
 
}
