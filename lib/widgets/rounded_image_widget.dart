import 'package:flutter/material.dart';

class RoundedImageWidget extends StatelessWidget {
  final double height, width;
  final ImageProvider imageProvider;
  const RoundedImageWidget({super.key, required this.imageProvider, this.height=150, this.width=150});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover
          ),
        )
    );
  }
}
