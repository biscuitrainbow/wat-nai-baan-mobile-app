import 'package:buddish_project/constants.dart';
import 'package:buddish_project/data/model/mantra.dart';
import 'package:flutter/material.dart';
import 'package:audioplayer/audioplayer.dart';

class PrayingScreen extends StatefulWidget {
  static final String route = "/praying";

  @override
  _PrayingScreenState createState() => _PrayingScreenState();
}

class _PrayingScreenState extends State<PrayingScreen> {
  final List<Mantra> mantras = [
    Mantra(name: 'สวดมนต์ทำวัดเช้า', url: 'http://www.rxlabz.com/labz/audio2.mp3'),
    Mantra(name: 'สวดมนต์ทำวัดเย็น', url: 'http://www.rxlabz.com/labz/audio2.mp3'),
    Mantra(name: 'สวดมนต์ประจำวัน', url: 'http://www.rxlabz.com/labz/audio2.mp3'),
    Mantra(name: 'สวดมนต์ก่อนนอน', url: 'http://www.rxlabz.com/labz/audio2.mp3'),
    Mantra(name: 'สวดมนต์แผ่เมตตรา', url: 'http://www.rxlabz.com/labz/audio2.mp3'),
  ];

  final AudioPlayer audioPlugin = new AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'สวดมนต์',
            style: Style.appbarTitleStyle,
          ),
          iconTheme: IconThemeData(color: AppColors.main),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: Dimension.screenHorizonPadding, vertical: Dimension.screenVerticalPadding),
              child: Column(
                children: mantras
                    ?.map(
                      (Mantra mantra) => MantraPlayer(
                            title: mantra.name,
                            titleColor: AppColors.main,
                            backgroundColor: AppColors.secondary,
                            isPlaying: true,
                            onPressed: () async {
                              await audioPlugin.play(mantra.url);
                            },
                          ),
                    )
                    ?.toList(),
              ),
            )
          ],
        ));
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
              color: isPlaying ? Color(0xFFFCDE4C) : AppColors.main,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: isPlaying
                  ? Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    )
                  : Icon(
                      Icons.stop,
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
