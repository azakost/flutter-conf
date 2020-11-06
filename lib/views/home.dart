import 'package:flutter/material.dart';
import 'package:mobileforum/components/tweet.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Tweet(
      username: "azakost",
      text: 'Tweet',
      time: 0,
    );
  }
}

// Fetch tweets for Home view
