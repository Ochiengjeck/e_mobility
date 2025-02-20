import 'package:ev_app/controllers/page_controllers.dart';
import 'package:ev_app/pages/home_screen.dart';
import 'package:ev_app/pages/profile_screen.dart';
import 'package:ev_app/pages/rent_screen.dart';
import 'package:ev_app/pages/services_screen.dart';
import 'package:ev_app/pages/stations_screen.dart';
import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int selectedIndex = 2;

  final List<Widget> pages = [
    const StationsScreen(),
    ChargingStationScreen(),
    const HomeScreen(),
    const RentScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The Body
      body: PageView(
        controller: indexPageController,
        children: pages,
        onPageChanged: (value) {
          changescreen(value);
        },
      ),

      //The Bottom Navigation bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        onTap: (value) {
          changescreen(value);
        },
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        unselectedLabelStyle: const TextStyle(
          fontStyle: FontStyle.italic,
        ),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.location_pin), label: "Stations"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Services"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.attach_money), label: "Rent"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  void changescreen(int value) {
    setState(() {
      selectedIndex = value;
      indexPageController.jumpToPage(value);
    });
  }
}
