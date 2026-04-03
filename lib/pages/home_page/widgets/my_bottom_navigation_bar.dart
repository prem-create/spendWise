import 'package:flutter/material.dart';
import 'package:spend_wise/pages/goals_page/goals_page.dart';
import 'package:spend_wise/pages/home_page/home_page.dart';
import 'package:spend_wise/pages/transaction_page/transaction_page.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _index = 0;
  List pages = [HomePage(), TransactionPage(), GoalsPage()];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
    );
  }
}
