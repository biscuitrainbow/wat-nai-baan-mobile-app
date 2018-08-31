import 'package:buddish_project/constants.dart';
import 'package:buddish_project/data/model/video.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class VideoItem extends StatelessWidget {
  final Video video;
  final VoidCallback onPressed;

  VideoItem({
    this.video,
    this.onPressed,
  });

  Widget _buildImagePlaceholder() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: 180.0,
        width: 320.0,
        color: Colors.grey,
      ),
    );
  }

  Widget _buildVideoTitle() {
    return Row(children: <Widget>[
      Expanded(
        child: Text(
          video.title,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Dimension.screenHorizonPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CachedNetworkImage(
              fit: BoxFit.cover,
              height: 185.0,
              width: MediaQuery.of(context).size.width,
              imageUrl: video.thumbnailUrl,
              placeholder: _buildImagePlaceholder(),
            ),
            SizedBox(height: 4.0),
            _buildVideoTitle(),
            SizedBox(height: 28.0),
          ],
        ),
      ),
    );
  }
}
