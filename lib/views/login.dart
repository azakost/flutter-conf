import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            "https://freepikpsd.com/wp-content/uploads/2019/10/iniciar-sesion-png-4-Transparent-Images.png",
            height: 130,
          ),

          // Divider
          Container(height: 32),

          // Username form
          TextFormField(
            autofocus: false,
            style: TextStyle(fontSize: 13, color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Username',
              prefixIcon: Icon(
                FeatherIcons.user,
                color: Colors.white54,
                size: 18,
              ),
            ),
          ),

          // Divider
          Container(height: 16),

          // Password form
          TextFormField(
            autofocus: false,
            style: TextStyle(
              fontSize: 13,
              color: Colors.white,
            ),
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              prefixIcon: Icon(
                FeatherIcons.lock,
                color: Colors.white54,
                size: 18,
              ),
            ),
          ),

          // Divider
          Container(height: 16),

          // Login button
          SizedBox(
            height: 40,
            width: double.infinity,
            child: RaisedButton(
              onPressed: () {},
              child: Text('Войти'),
            ),
          ),

          // Divider
          Container(height: 16),

          FlatButton.icon(
            onPressed: () {},
            label: Text('Войти через GitHub'),
            icon: Icon(FeatherIcons.github, size: 14),
          ),

          Container(height: 32),
        ],
      ),
    );
  }
}
