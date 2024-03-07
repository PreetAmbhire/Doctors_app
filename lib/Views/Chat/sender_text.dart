import 'package:flutter/material.dart';

class SenderText extends StatefulWidget {
  final String message;
  const SenderText({super.key, required this.message});

  @override
  State<SenderText> createState() => _SenderTextState();
}

class _SenderTextState extends State<SenderText> {
  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(top: 5, left: 100, right: 7, bottom: 5),
      padding: const EdgeInsets.all(10),
      // width: screenWidth - 100,
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15))),
      child: Text(
        widget.message,
        style: const TextStyle(fontSize: 14, color: Colors.white),
      ),
    );
  }
}
