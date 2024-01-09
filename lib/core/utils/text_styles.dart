import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

TextStyle quicksand20W800() => GoogleFonts.quicksand(
    fontSize: 20.sp, fontWeight: FontWeight.w800, color: Colors.blue);

TextStyle quicksand20W600() => GoogleFonts.quicksand(
    fontSize: 20.sp, fontWeight: FontWeight.w600, color: AppColors.primary);

TextStyle quicksand14W300({Color color = AppColors.primary}) =>
    GoogleFonts.quicksand(
        fontSize: 14.sp, fontWeight: FontWeight.w300, color: color);

TextStyle quicksand16W500() => GoogleFonts.quicksand(
    fontSize: 16.sp, fontWeight: FontWeight.w500, color: AppColors.primary);

TextStyle quicksand14W400() => GoogleFonts.quicksand(
    fontSize: 14.sp, fontWeight: FontWeight.w400, color: AppColors.primary);

TextStyle quicksand12W400() => GoogleFonts.quicksand(
    fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.primary);

TextStyle quicksand18({fontWeight = FontWeight.w600}) =>
    GoogleFonts.quicksand(
        fontSize: 18.sp, fontWeight: fontWeight, color: AppColors.primary);

TextStyle quicksand12W300grey() => GoogleFonts.quicksand(
    fontSize: 12.sp, color: Colors.black87, fontWeight: FontWeight.w300);
