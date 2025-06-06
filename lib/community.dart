import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Community extends StatelessWidget {
  const Community({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 17, 1, 1),
       appBar: AppBar(
        title: Text(
          'Communities',
          style: GoogleFonts.roboto(
            color: const Color.fromARGB(255, 253, 252, 252),
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 12, 11, 12),
        foregroundColor: const Color.fromARGB(255, 250, 249, 248),
        actions: [
          Icon(Icons.qr_code_scanner),
          Padding(padding: EdgeInsetsGeometry.only(right: 15)),
          Icon(Icons.camera_alt),
          Padding(padding: EdgeInsetsGeometry.only(right: 20)),
          Icon(Icons.more_vert),
          Padding(padding: EdgeInsetsGeometry.only(right: 25)),
        ],
      ),
    );
  }
}