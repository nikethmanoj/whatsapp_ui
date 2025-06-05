import 'package:flutter/material.dart';

class Whatsappui extends StatelessWidget {
  const Whatsappui({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 15, 14, 15), 
      appBar: AppBar(
        title: Text('WhatsApp'), 
        titleTextStyle: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 251, 252, 251),
        ),
        backgroundColor: const Color.fromARGB(255, 12, 11, 12),
        foregroundColor: const Color.fromARGB(255, 250, 249, 248),
        actions: [Icon(Icons.qr_code),
        Padding(padding: EdgeInsetsGeometry.only(right: 15)),
        Icon(Icons.camera),
        Padding(padding: EdgeInsetsGeometry.only(right: 20)),
        Icon(Icons.more_vert),
        Padding(padding: EdgeInsetsGeometry.only(right: 25)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color.fromARGB(255, 14, 163, 4),
        child: Icon(Icons.message_outlined),
      ),
    );
  }
}