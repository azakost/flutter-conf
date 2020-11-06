import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:mobileforum/components/imagebutton.dart';
import 'package:mobileforum/config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alem Forum',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Color(0xFF16212c)),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF16212c),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white30,
        ),
      ),
      home: Tabs(),
    );
  }
}

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  // List of tab views
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Index 0: Home'),
    Text('Index 1: Business'),
    Text('Index 2: School'),
  ];

  // Tab selection function
  int _tabIndex = 0;
  void _onTabPressed(int index) {
    setState(() {
      _tabIndex = index;
    });
  }

  // Main Tabs Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Top App Bar
      appBar: AppBar(
        title: Text('Forum'),
        elevation: 0,
        leading: ImageButton(
          padding: EdgeInsets.only(left: 16),
          onTap: () {
            print("press");
          },
          image: "$host/avatars/1.jpg",
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              icon: Icon(FeatherIcons.filter, color: Colors.white70),
              onPressed: null,
            ),
          ),
        ],
      ),

      // Body
      body: Container(
        alignment: Alignment.centerLeft,
        color: Color(0xFF16212c),
        child: _widgetOptions.elementAt(_tabIndex),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: forumBorder),
        ),
        child: BottomNavigationBar(
          onTap: _onTabPressed,
          currentIndex: _tabIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Icon(FeatherIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(FeatherIcons.user),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
