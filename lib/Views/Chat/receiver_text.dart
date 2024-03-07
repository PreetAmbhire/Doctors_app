import 'package:flutter/material.dart';

class ReceiverText extends StatefulWidget {
  final String message;
  const ReceiverText({super.key, required this.message});

  @override
  State<ReceiverText> createState() => _ReceiverTextState();
}

class _ReceiverTextState extends State<ReceiverText> {
  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(top: 5, left: 7, right: 100, bottom: 5),
      padding: const EdgeInsets.all(10),
      // width: screenWidth - 100,
      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15))),
      child: Text(
        widget.message,
        style: const TextStyle(fontSize: 14, color: Colors.white),
      ),
    );
  }
}
