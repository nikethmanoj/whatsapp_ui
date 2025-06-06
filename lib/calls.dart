import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Calls extends StatelessWidget {
  const Calls({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 17, 1, 1),
       appBar: AppBar(
        title: Text(
          'Calls',
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
       body: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(backgroundImage: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/b/bc/Unknown_person.jpg"),),
            title: Text("Johny Depp",
            style: TextStyle(color: const Color.fromARGB(255, 245, 244, 244))),
            subtitle: Text("Hey, how are you?",
            style: TextStyle(color: const Color.fromARGB(179, 174, 170, 170))),
           trailing: Icon(Icons.call_made, 
             color: const Color.fromARGB(255, 24, 184, 6),           
          ),
          ),
           ListTile(
            leading: CircleAvatar(backgroundImage: NetworkImage("https://b.fssta.com/uploads/application/soccer/headshots/711.vresize.350.350.medium.74.png"),),
            title: Text("Lionel Messi",
            style: TextStyle(color: const Color.fromARGB(255, 245, 244, 244))),
            subtitle: Text("Hey, did you see the match?",
            style: TextStyle(color: const Color.fromARGB(179, 174, 170, 170))),
            trailing: Icon(Icons.call, 
             color: const Color.fromARGB(255, 24, 184, 6),           
          ),
                      
          ),
           ListTile(
            leading: CircleAvatar(backgroundImage: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/b/be/Cristiano_Ronaldo%2C_2023.jpg"),),
            title: Text("Cristiano",
            style: TextStyle(color: const Color.fromARGB(255, 245, 244, 244))),
            subtitle: Row(
              children: [
                Icon(Icons.call_received, color: const Color.fromARGB(179, 174, 170, 170), size: 16),
                SizedBox(width: 6),
                Text(
                  "Yesterday, 9:22",
                  style: TextStyle(color: const Color.fromARGB(179, 174, 170, 170)),
                ),
              ],
            ),
            trailing: Icon(Icons.call, 
             color: const Color.fromARGB(255, 24, 184, 6),           
          ),
        ), ],
       ),
    );
  }
}