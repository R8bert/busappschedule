import 'package:busway/bus_search/bus_search.dart';
import 'package:busway/route_search/route_search.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selected = 0;
  final _pageController = PageController();
  final db = FirebaseFirestore.instance;
  void _setPage(n) {
    _pageController.animateToPage(n,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    setState(() => selected = n);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).cardColor,
        currentIndex: selected,
        onTap: _setPage,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.directions_rounded), label: "Rute"),
          BottomNavigationBarItem(
              icon: Icon(Icons.directions_bus_rounded), label: "Autobuze"),
        ],
      ),
      backgroundColor: Theme.of(context).cardColor,
      body: PageView(
        controller: _pageController,
        physics: const BouncingScrollPhysics(),
        children: const [
          RouteSearch(),
          BusSearch(),
        ],
        onPageChanged: _setPage,
      ),
    );
  }
}
