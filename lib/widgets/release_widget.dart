import 'package:flutter/material.dart';
import 'package:music_db/models/release.dart';
import 'package:music_db/repository/cover_art_repo.dart';
import 'package:music_db/widgets/cover_art_widget.dart';

class ReleaseWidget extends StatefulWidget {
  final Release release;
  const ReleaseWidget({super.key, required this.release});

  @override
  State<ReleaseWidget> createState() => _ReleaseWidgetState();
}

class _ReleaseWidgetState extends State<ReleaseWidget> {
  late final Future releaseCoverFuture;

  @override
  void initState() {
    super.initState();
    releaseCoverFuture = CoverArtRepo.getReleaseCoverArt(widget.release.id);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/release-details', arguments: widget.release);
      },
      child: Row(
        children: [
          CoverArtWidget(coverFuture: releaseCoverFuture),
          Expanded(
            child: Column(
              children: [
                Text(widget.release.title),
                Text('${widget.release.trackCount}'),
                Text('${widget.release.date}'),
                Text('${widget.release.country}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
