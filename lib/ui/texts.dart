import 'package:flame/text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Texts {
  static TextRenderer mono = TextPaint(
    style: GoogleFonts.novaMono(
      color: Colors.white,
      fontSize: 24,
    ),
  );
  static TextRenderer monoSmall = TextPaint(
    style: GoogleFonts.novaMono(
      color: Colors.white,
      fontSize: 16,
    ),
  );
  static TextRenderer monoWeak = TextPaint(
    style: GoogleFonts.novaMono(
      color: Colors.white60,
      fontSize: 16,
    ),
  );
  static TextRenderer actualMono = TextPaint(
    style: GoogleFonts.notoSansMono(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  );
}
