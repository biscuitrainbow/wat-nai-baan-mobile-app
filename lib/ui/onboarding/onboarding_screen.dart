import 'package:buddish_project/constants.dart';
import 'package:buddish_project/ui/common/slider.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  static final String route = '/onboarding';

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<Slide> slides = [];


  @override
  void initState() {
    super.initState();

    slides.add(
      Slide(
        title: "ไตรสิกขา",
        subTitle: 'คือ',
        description: 'ข้อสำหรับศึกษา\nการศึกษาข้อปฏิบัติที่พึงศึกษา\nการฝึกฝนอบรมตน\nในเรื่องที่พึงศึกษา 3 อย่าง',
        pathImage: Asset.iconLotusWithText,
      ),
    );
    slides.add(
      Slide(
        title: "ศีล",
        subTitle: 'อธิสีลสิกขา',
        description: 'การศึกษาเรื่องศีล\nอบรมปฏิบัติให้ถูกต้องดีงาม\nเมื่อฝึกถึงจุดหนึ่ง\nจึงได้เรียกว่าเป็น อธิสีลสิกขา',
        pathImage: Asset.iconLotusWithText,
      ),
    );
    slides.add(
      Slide(
        title: "ปัญญา",
        subTitle: 'อธิปัญญหาสิกขา',
        description: 'การศึกษาเรื่องศีล\nอบรมปฏิบัติให้ถูกค้องดีงาม\nเมื่อฝึกถึงจุดหนึ่ง\nจึงได้เรียกว่าเป็น อธิปัญญาสิกขา',
        pathImage: Asset.iconLotusWithText,
      ),
    );
    slides.add(
      Slide(
        title: "สมาธิ",
        subTitle: 'อธิจิตตสิกขา',
        description: 'การศึกษาเรื่องจิต\nอบรมจิตให้สงบมั่นคงเป็นสมาธิ\nเมื่อฝึกถึงจุดหนึ่ง\nจึงได้เรียกว่าเป็น อธิจิตตสิกขา',
        pathImage: Asset.iconLotusWithText,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: slides,
      nameNextBtn: 'ต่อไป',
      nameSkipBtn: 'ข้าม',
      nameDoneBtn: 'เสร็จสิ้น',
      onSkipPress: () {
        Navigator.of(context).pop();
      },
      onDonePress: () {
        Navigator.of(context).pop();
      },
    );
  }
}
