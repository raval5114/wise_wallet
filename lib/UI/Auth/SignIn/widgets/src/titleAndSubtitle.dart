import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleAndSubtitle extends StatelessWidget {
  const TitleAndSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Welcome Back!",
          style: GoogleFonts.lato(
            // Example font from Google Fonts
            fontSize: 32, // Larger font for emphasis
            fontWeight: FontWeight.w900, // Strong font weight
            letterSpacing: 1.5, // Slight spacing for a stylish effect
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10), // Adequate spacing for better layout
        Text(
          "Enter your personal details to access your account",
          style: GoogleFonts.roboto(
            // Another example font
            fontSize: 18, // Improved font size for readability
            fontWeight: FontWeight.w500, // Medium weight for balance
            color: Colors.white70,
            fontStyle: FontStyle.italic, // Italic for a softer tone
            height: 1.5, // Increased line height for cleaner text
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
