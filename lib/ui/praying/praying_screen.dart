import 'package:buddish_project/constants.dart';
import 'package:buddish_project/ui/praying/praying_container.dart';
import 'package:flutter/material.dart';

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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
              final mantra = widget.viewModel.mantras[index];

              return Container(
                padding: EdgeInsets.only(bottom: Dimension.fieldVerticalMargin - 8),
                child: MantraPlayer(
                  title: mantra.name,
                  titleColor: AppColors.primary,
                  backgroundColor: AppColors.secondary,
                  isPlaying: mantra.isPlaying,
                  position: widget.viewModel.audioPlayerState.position,
                  duration: widget.viewModel.audioPlayerState.duration,
                  onSeek: (double value) => widget.viewModel.onSeek(value),
                  onPressed: () async {
                    if (!mantra.isPlaying) {
                      widget.viewModel.onPlay(index, mantra);
                      return;
                    }

                    try {
                      widget.viewModel.onStop(index, mantra);
                    } catch (e) {
                      print(e);
                    }
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
  final Duration position;
  final Duration duration;
  final VoidCallback onPressed;
  final Function(double position) onSeek;

  MantraPlayer({
    @required this.title,
    @required this.titleColor,
    @required this.backgroundColor,
    @required this.isPlaying,
    @required this.onPressed,
    @required this.position,
    @required this.duration,
    @required this.onSeek,
    this.fontSize = 24.0,
  });

  get positionString => position.toString().split('.').first;

  get durationString => duration.toString().split('.').first;

  Widget _buildTopDetail() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: isPlaying ? AppColors.primary : Color(0xFFFCDE4C),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: isPlaying ? Icon(Icons.stop, color: Colors.white) : Icon(Icons.play_arrow, color: Colors.white),
            onPressed: onPressed,
          ),
        ),
        SizedBox(width: 12.0),
        Expanded(
          child: Text(
            title,
            textAlign: TextAlign.start,
            style: TextStyle(color: titleColor, fontSize: fontSize, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }

  Widget _buildSeeker() {
    return Slider(
      activeColor: AppColors.primary,
      inactiveColor: Colors.white70,
      max: duration.inMilliseconds.toDouble(),
      min: 0.0,
      value: position.inMilliseconds.toDouble() ?? 0.0,
      onChanged: (value) => onSeek(value),
    );
  }

  Widget _buildTimeDetail() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          positionString,
          style: TextStyle(color: Colors.black54),
        ),
        Text(
          durationString,
          style: TextStyle(color: Colors.black54),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimension.screenHorizonPadding, vertical: Dimension.fieldVerticalMargin),
      margin: EdgeInsets.only(bottom: Dimension.fieldVerticalMargin),
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
      constraints: BoxConstraints(
        minHeight: 80.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTopDetail(),
          isPlaying ? _buildSeeker() : Container(),
          isPlaying ? _buildTimeDetail() : Container(),
        ],
      ),
    );
  }
}
