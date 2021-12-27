import 'package:flutter/material.dart';
import 'package:instagram/feed_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BottomNavigationBarItem> bototmNavItmes = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
    const BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
    const BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
    const BottomNavigationBarItem(icon: Icon(Icons.healing), label: ''),
    const BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: ''),
  ];

  int _selectedIndex = 0;

  static final List<Widget> _screens = <Widget>[
    const FeedScreen(),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.blueAccent,
    ),
    Container(color: Colors.pinkAccent),
    Container(
      color: Colors.deepPurpleAccent,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: bototmNavItmes,
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
        selectedIconTheme: const IconThemeData(color: Colors.black87),
        selectedFontSize: 0.0,
        currentIndex: _selectedIndex,
        onTap: _onBottomClick,
      ),
    );
  }

  void _onBottomClick(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}
