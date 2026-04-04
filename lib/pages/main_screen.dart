import 'package:flutter/material.dart';
import 'package:spend_wise/pages/goals_page/goals_page.dart';
import 'package:spend_wise/pages/home_page/home_page.dart';
import 'package:spend_wise/pages/transaction_page/transaction_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _index = 0;
  late List pages;

  void changePage(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  void initState() {
    pages = [
      HomePage(onChangePage: changePage),
      TransactionPage(),
      GoalsPage(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (selectedIndex) => setState(() {
          _index = selectedIndex;
        }),
        items: [
          //home
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),

          //transaction
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: "Tranactions",
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),

          //goals
          BottomNavigationBarItem(
            icon: Icon(Icons.gps_fixed),
            label: "Goals",
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
      body: pages[_index],
    );
  }
}
