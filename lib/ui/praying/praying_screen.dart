import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:audioplayer/audioplayer.dart';
import 'package:buddish_project/constants.dart';
import 'package:buddish_project/ui/praying/praying_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zefyr/zefyr.dart';

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
  final AudioPlayer _audioPlugin = AudioPlayer();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ZefyrController _controller;
  FocusNode _editorFocusNode;

  Future<File> copyLocalAsset(Directory localDir, String bundleDir, String assetName) async {
    final data = await rootBundle.load('$bundleDir/$assetName');
    final bytes = data.buffer.asUint8List();
    final localAssetFile = File('${localDir.path}/$assetName');
    await localAssetFile.writeAsBytes(bytes, flush: true);
    return localAssetFile;
  }

  void _showLyric() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * .45,
          child: Column(
            children: <Widget>[
              SizedBox(height: 8.0),
              Text(
                'บทสวด',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 8.0),
              Expanded(
                child: ZefyrEditor(
                  enabled: false,
                  controller: _controller,
                  focusNode: _editorFocusNode,
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    final document = NotusDocument.fromJson(
        json.decode("[{\"insert\":\"๑. คำบูชาพระรัตนตรัยโดยพิสดาร\",\"attributes\":{\"b\":true}},{\"insert\":\"\\nโย โส ภะคะวา อะระหัง สัมมาสัมพุทโธ , สวากขาโต เยนะ ภะคะวะตา ธัมโม , สุปะฏิปันโน ยัสสะ\\nภะคะวะโต สาวะกะสังโฆ , ตัมมะยัง ภะคะวันตัง สะธัมมัง สะสังฆัง , อิเมหิ สักกาเรหิ ยะถาระหัง อาโรปิเตหิ อะภิปูชะยามะ , สาธุ โน ภันเต ภะคะวา สุจิระปะรินิพพุโตปิ , ปัจฉิมาชะนะตานุกัมปะมานะสา , อิเม สักกาเร\\nทุคคะตะปัณณาการะภูเต ปะฏิคคัณหาตุ , อัมหากัง  ทีฆะรัตตัง หิตายะ สุขายะ  ฯ\\n\"}]"));

    _controller = ZefyrController(document);
    _editorFocusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(
            'สวดมนต์',
            style: AppStyle.appbarTitle,
          ),
          iconTheme: IconThemeData(color: AppColors.primary),
          elevation: 1.0,
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
                  titleColor: AppColors.primary,
                  backgroundColor: AppColors.secondary,
                  isPlaying: mantra.isPlaying,
                  onPressed: () async {
                    if (!mantra.isPlaying) {
//                      final dir = await getApplicationDocumentsDirectory();
//                      final localAssetFile = await copyLocalAsset(dir, AppAsset.audioBundle, mantra.url);
//
//                      _audioPlugin.play(localAssetFile.path, isLocal: true);
                      widget.viewModel.onPlay(index, mantra);

                      // _showLyric();

                      return;
                    }

                    try {
//                      _bottomSheetController?.close();

//                      _audioPlugin.stop();
                      widget.viewModel.onStop(index, mantra);
                    } catch (e) {
                      print(e);
                    }
                  },
                  onLyricPressed: () {},
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
  final VoidCallback onLyricPressed;

  MantraPlayer({
    @required this.title,
    @required this.titleColor,
    @required this.backgroundColor,
    @required this.isPlaying,
    @required this.onPressed,
    @required this.onLyricPressed,
    this.fontSize = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimension.screenHorizonPadding),
      margin: EdgeInsets.only(bottom: Dimension.fieldVerticalMargin),
      height: 80.0,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: backgroundColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.shade200,
            offset: Offset(4.0, 4.0),
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: isPlaying ? AppColors.primary : Color(0xFFFCDE4C),
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
          ),
//          Flexible(
//            child: IconButton(
//              icon: Icon(Icons.font_download),
//              onPressed: onLyricPressed,
//            ),
//          )
        ],
      ),
    );
  }
}
