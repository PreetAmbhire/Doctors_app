import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Utils/app_colors.dart';

class DoctorCard extends StatefulWidget {
  final String drName;
  final String category;
  final String city;
  final String image;
  final String time;
  const DoctorCard(
      {super.key,
      required this.drName,
      required this.category,
      required this.city,
      required this.image,
      required this.time});

  @override
  State<DoctorCard> createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      surfaceTintColor: Colors.white,
      elevation: 5,
      color: Colors.white,
      margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
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
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black),
                  child: Image.network(
                    widget.image,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      //Dr Name
                      margin: const EdgeInsets.only(top: 10, left: 10),
                      width: 200,
                      child: Text(
                        widget.drName,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      //Category
                      margin: const EdgeInsets.only(left: 10, bottom: 10),
                      width: 200,
                      child: Text(
                        widget.category,
                        style: const TextStyle(fontSize: 14),
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
                            padding: const EdgeInsets.only(left: 20),
                            child: const FaIcon(
                              FontAwesomeIcons.locationDot,
                              size: 20,
                              color: Colors.grey,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              widget.city,
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
                      const Text('5.0')
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
