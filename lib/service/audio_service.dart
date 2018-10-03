import 'dart:async';
import 'dart:io';

import 'package:audioplayer/audioplayer.dart';
import 'package:buddish_project/constants.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class AudioService {
  final AudioPlayer audioPlugin;

  AudioService(this.audioPlugin);

  Future<File> copyLocalAsset(Directory localDir, String bundleDir, String assetName) async {
    final data = await rootBundle.load('$bundleDir/$assetName');
    final bytes = data.buffer.asUint8List();
    final localAssetFile = File('${localDir.path}/$assetName');
    await localAssetFile.writeAsBytes(bytes, flush: true);
    return localAssetFile;
  }

  Future<Stream<Duration>> play(String url) async {
    final dir = await getApplicationDocumentsDirectory();
    final localAssetFile = await copyLocalAsset(dir, AppAsset.audioBundle, url);

    audioPlugin.play(localAssetFile.path, isLocal: true);
    return audioPlugin.onAudioPositionChanged;
  }

  void stop() {
    print('stop');
    audioPlugin.stop();
  }
}
