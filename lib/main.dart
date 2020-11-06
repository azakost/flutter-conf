import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:mobileforum/components/imagebutton.dart';
import 'package:mobileforum/views/home.dart';
import 'package:mobileforum/views/login.dart';
import 'package:mobileforum/config.dart';
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

class _TabsState extends State<Tabs> {
  // List of tab views
  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    Container(),
    Container(),
    Profile(),
  ];

  bool _login = true;

  List<String> titles = [
    'Forum',
    'Знания',
    'Уведомления',
    'Вход в систему',
  ];

  List<IconButton> _buttons = <IconButton>[
    IconButton(
      icon: Icon(FeatherIcons.filter, color: Colors.white70),
      onPressed: null,
    ),
    IconButton(
      icon: Icon(FeatherIcons.bookmark, color: Colors.white70),
      onPressed: null,
    ),
    IconButton(
      icon: Icon(FeatherIcons.settings, color: Colors.white70),
      onPressed: null,
    ),
    IconButton(
      icon: Icon(FeatherIcons.userPlus, color: Colors.white70),
      onPressed: null,
    )
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
      resizeToAvoidBottomInset: false,
      // Top App Bar
      appBar: AppBar(
        title: Text((_tabIndex == _buttons.length - 1 && _login) ? 'Профиль' : titles[_tabIndex]),
        elevation: 0,
        bottom: PreferredSize(
          child: Container(
            color: Color(0xFF38444d),
            height: 1,
          ),
          preferredSize: Size.fromHeight(1),
        ),
        leading: _login
            ? Padding(
                padding: const EdgeInsets.only(left: 16, top: 12, bottom: 12),
                child: ImageButton(
                  image: "$host/avatars/1.jpg",
                  onTap: () {
                    print('My Profile');
                  },
                ),
              )
            : null,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: _login && _tabIndex == _buttons.length - 1
                ? IconButton(
                    icon: Icon(FeatherIcons.logOut, color: Colors.white70),
                    onPressed: null,
                  )
                : _buttons[_tabIndex],
          ),
        ],
      ),

      // Body
      body: Container(
        color: Color(0xFF16212c),
        child: Container(
          alignment: Alignment.topLeft,
          child: !_login && _tabIndex == 1 ? Login() : _widgetOptions.elementAt(_tabIndex),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: forumBorder),
        ),
        child: BottomNavigationBar(
          onTap: _onTabPressed,
          currentIndex: _tabIndex,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Icon(FeatherIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(FeatherIcons.bookOpen),
              label: 'Knowlege',
            ),
            BottomNavigationBarItem(
              icon: Icon(FeatherIcons.bell),
              label: 'Notifications',
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
