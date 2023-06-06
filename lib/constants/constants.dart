import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/config.dart';

// For App Color
const Color kPrimaryColor = Color(0xFF13A87C);
const Color kPrimaryLightColor = Color(0xFFC6CEDF);
const Color kSecondaryColor = Color(0xFFB5B5B5);
const Color kBackgroundColor1 = Color(0xFFF6F7FB);
const Color kBackgroundColor2 = Color(0xFFFFFFFF);
const Color kAlert = Color(0xFFED6363);
const Color kSuccess = Color(0xFF28C76F);

//For Text Color
const Color kPrimaryTextColor = Color(0xFF031A2E);
const Color kSubtitleTextColor = Color(0xFFB5B5B5);

// Costum text style
TextStyle primaryTextStyle = GoogleFonts.firaSans(
  color: kPrimaryTextColor,
);

TextStyle primaryLightTextStyle = GoogleFonts.firaSans(
  color: kPrimaryLightColor,
);

TextStyle subtitleTextStyle = GoogleFonts.firaSans(
  color: kSubtitleTextColor,
);

TextStyle purpleTextStyle = GoogleFonts.firaSans(
  color: kPrimaryColor,
);

TextStyle whiteTextStyle = GoogleFonts.firaSans(
  color: kBackgroundColor2,
);

TextStyle greenTextStyle = GoogleFonts.firaSans(
  color: kSuccess,
);

TextStyle redTextStyle = GoogleFonts.firaSans(
  color: kAlert,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;

// padding
double kDefaultPadding = getPropertionateScreenWidht(18);

List<BoxShadow> softShadow = [
  BoxShadow(
    color: const Color(0xFF6E6E6E).withOpacity(0.10),
    spreadRadius: 0,
    blurRadius: 8,
    offset: const Offset(0, 1), // changes position of shadow
  )
];
