import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_screen/core/utils/app_localization.dart';

class DefaultFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;
  final int maxLength;
  final bool number;

  const DefaultFormField(
      {required this.controller,
      required this.label,
      this.isPassword = false,
      this.maxLength = 50,
      this.number = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: null,
      maxLength: number ? null : maxLength,
      controller: controller,
      validator: number
          ? (value) {
              if (value == null || value.isEmpty) {
                return 'User ID is required'.tr(context);
              }

              if (int.tryParse(value) == null) {
                return 'User ID must be a valid number'.tr(context);
              }

              return null; // Valid input
            }
          : (value) {
              if (value == null || value.isEmpty) {
                return "Please Enter valid Data".tr(context);
              }
              return null;
            },
      keyboardType: number ? TextInputType.number : TextInputType.text,
      obscureText: isPassword,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: label,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(12.sp),
        ),
      ),
    );
  }
}
