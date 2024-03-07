import 'dart:convert';

import 'package:doctors/Utils/app_colors.dart';
import 'package:doctors/Views/Labs/lab_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Labs extends StatefulWidget {
  const Labs({super.key});

  @override
  State<Labs> createState() => _LabsState();
}

class _LabsState extends State<Labs> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  List<dynamic> labs = [];

  Future<void> _loadData() async {
    String data = await rootBundle.loadString('assets/JsonFiles/lab_data.json');

    setState(() {
      labs = json.decode(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          color: AppColors.selectedIcon,
          child: Column(
            children: [
              Container(
                width: screenWidth,
                margin: const EdgeInsets.only(top: 70, left: 20, right: 20),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 15,
                        color: Color.fromARGB(255, 151, 151, 151),
                        offset: Offset(0, 6),
                      )
                    ]),
                child: TextFormField(
                  style: const TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    hintText: 'Search by lab name or location',
                    hintStyle:
                        const TextStyle(fontSize: 15, color: Colors.grey),
                    prefixIcon: Align(
                      widthFactor: 1,
                      heightFactor: 1,
                      child: FaIcon(
                        FontAwesomeIcons.magnifyingGlass,
                        color: AppColors.selectedIcon,
                      ),
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 20,
                ),
                width: screenWidth,
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(80)),
                    color: Colors.white),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(top: 50),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Categories',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          FaIcon(FontAwesomeIcons.sliders)
                        ],
                      ),
                    ),
                    Container(
                        height: 500,
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: ListView.builder(
                            itemCount: labs.length,
                            itemBuilder: ((BuildContext context, int index) {
                              return Container(
                                child: LabCard(
                                    labName:
                                        labs[index]['labs_name'].toString(),
                                    location: labs[index]['city'].toString(),
                                    image: labs[index]['image_url'].toString(),
                                    time: labs[index]['time'].toString(),
                                    rating: labs[index]['rating'].toString()),
                              );
                            })))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
