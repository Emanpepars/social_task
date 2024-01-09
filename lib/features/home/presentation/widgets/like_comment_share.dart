import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LikeCommentShare extends StatelessWidget {
  final String img;
  final String text;

  const LikeCommentShare(this.img, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(img),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
