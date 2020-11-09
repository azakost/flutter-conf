import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'package:mobileforum/views/home.dart';
import 'package:mobileforum/config.dart';
import 'package:mobileforum/views/login.dart';
import 'package:mobileforum/views/profile.dart';

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
        // Appbar theme
        appBarTheme: AppBarTheme(color: forumMainColor),

        // Bottom Navigation Bar theme
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: forumMainColor,
          selectedItemColor: forumTextColor,
          unselectedItemColor: Colors.white30,
        ),

        // Text theme
        textTheme: TextTheme(
          headline3: TextStyle(
            color: Colors.white70,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
          bodyText1: TextStyle(color: forumTextColor, fontSize: 13, height: 1.6, fontWeight: FontWeight.w300),
          subtitle1: TextStyle(
            color: Colors.white30,
            fontSize: 9,
          ),
        ),

        // Button theme
        buttonColor: forumButtonColor,
        brightness: Brightness.dark,
        disabledColor: Colors.blue[200],

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: forumInputColor,
          contentPadding: EdgeInsets.all(8),
          hintStyle: TextStyle(color: Colors.white30, fontSize: 13),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
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

bool logged = false;

class _TabsState extends State<Tabs> {
  // App Bars list
  List<Bar> tab = [
    Bar(
      title: 'Forum',
      icon: FeatherIcons.filter,
      onIconTap: null,
      page: Home(),
    ),
    Bar(
      title: 'Знания',
      icon: FeatherIcons.bookmark,
      onIconTap: null,
      page: Container(),
    ),
    Bar(
      title: 'Уведомления',
      icon: FeatherIcons.settings,
      onIconTap: null,
      page: Container(),
    ),
    Bar(
      title: 'Профиль',
      icon: FeatherIcons.logOut,
      onIconTap: null,
      page: Profile(),
    ),
    Bar(
      title: 'Войти в систему',
      icon: FeatherIcons.userPlus,
      onIconTap: null,
      page: Login(),
    ),
  ];

  // Tab selection function
  int _num = 0;
  void _onTabPressed(int index) {
    setState(() {
      _num = (index == 3 && logged == false) ? 4 : index;
    });
  }

  // Main Tabs Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      // Top App Bar
      appBar: AppBar(
        title: Text(tab[_num].title),
        elevation: 0,
        bottom: PreferredSize(
          child: Container(color: Color(0xFF38444d), height: 1),
          preferredSize: Size.fromHeight(1),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: Text('Logo'),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: IconButton(
              icon: Icon(tab[_num].icon, color: Colors.white70),
              onPressed: tab[_num].onIconTap,
            ),
          ),
        ],
      ),

      // Body
      body: Container(
        color: Color(0xFF16212c),
        child: Container(alignment: Alignment.topLeft, child: tab[_num].page),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: forumBorder),
        ),
        child: BottomNavigationBar(
          onTap: _onTabPressed,
          currentIndex: (_num == 4) ? 3 : _num,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Icon(FeatherIcons.home),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(FeatherIcons.bookOpen),
              label: 'know',
            ),
            BottomNavigationBarItem(
              icon: Icon(FeatherIcons.bell),
              label: 'notf',
            ),
            BottomNavigationBarItem(
              icon: Icon(FeatherIcons.user),
              label: 'user',
            ),
          ],
        ),
      ),
    );
  }
}

class Bar {
  final String title;
  final IconData icon;
  final Function() onIconTap;
  final Widget page;
  Bar({this.title, this.icon, this.onIconTap, this.page});
}
