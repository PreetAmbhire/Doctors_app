import 'dart:convert';

import 'package:doctors/Views/doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Utils/app_colors.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final carousalImages = [
    Image.asset(
      'assets/images/HomeBanner.png',
      fit: BoxFit.contain,
    ),
    Image.asset(
      'assets/images/HomeBanner.png',
      fit: BoxFit.contain,
    ),
    Image.asset(
      'assets/images/HomeBanner.png',
      fit: BoxFit.cover,
    ),
  ];

  Widget indicator(bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5),
      height: 3,
      width: isSelected ? 30 : 20,
      decoration: BoxDecoration(
          color: isSelected ? AppColors.selectedCard : Colors.grey),
    );
  }

  int pageIndex = 0;

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
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: screenWidth,
            decoration: BoxDecoration(
                color: AppColors.bgGrey,
                image: const DecorationImage(
                    alignment: Alignment.topLeft,
                    image: AssetImage('assets/images/topDesign.jpg'),
                    fit: BoxFit.fitWidth)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        padding: const EdgeInsets.only(top: 20),
                        child: const FaIcon(
                          FontAwesomeIcons.bell,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: screenWidth,
                  margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
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
                      hintText: 'Search...',
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
                    margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
                    alignment: Alignment.center,
                    height: 200,
                    child: PageView.builder(onPageChanged: (index) {
                      setState(() {
                        pageIndex = index % carousalImages.length;
                      });
                    }, itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Positioned(
                            width: screenWidth - 55,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child:
                                  carousalImages[index % carousalImages.length],
                            ),
                          ),
                          Positioned(
                            right: 10,
                            child: SizedBox(
                              width: 30,
                              child: Image.asset('assets/images/close.png'),
                            ),
                          ),
                        ],
                      );
                    })),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'At your Fingertip',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Card(
                                surfaceTintColor: Colors.white,
                                elevation: 5,
                                color: const Color.fromARGB(255, 255, 255, 255),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  width: screenWidth / 3,
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 50,
                                        child: Image.asset(
                                          'assets/images/QRIcon.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const Text(
                                        'Scan',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Card(
                                surfaceTintColor: Colors.white,
                                elevation: 5,
                                color: Colors.white,
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  width: screenWidth / 3,
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 50,
                                        child: Image.asset(
                                          'assets/images/vaccine.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const Text(
                                        'Vaccine',
                                        style: TextStyle(fontSize: 14),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Card(
                                surfaceTintColor: Colors.white,
                                elevation: 5,
                                color: Colors.white,
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  width: screenWidth / 3,
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 40,
                                        child: Image.asset(
                                          'assets/images/myBookings.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const Text(
                                        'My Bookings',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Card(
                                surfaceTintColor: Colors.white,
                                elevation: 5,
                                color: const Color.fromARGB(255, 255, 255, 255),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  width: screenWidth / 3,
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 50,
                                        child: Image.asset(
                                          'assets/images/clinic.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const Text(
                                        'Clinic',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Card(
                                surfaceTintColor: Colors.white,
                                elevation: 5,
                                color: Colors.white,
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  width: screenWidth / 3,
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 50,
                                        child: Image.asset(
                                          'assets/images/ambulance.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const Text(
                                        'Ambulance',
                                        style: TextStyle(fontSize: 13),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Card(
                                surfaceTintColor: Colors.white,
                                elevation: 5,
                                color: Colors.white,
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  width: screenWidth / 3,
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 40,
                                        child: Image.asset(
                                          'assets/images/nurse.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const Text(
                                        'Nurse',
                                        style: TextStyle(fontSize: 12),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: screenWidth,
                  height: 350,
                  child: ListView.builder(
                    itemCount: doctors.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: DoctorCard(
                          drName: doctors[index]['name'].toString(),
                          category: doctors[index]['category'].toString(),
                          city: doctors[index]['City'].toString(),
                          image: doctors[index]['imageUrl'].toString(),
                          time: doctors[index]['Time'].toString(),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                  child: Image.asset('assets/images/banner.jpg'),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Image.asset('assets/images/Invites.png'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
