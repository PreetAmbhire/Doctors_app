import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:doctors/Utils/app_colors.dart';

class LabCard extends StatefulWidget {
  final String labName;
  final String location;
  final String image;
  final String time;
  final String rating;
  const LabCard(
      {super.key,
      required this.labName,
      required this.location,
      required this.image,
      required this.time,
      required this.rating});

  @override
  State<LabCard> createState() => _LabCardState();
}

class _LabCardState extends State<LabCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      surfaceTintColor: Colors.white,
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  //Image
                  height: 85,
                  width: 85,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      //Lab Name
                      margin: const EdgeInsets.all(10),
                      width: 170,
                      child: Text(
                        widget.labName,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      //Location
                      alignment: Alignment.topLeft,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            child: const FaIcon(
                              FontAwesomeIcons.locationDot,
                              size: 20,
                              color: Colors.grey,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              widget.location,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.grey),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  //Rating
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: const FaIcon(
                          FontAwesomeIcons.solidStar,
                          size: 20,
                          color: Color.fromARGB(255, 255, 227, 17),
                        ),
                      ),
                      Text(widget.rating)
                    ],
                  ),
                ),
                Container(
                  //Time
                  alignment: Alignment.bottomRight,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 20),
                        child: FaIcon(
                          FontAwesomeIcons.solidClock,
                          size: 20,
                          color: AppColors.selectedIcon,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          widget.time,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
