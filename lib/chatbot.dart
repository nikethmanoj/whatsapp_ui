import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Chatbot extends StatefulWidget {
  const Chatbot({super.key});

  @override
  State<Chatbot> createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {
  TextEditingController msgcontroller = TextEditingController();
  bool loading = false;
  bool cansend = false;
  List<Map<String, String>> messages = [];
  Future<void> sendMessage(String userMessage) async {
    setState(() {
      messages.add({'role': 'user', 'text': userMessage});
      loading = true;
      cansend = false;
    });

    final uri = Uri.parse(
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=AIzaSyCZOgZEQeO8-U0r1Q-xPxuLhutIjQroeRg',
    );

    final headers = {'Content-Type': 'application/json'};

    final body = jsonEncode({
      'contents': [
        {
          'parts': [
            {'text': userMessage},
          ],
        },
      ],
    });

    try {
      final response = await http.post(uri, headers: headers, body: body);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final botReply = data['candidates'][0]['content']['parts'][0]['text'];

        setState(() {
          messages.add({'role': 'bot', 'text': botReply});
        });
      } else {
        setState(() {
          messages.add({
            'role': 'bot',
            'text': 'Something went wrong. Please try again later.',
          });
        });
      }
    } catch (e) {
      setState(() {
        messages.add({'role': 'bot', 'text': 'Error: $e'});
      });
    } finally {
      setState(() {
        loading = false;
        msgcontroller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(238, 8, 8, 8),
        foregroundColor: const Color.fromARGB(255, 251, 252, 251),
        title: Row(
          children: [
            SizedBox(width: 120),
            Text("Meta AI",
            style: TextStyle(
              fontSize: 18,
            ),),
            Icon(
              Icons.verified,
              color: Colors.blueAccent, // Verified tick color
              size: 15,
            ),
          ],
        ),
        actions: [
          Icon(Icons.history),
          Padding(padding: EdgeInsets.only(right: 15)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemBuilder: (context, index) =>
                  buildmessage(messages.reversed.toList()[index]),
              itemCount: messages.length,
              padding: EdgeInsets.symmetric(vertical: 9),
            ),
          ),
          if (loading) CircularProgressIndicator(color: const Color.fromARGB(255, 246, 246, 243)),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: msgcontroller,
                    decoration: InputDecoration(
                      hintText: "Enter message",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 9, 9, 9),
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 233, 232, 228),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 123, 2, 22),
                      ),
                    ),
                    suffixIcon:  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.camera),
                    ),
                    ),
                  ),
                  ),
                  SizedBox(width: 8),
                    IconButton(
                      onPressed: () {
                        sendMessage(msgcontroller.text.trim());
                      },
                      icon: Icon(Icons.send,
                      color: const Color.fromARGB(255, 252, 250, 250),
                      ),
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildmessage(Map<String, String> Msg) {
    bool user = Msg["role"]=='user';
    return Align(alignment: user?
    Alignment.centerRight:Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        decoration: BoxDecoration(
          color: user
              ? const Color.fromARGB(238, 12, 12, 12)
              : const Color.fromARGB(255, 10, 10, 10),
          borderRadius: BorderRadius.circular(25),
        ),
        padding: EdgeInsets.all(14),
        child: Text(Msg['text']??"",
        style: TextStyle(
          fontSize: 18,
          color: const Color.fromARGB(255, 251, 252, 252),
        ),),
      ),
    );
  }
}
