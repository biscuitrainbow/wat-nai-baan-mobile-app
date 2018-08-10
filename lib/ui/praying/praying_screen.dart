import 'dart:async';
import 'dart:io';

import 'package:buddish_project/constants.dart';
import 'package:buddish_project/ui/praying/praying_container.dart';
import 'package:flutter/material.dart';
import 'package:audioplayer/audioplayer.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class PrayingScreen extends StatefulWidget {
  static final String route = "/praying";

  final PrayingScreenViewModel viewModel;

  PrayingScreen({
    this.viewModel,
  });

  @override
  _PrayingScreenState createState() => _PrayingScreenState();
}

class _PrayingScreenState extends State<PrayingScreen> {
  final AudioPlayer audioPlugin = new AudioPlayer();

  Future<File> copyLocalAsset(Directory localDir, String bundleDir, String assetName) async {
    final data = await rootBundle.load('$bundleDir/$assetName');
    final bytes = data.buffer.asUint8List();
    final localAssetFile = File('${localDir.path}/$assetName');
    await localAssetFile.writeAsBytes(bytes, flush: true);
    return localAssetFile;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'สวดมนต์',
            style: Style.appbarTitle,
          ),
          iconTheme: IconThemeData(color: AppColors.main),
        ),
        body: ListView.builder(
            padding: EdgeInsets.symmetric(
              vertical: Dimension.fieldVerticalMargin + 2,
              horizontal: Dimension.screenHorizonPadding,
            ),
            itemCount: widget.viewModel.mantras.length,
            itemBuilder: (BuildContext context, int index) {
              var mantra = widget.viewModel.mantras[index];

              return Container(
                padding: EdgeInsets.only(bottom: Dimension.fieldVerticalMargin - 8),
                child: MantraPlayer(
                  title: mantra.name,
                  titleColor: AppColors.main,
                  backgroundColor: AppColors.secondary,
                  isPlaying: mantra.isPlaying,
                  onPressed: () async {
                    if (!mantra.isPlaying) {
                      final dir = await getApplicationDocumentsDirectory();
                      final localAssetFile = await copyLocalAsset(dir, Asset.audioBundle, mantra.url);

                      audioPlugin.play(localAssetFile.path, isLocal: true);

                      widget.viewModel.onPlay(index);
                      return;
                    }

                    audioPlugin.stop();
                    widget.viewModel.onStop(index);
                  },
                ),
              );
            }));
  }
}

class MantraPlayer extends StatelessWidget {
  final String title;
  final Color titleColor;
  final Color backgroundColor;
  final double fontSize;
  final bool isPlaying;
  final VoidCallback onPressed;

  MantraPlayer({
    @required this.title,
    @required this.titleColor,
    @required this.backgroundColor,
    @required this.isPlaying,
    @required this.onPressed,
    this.fontSize = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimension.screenHorizonPadding),
      margin: EdgeInsets.only(bottom: Dimension.fieldVerticalMargin),
      height: 80.0,
      width: double.infinity,
      color: backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: isPlaying ? AppColors.main : Color(0xFFFCDE4C),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: isPlaying
                  ? Icon(
                      Icons.stop,
                      color: Colors.white,
                    )
                  : Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    ),
              onPressed: onPressed,
            ),
          ),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: titleColor,
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }
}
