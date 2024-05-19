import 'package:flutter/material.dart';
import 'screens.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [Screen1(), Screen2(), Screen3(), Screen4()];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random text'),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        backgroundColor: const Color(0x00f2ecdc),
        selectedItemColor:  Colors.redAccent,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Screen 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Screen 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Screen 3',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Screen 4',
          ),
        ],
      ),
    );
  }
}
