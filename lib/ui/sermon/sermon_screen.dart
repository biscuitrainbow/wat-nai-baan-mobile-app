import 'package:buddish_project/constants.dart';
import 'package:buddish_project/data/model/sermon_category.dart';
import 'package:buddish_project/ui/menu/menu_screen.dart';
import 'package:buddish_project/ui/sermon_video/sermon_video_container.dart';
import 'package:flutter/material.dart';

class SermonScreen extends StatefulWidget {
  static final String route = '/sermon';

  @override
  _SermonScreenState createState() => _SermonScreenState();
}

class _SermonScreenState extends State<SermonScreen> {
  final List<SermonCategory> categories = [
    SermonCategory(
      title: 'ธรรมบรรยาย',
      playlistId: 'PLVmDVWbOI1-HjfNY6N0BiN2LUhcbbZrGT',
    ),
    SermonCategory(
      title: 'เทศน์ล้านนา',
      playlistId: 'PLVmDVWbOI1-Ea4dhBOvZ0XnWSl7a1PEEx',
    ),
    SermonCategory(
      title: 'การปฏิบัติธรรม',
      playlistId: 'PLVmDVWbOI1-GLxoi5RY8I8UEUYUJEXA9z',
    )
  ];



  void _showSermonVideos(SermonCategory category) {
    Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => SermonVideoContainer(
                category: category,
              ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        title: Text(
          'ฟังเทศน์ ฟังธรรม',
          style: Style.appbarTitleStyle,
        ),
        iconTheme: IconThemeData(color: AppColors.main),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: Dimension.screenHorizonPadding, vertical: Dimension.screenVerticalPadding),
          child: Column(
            children: categories
                ?.map(
                  (SermonCategory category) => Menu(
                        title: category.title,
                        titleColor: AppColors.main,
                        backgroundColor: AppColors.secondary,
                        onPressed: () => _showSermonVideos(category),
                      ),
                )
                ?.toList(),
          ),
        ),
      ),
    );
  }
}
