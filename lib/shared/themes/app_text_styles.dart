import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:arrivederci/shared/themes/app_colors.dart';

class TextStyles {
  static final splashTitle = GoogleFonts.rougeScript(
    fontSize: 72,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );

  static final pageTitle = GoogleFonts.roboto(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );

  static final filledButton = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );

  static final unfilledButton = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
  );

  static final textBlack = GoogleFonts.roboto(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );

  static final textWhite = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );

  static final textWhiteUnderlined = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
    decoration: TextDecoration.underline,
  );

  static final textAbout = GoogleFonts.roboto(
    fontSize: 20,
    fontWeight: FontWeight.w300,
    color: AppColors.black,
  );

  static final textContact = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.gray,
  );

  static final textProfile = GoogleFonts.roboto(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );

  static final textDetails = GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.gray,
  );
}
