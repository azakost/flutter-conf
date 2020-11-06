import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:mobileforum/components/imagebutton.dart';
import 'package:mobileforum/config.dart';

class Tweet extends StatelessWidget {
  final String text, username;
  final int uid, pid, time, likes, dislikes, messages;

  Tweet({
    this.pid,
    this.uid = 0,
    this.username,
    this.time = 0,
    this.text,
    this.likes = 0,
    this.dislikes = 0,
    this.messages = 0,
  });

  String dateToString(seconds) {
    var date = new DateTime.fromMillisecondsSinceEpoch(seconds * 1000);
    return timeago.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: forumBorder),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Clickable area for jumping to user profile
          ImageButton(
            onTap: () {
              print('user profile');
            },
            image: "$host/avatars/$uid.jpg",
            padding: 16,
          ),

          // Clickable area for jumping to full post content
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                print('full article');
              },
              child: Container(
                padding: EdgeInsets.only(top: 16, bottom: 16, right: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header of tweet
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '@$username',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        Text(
                          dateToString(time),
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),

                    // Main text of tweet
                    Padding(
                      padding: EdgeInsets.only(top: 4, bottom: 8),
                      child: Text(
                        text,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),

                    // Footer of tweet
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 4),
                          child: Icon(
                            FeatherIcons.heart,
                            size: 10,
                            color: Colors.white30,
                          ),
                        ),
                        Text(
                          '${likes - dislikes}',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16, right: 4),
                          child: Icon(
                            FeatherIcons.messageSquare,
                            size: 10,
                            color: Colors.white30,
                          ),
                        ),
                        Text(
                          '$messages',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
