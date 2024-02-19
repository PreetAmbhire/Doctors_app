import 'package:doctors/Views/receiver_text.dart';
import 'package:doctors/Views/sender_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class MessageScreen extends StatefulWidget {
  final String name;
  final String image;
  final String phone;
  const MessageScreen(
      {super.key,
      required this.name,
      required this.image,
      required this.phone});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: AppBar(
            leadingWidth: 10,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 27,
                  backgroundImage: NetworkImage(widget.image),
                ),
                Container(
                  width: 120,
                  child: Text(
                    widget.name,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  child: IconButton(
                    onPressed: () async {
                      await FlutterPhoneDirectCaller.callNumber(widget.phone);
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.phone,
                    ),
                  ),
                ),
                Container(
                  child: IconButton(
                    onPressed: () {},
                    icon: const FaIcon(
                      FontAwesomeIcons.video,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        // reverse: true,
        child: Container(
          width: screenWidth,
          height: screenHeight - 70 - MediaQuery.of(context).padding.top,
          child: Column(
            children: [
              Container(
                  height:
                      screenHeight - 70 - MediaQuery.of(context).padding.top,
                  width: screenWidth,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background.jpg'),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Container(
                          // alignment: Alignment.center,
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          // color: Colors.amber,
                          height: screenHeight -
                              155 -
                              MediaQuery.of(context).padding.top,
                          child: const Column(
                            children: [
                              SenderText(message: 'message'),
                              ReceiverText(message: 'message'),
                              SenderText(message: 'message'),
                              SenderText(message: 'message'),
                              ReceiverText(message: 'message'),
                              ReceiverText(message: 'message'),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        right: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 60,
                              width: screenWidth - 75,
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 234, 248, 255),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                    hintText: 'Message',
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(top: 13, left: 5),
                                      child: FaIcon(
                                          FontAwesomeIcons.solidFaceSmile),
                                    ),
                                    suffixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(top: 13, left: 20),
                                      child: FaIcon(FontAwesomeIcons.paperclip),
                                    ),
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 234, 248, 255),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: IconButton(
                                icon: const FaIcon(
                                    FontAwesomeIcons.solidPaperPlane),
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      )),
    );
  }
}
