import 'package:flutter/material.dart';
import 'package:music_db/models/recording.dart';

class TrackWidget extends StatelessWidget {
  final Recording track;
  TrackWidget({super.key, required this.track});

  @override
  Widget build(BuildContext context) {
    return Text(track.title);
  }
}
