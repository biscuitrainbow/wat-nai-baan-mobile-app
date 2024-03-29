import 'package:buddish_project/constants.dart';
import 'package:flutter/material.dart';

class IntroSlider extends StatefulWidget {
  // List slides
  final List<Slide> slides;

  // Skip button
  final Widget renderSkipBtn;
  final Function onSkipPress;
  final String nameSkipBtn;
  final TextStyle styleNameSkipBtn;
  final int colorSkipBtn;
  final int highlightColorSkipBtn;
  final bool isShowSkipBtn;
  final double borderRadiusSkipBtn;

  // Next, Done button
  final Widget renderNextBtn;
  final Widget renderDoneBtn;
  final Function onDonePress;
  final String nameNextBtn;
  final String nameDoneBtn;
  final TextStyle styleNameDoneBtn;
  final int colorDoneBtn;
  final int highlightColorDoneBtn;
  final double borderRadiusNextBtn;
  final double borderRadiusDoneBtn;

  // Dot indicator
  final bool isShowDotIndicator;
  final int colorDot;
  final int colorActiveDot;
  final double sizeDot;

  // Constructor
  IntroSlider({
    // List slides
    @required this.slides,

    // Skip button
    this.renderSkipBtn,
    this.onSkipPress,
    this.nameSkipBtn,
    this.styleNameSkipBtn,
    this.colorSkipBtn,
    this.highlightColorSkipBtn,
    this.isShowSkipBtn,
    this.borderRadiusSkipBtn,

    // Done button
    this.renderNextBtn,
    this.renderDoneBtn,
    this.onDonePress,
    this.nameNextBtn,
    this.nameDoneBtn,
    this.styleNameDoneBtn,
    this.colorDoneBtn,
    this.highlightColorDoneBtn,
    this.borderRadiusNextBtn,
    this.borderRadiusDoneBtn,

    // Dot indicator
    this.isShowDotIndicator,
    this.colorDot,
    this.colorActiveDot,
    this.sizeDot,
  });

  @override
  IntroSliderState createState() => new IntroSliderState(
        // List slides
        slides: this.slides,

        // Skip button
        renderSkipBtn: this.renderSkipBtn,
        onSkipPress: this.onSkipPress,
        nameSkipBtn: this.nameSkipBtn,
        styleNameSkipBtn: this.styleNameSkipBtn,
        colorSkipBtn: this.colorSkipBtn,
        highlightColorSkipBtn: this.highlightColorSkipBtn,
        isShowSkipBtn: this.isShowSkipBtn,
        borderRadiusSkipBtn: this.borderRadiusSkipBtn,

        // Done button
        renderNextBtn: this.renderNextBtn,
        renderDoneBtn: this.renderDoneBtn,
        onDonePress: this.onDonePress,
        nameNextBtn: this.nameNextBtn,
        nameDoneBtn: this.nameDoneBtn,
        styleNameDoneBtn: this.styleNameDoneBtn,
        colorDoneBtn: this.colorDoneBtn,
        highlightColorDoneBtn: this.highlightColorDoneBtn,
        borderRadiusNextBtn: this.borderRadiusNextBtn,
        borderRadiusDoneBtn: this.borderRadiusDoneBtn,

        // Dot indicator
        isShowDotIndicator: this.isShowDotIndicator,
        colorDot: this.colorDot,
        colorActiveDot: this.colorActiveDot,
        sizeDot: this.sizeDot,
      );
}

class IntroSliderState extends State<IntroSlider> with SingleTickerProviderStateMixin {
  // List slides
  final List<Slide> slides;

  // Skip button
  Widget renderSkipBtn;
  Function onSkipPress;
  String nameSkipBtn;
  TextStyle styleNameSkipBtn;
  int colorSkipBtn;
  int highlightColorSkipBtn;
  bool isShowSkipBtn;
  double borderRadiusSkipBtn;

  // Done button
  Widget renderNextBtn;
  Widget renderDoneBtn;
  Function onDonePress;
  String nameNextBtn;
  String nameDoneBtn;
  TextStyle styleNameDoneBtn;
  int colorDoneBtn;
  int highlightColorDoneBtn;
  double borderRadiusNextBtn;
  double borderRadiusDoneBtn;

  // Dot indicator
  bool isShowDotIndicator = true;
  int colorDot;
  int colorActiveDot;
  double sizeDot = 8.0;

  // Constructor
  IntroSliderState({
    // List slides
    @required this.slides,

    // Skip button
    @required this.renderSkipBtn,
    @required this.onSkipPress,
    @required this.nameSkipBtn,
    @required this.styleNameSkipBtn,
    @required this.colorSkipBtn,
    @required this.highlightColorSkipBtn,
    @required this.isShowSkipBtn,
    @required this.borderRadiusSkipBtn,

    // Done button
    @required this.renderNextBtn,
    @required this.renderDoneBtn,
    @required this.onDonePress,
    @required this.nameNextBtn,
    @required this.nameDoneBtn,
    @required this.styleNameDoneBtn,
    @required this.colorDoneBtn,
    @required this.highlightColorDoneBtn,
    @required this.borderRadiusNextBtn,
    @required this.borderRadiusDoneBtn,

    // Dot indicator
    @required this.isShowDotIndicator,
    @required this.colorDot,
    @required this.colorActiveDot,
    @required this.sizeDot,
  });

  TabController tabController;

  List<Widget> tabs = new List();
  List<Widget> dots = new List();

  @override
  void initState() {
    super.initState();

    tabController = new TabController(length: slides.length, vsync: this);
    tabController.addListener(() {
      // To change dot color
      this.setState(() {});
    });

    // Skip button
    if (onSkipPress == null) {
      onSkipPress = () {};
    }
    if (isShowSkipBtn == null) {
      isShowSkipBtn = true;
    }

    // Done button
    if (onDonePress == null) {
      onDonePress = () {};
    }

    // Dot indicator
    if (isShowDotIndicator == null) {
      isShowDotIndicator = true;
    }
    if (colorDot == null) {
      colorDot = 0x80000000;
    }
    if (colorActiveDot == null) {
      colorActiveDot = 0xffffffff;
    }
    if (sizeDot == null) {
      sizeDot = 8.0;
    }

    _buildTabs();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: slides.length,
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              TabBarView(
                children: _buildTabs(),
                controller: tabController,
              ),
              renderBottom(),
            ],
          ),
        ),
      ),
    );
  }

  Widget renderBottom() {
    return Positioned(
      child: Row(
        children: <Widget>[
          // Skip button
          (tabController.index + 1 != slides.length && isShowSkipBtn)
              ? Container(
                  child: renderSkipBtn != null
                      ? FlatButton(
                          child: renderSkipBtn,
                          onPressed: onSkipPress,
                          color: colorSkipBtn != null ? Color(colorSkipBtn) : Colors.transparent,
                          highlightColor: highlightColorSkipBtn != null ? Color(highlightColorSkipBtn) : Colors.white.withOpacity(0.3),
                          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(borderRadiusSkipBtn ?? 30.0)),
                        )
                      : FlatButton(
                          onPressed: onSkipPress,
                          child: Text(
                            nameSkipBtn ?? "SKIP",
                            style: TextStyle(color: Colors.white, fontFamily: 'Kanit'),
                          ),
                          color: colorSkipBtn != null ? Color(colorSkipBtn) : Colors.transparent,
                          highlightColor: highlightColorSkipBtn != null ? Color(highlightColorSkipBtn) : Colors.white.withOpacity(0.3),
                          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(borderRadiusSkipBtn ?? 30.0)),
                        ),
                  width: 70.0,
                  height: 70.0,
                )
              : Container(
                  width: 80.0,
                  height: 70.0,
                ),

          // Dot indicator
          Flexible(
            child: isShowDotIndicator
                ? Row(
                    children: renderListDots(),
                    mainAxisAlignment: MainAxisAlignment.center,
                  )
                : Container(),
          ),

          // Next, Done button
          Container(
            child: tabController.index + 1 == slides.length
                ? (renderDoneBtn != null
                    ? FlatButton(
                        child: renderDoneBtn,
                        onPressed: onDonePress,
                        color: colorDoneBtn != null ? Color(colorDoneBtn) : Colors.transparent,
                        highlightColor: highlightColorDoneBtn != null ? Color(highlightColorDoneBtn) : Colors.white.withOpacity(0.3),
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(borderRadiusDoneBtn ?? 30.0)),
                      )
                    : FlatButton(
                        onPressed: onDonePress,
                        child: Text(
                          nameDoneBtn ?? "DONE",
                          style: TextStyle(color: Colors.white, fontFamily: 'Kanit'),
                        ),
                        color: colorDoneBtn != null ? Color(colorDoneBtn) : Colors.transparent,
                        highlightColor: highlightColorDoneBtn != null ? Color(highlightColorDoneBtn) : Colors.white.withOpacity(0.3),
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(borderRadiusDoneBtn ?? 30.0)),
                      ))
                : (renderNextBtn != null
                    ? FlatButton(
                        onPressed: () {
                          tabController.animateTo(tabController.index + 1);
                        },
                        child: renderNextBtn,
                        color: colorDoneBtn != null ? Color(colorDoneBtn) : Colors.transparent,
                        highlightColor: highlightColorDoneBtn != null ? Color(highlightColorDoneBtn) : Colors.white.withOpacity(0.3),
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(borderRadiusNextBtn ?? 30.0)),
                      )
                    : FlatButton(
                        onPressed: () {
                          tabController.animateTo(tabController.index + 1);
                        },
                        child: Text(
                          nameNextBtn ?? "NEXT",
                          style: TextStyle(color: Colors.white, fontFamily: 'Kanit'),
                        ),
                        color: colorDoneBtn != null ? Color(colorDoneBtn) : Colors.transparent,
                        highlightColor: highlightColorDoneBtn != null ? Color(highlightColorDoneBtn) : Colors.white.withOpacity(0.3),
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(borderRadiusNextBtn ?? 30.0)),
                      )),
            width: 80.0,
            height: 70.0,
          ),
        ],
      ),
      bottom: 10.0,
      left: 10.0,
      right: 10.0,
      height: 50.0,
    );
  }

  List<Widget> _buildTabs() {
    return slides.map((Slide slide) => renderTab(slide)).toList();
  }

  Widget _buildHeader(String title, String subtitle) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w500,
            fontFamily: 'Kanit',
            fontSize: 48.0,
          ),
        ),
        Text(
          subtitle,
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w500,
            fontFamily: 'Kanit',
            fontSize: 32.0,
          ),
        ),
      ],
    );
  }

  Widget _buildLogo(String image) {
    return Column(
      children: <Widget>[
        Image.asset(
          image ?? "",
          width: 170.0,
          height: 170.0,
          fit: BoxFit.contain,
        ),
      ],
    );
  }

  Widget renderTab(Slide slide) {
    return Container(
      padding: EdgeInsets.only(top: 18.0, bottom: 64.0),
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.gradientStart,
            AppColors.gradientStart,
            AppColors.gradientStart,
            AppColors.gradientEnd,
          ],
        ),
      ),
      child: ListView(
        children: <Widget>[
          _buildLogo(slide.pathImage),
          _buildHeader(slide.title, slide.subTitle),
          SizedBox(height: 24.0),
          Text(
            slide.description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w300,
              fontFamily: 'Kanit',
              fontSize: 24.0,
            ),
          )
        ],
      ),
    );
  }

  List<Widget> renderListDots() {
    dots.clear();
    for (int i = 0; i < slides.length; i++) {
      int currentColor;
      if (tabController.index == i) {
        currentColor = colorActiveDot;
      } else {
        currentColor = colorDot;
      }
      dots.add(renderDot(sizeDot, currentColor));
    }
    return dots;
  }

  Widget renderDot(double radius, int color) {
    return Container(
      decoration: BoxDecoration(color: Color(color), borderRadius: BorderRadius.circular(radius / 2)),
      width: radius,
      height: radius,
      margin: EdgeInsets.all(radius / 2),
    );
  }
}

class Slide {
  // Title
  String title;
  String subTitle;

  String pathImage;
  double widthImage;
  double heightImage;

  // Description
  String description;

  // Background color

  // Skip button
  String nameSkipBtn;
  TextStyle styleNameSkipBtn;
  int colorSkipBtn;
  int highlightColorSkipBtn;

  // Done button
  String nameDoneBtn;
  TextStyle styleNameDoneBtn;
  int colorDoneBtn;
  int highlightColorDoneBtn;

  Slide({
    // Title
    String title,
    String subTitle,

    // Image
    String pathImage,

    // Description
    String description,

    // Background color
  }) {
    // Title
    this.title = title;
    this.subTitle = subTitle;

    // Image
    this.pathImage = pathImage;
    this.widthImage = widthImage;
    this.heightImage = heightImage;

    // Description
    this.description = description;

    // Skip button
    this.nameSkipBtn = nameSkipBtn;
    this.styleNameSkipBtn = styleNameSkipBtn;
    this.colorSkipBtn = colorSkipBtn;
    this.highlightColorSkipBtn = highlightColorSkipBtn;

    // Done button
    this.nameDoneBtn = nameDoneBtn;
    this.styleNameDoneBtn = styleNameDoneBtn;
    this.colorDoneBtn = colorDoneBtn;
    this.highlightColorDoneBtn = highlightColorDoneBtn;
  }
}
