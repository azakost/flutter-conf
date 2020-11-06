import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageButton extends StatelessWidget {
  final String image;
  final double size;
  final Function() onTap;
  final EdgeInsetsGeometry padding;

  ImageButton({this.image, this.size = 32, this.onTap, this.padding});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        alignment: Alignment.center,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: CachedNetworkImage(
            imageUrl: image,
            width: size,
            height: size,
          ),
        ),
      ),
    );
  }
}
