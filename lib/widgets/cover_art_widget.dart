import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:music_db/widgets/progress_widget.dart';
import 'package:music_db/widgets/rounded_image_widget.dart';

class CoverArtWidget extends StatelessWidget {
  final Future coverFuture;
  final double height, width;
  const CoverArtWidget({super.key, required this.coverFuture, this.height=150, this.width=150});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: FutureBuilder(
          future: coverFuture,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return CachedNetworkImage(
                imageUrl: snapshot.data![0].image,
                // placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                imageBuilder: (context, imageProvider) => RoundedImageWidget(imageProvider: imageProvider, height: height, width: width)
              );
            }
            else if (snapshot.hasError) {
              return CachedNetworkImage(
                imageUrl: 'https://static.vecteezy.com/system/resources/previews/005/337/799/original/icon-image-not-found-free-vector.jpg',
                // placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                imageBuilder: (context, imageProvider) => RoundedImageWidget(imageProvider: imageProvider, height: height, width: width)
              );
            }
            else {
              return const ProgressWidget();
            }
          }
      ),
    );
  }
}
