import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsapp_ui/calls.dart';
import 'package:whatsapp_ui/chats.dart';
import 'package:whatsapp_ui/community.dart';
import 'package:whatsapp_ui/updates.dart';

class Whatsappui extends StatefulWidget {
  const Whatsappui({super.key});

  @override
  State<Whatsappui> createState() => _WhatsappuiState();
}

class _WhatsappuiState extends State<Whatsappui> {
  int index = 0;
  List<Widget> pages =[Chats(),Updates(), Community(), Calls()];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 12, 0, 0),
     
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color.fromARGB(255, 14, 163, 4),
        child: Icon(Icons.message_outlined),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.chat),
            label: "Chats",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.update), label: "Updates"),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "Communities",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: "Calls"),
        ],
        selectedItemColor: const Color.fromARGB(255, 24, 184, 6),
        currentIndex: index,
        type: BottomNavigationBarType.shifting,
        onTap: (tappedindex) {
          setState(() {
            index = tappedindex;
          });
        },
      ),
      body: pages[index],
    );
  }
}
