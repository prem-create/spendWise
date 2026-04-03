import 'package:flutter/material.dart';
import 'package:spend_wise/pages/home_page/widgets/my_bottom_navigation_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomePage')),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
