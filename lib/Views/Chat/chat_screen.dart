import 'dart:convert';

import 'package:doctors/Views/Chat/chat_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<dynamic> doctors = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    String data =
        await rootBundle.loadString('assets/JsonFiles/doctor_data.json');

    setState(() {
      doctors = json.decode(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView.builder(
              itemCount: doctors.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  width: MediaQuery.of(context).size.width,
                  child: ChatCard(
                      name: doctors[index]['name'].toString(),
                      phone: doctors[index]['phone'].toString(),
                      video: doctors[index]['meet'].toString(),
                      image: doctors[index]['imageUrl'].toString()),
                );
              })),
    );
  }
}
