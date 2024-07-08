import 'package:flutter/material.dart';

import '../pages/add_page.dart';
import '../pages/home_page.dart';
import '../pages/more_page.dart';
import '../services/authentication.dart';

class AppTemplate extends StatefulWidget {
  const AppTemplate({
    Key? key,
    required this.setUnauthenticatedState,
  }) : super(key: key);

  final VoidCallback setUnauthenticatedState;

  void logout() async {
    final bool isUnauthenticated = await AuthService.instance.logout();
    if (isUnauthenticated) {
      setUnauthenticatedState();
    }
  }

  @override
  State<AppTemplate> createState() => _AppTemplateState();
}

class _AppTemplateState extends State<AppTemplate> {
  int _selectedPageIndex = 0;

  final List _pages = [
    const HomePage(),
    const AddPage(),
    const MorePage()
  ];

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: ()=>{}, icon: const Icon(Icons.logout, color: Colors.white,))
          ],
          backgroundColor: Colors.blue,
          title: const Text("MiVault", style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ), textAlign: TextAlign.center,),

        ),
        body: _pages[_selectedPageIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPageIndex,
          onTap: _navigateBottomBar,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline_rounded, size: 30,), label: "Add"),
            BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "More")
          ],
        )

    );
  }
}
