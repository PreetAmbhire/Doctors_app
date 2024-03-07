import 'package:doctors/Views/Chat/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatCard extends StatefulWidget {
  final String name;
  final String phone;
  final String video;
  final String image;
  const ChatCard(
      {super.key,
      required this.name,
      required this.phone,
      required this.video,
      required this.image});

  @override
  State<ChatCard> createState() => _ChatCardState();
}

class _ChatCardState extends State<ChatCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      surfaceTintColor: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 50,
              height: 50,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(50)),
              child: Image.network(
                widget.image,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              width: 100,
              child: Text(
                widget.name,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MessageScreen(
                            name: widget.name,
                            image: widget.image,
                            phone: widget.phone,
                          )));
                },
                icon: const FaIcon(
                  FontAwesomeIcons.solidMessage,
                  size: 20,
                )),
            IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.phone,
                size: 20,
              ),
              onPressed: () async {
                await FlutterPhoneDirectCaller.callNumber(widget.phone);
              },
            ),
            IconButton(
                onPressed: () async {
                  // String phoneNumber = '8623087037';
                  final Uri url = Uri.parse(widget.video);
                  await launchUrl(url);
                },
                icon: const FaIcon(
                  FontAwesomeIcons.video,
                  size: 20,
                )),
          ],
        ),
      ),
    );
  }
}
