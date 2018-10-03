import 'package:buddish_project/constants.dart';
import 'package:buddish_project/data/model/survey.dart';
import 'package:buddish_project/data/model/survey_question.dart';
import 'package:buddish_project/redux/app/app_state.dart';
import 'package:buddish_project/redux/survey/survey_action.dart';
import 'package:buddish_project/ui/common/confirm_dialog.dart';
import 'package:buddish_project/utils/string_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class SurveyScreen extends StatefulWidget {
  static final String route = '/survey';

  @override
  _SurveyScreenState createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  final List<SurveyQestion> surveys = SurveyQestion.getSurveys();
  final PageController surveyController = PageController();

  int totalScore = 0;
  double page;
  bool finished;

  Widget _showAskResultDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return ConfirmDialog(
          title: 'ต้องการทำแบบสอบถามต่อหรือไม่',
          description: 'ข้อมูลของคุณเพียงพอต่อการสรุปผลแล้ว',
          confirmText: 'สรุปผล',
          cancelText: 'ทำต่อ',
          onCancel: () {
            _next(totalScore);
            Navigator.of(context).pop();
          },
          onConfirm: () {
            surveyController.jumpToPage(28);
            Navigator.of(context).pop();

            _save();

            setState(() {
              finished = true;
            });
          },
        );
      },
    );
  }

  void _next(int score) {
    setState(() {
      totalScore += score;
    });

    if (totalScore == 6) {
      _showAskResultDialog();
      return;
    }

    surveyController.nextPage(
      duration: Duration(milliseconds: 400),
      curve: Curves.easeOut,
    );

    setState(() {
      page++;
    });

    if (surveyController.page == Survey.maxQuestion - 1) {
      _save();

      setState(() {
        finished = true;
      });
    }
  }

  void _save() {
    final resultDescription = totalScore >= 6 ? 'ผิดปกติ' : 'ปกติ';
    final surveyResult = Survey(point: totalScore, result: resultDescription);

    final store = StoreProvider.of<AppState>(context);
    store.dispatch(CreateSurvey(surveyResult));
  }

  @override
  void initState() {
    super.initState();

    page = 1.0;
    finished = false;
  }

  @override
  void dispose() {
    super.dispose();

    surveyController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = surveys
        .map(
          (SurveyQestion survey) => SurveyWidget(
                survey: survey,
                onNext: _next,
                isResult: false,
                score: totalScore,
              ),
        )
        .toList();

    pages.add(
      SurveyWidget(
        survey: null,
        onNext: _next,
        isResult: true,
        score: totalScore,
      ),
    );

    final pageCount = !finished
        ? Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                '${page.toInt()}/${Survey.maxQuestion.toInt()}',
                style: TextStyle(color: Colors.black54),
              )
            ],
          )
        : Container();

    final surveyPages = Expanded(
      flex: 19,
      child: PageView(
        physics: NeverScrollableScrollPhysics(),
        pageSnapping: true,
        controller: surveyController,
        children: pages,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        title: Text(
          'แบบสอบถาม',
          style: AppStyle.appbarTitle,
        ),
        iconTheme: IconThemeData(color: AppColors.primary),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            pageCount,
            SizedBox(height: 16.0),
            surveyPages,
          ],
        ),
      ),
    );
  }
}

class ResultWidget extends StatelessWidget {
  final int score;
  final TextStyle titleStyle = TextStyle(color: AppColors.primary, fontSize: 22.0, fontWeight: FontWeight.w500);

  ResultWidget({
    @required this.score,
  });

  Widget _buildResultItem(String title, bool isSelected) {
    return Container(
      height: 50.0,
      margin: EdgeInsets.only(bottom: Dimension.fieldVerticalMargin),
      color: isSelected ? AppColors.secondary : Colors.grey.shade200,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 30.0),
          Text(title, style: titleStyle),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 80.0,
      margin: EdgeInsets.only(bottom: Dimension.fieldVerticalMargin),
      color: Color(0xFF84C554),
      child: Center(
        child: Text(
          'ระดับสุขภาพจิตของท่าน',
          style: TextStyle(
            color: Color(0xFF1c602a),
            fontSize: 28.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _buildHeader(),
          _buildResultItem('คุณมีสุขภาพจิตปกติ', score < 6),
          _buildResultItem('คุณมีสุขภาพจิตผิดปกติ ', score >= 6),
        ],
      ),
    );
  }
}

class SurveyWidget extends StatefulWidget {
  SurveyWidget({
    @required this.survey,
    @required this.onNext,
    @required this.isResult,
    @required this.score,
  });

  final SurveyQestion survey;
  final Function(int) onNext;
  final bool isResult;
  final int score;

  @override
  SurveyWidgetState createState() {
    return SurveyWidgetState();
  }
}

class SurveyWidgetState extends State<SurveyWidget> {
  String selectedAnswer = '';

  Widget _buildAnswer(String answer) {
    var titleStyle = TextStyle(color: AppColors.primary, fontSize: 22.0, fontWeight: FontWeight.w500);
    var title = Expanded(child: Text(answer, style: titleStyle));

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAnswer = answer;
        });
      },
      child: Container(
        margin: EdgeInsets.only(bottom: Dimension.fieldVerticalMargin),
        height: 50.0,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: answer == selectedAnswer ? AppColors.secondary : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 30.0),
            title,
          ],
        ),
      ),
    );
  }

  Widget _buildQuestion(String question) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          widget.survey.question,
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.primary, fontSize: 20.0, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  void _next() {
    if (getFirstCharacter(selectedAnswer) == 'ค' || getFirstCharacter(selectedAnswer) == 'ง')
      widget.onNext(1);
    else
      widget.onNext(0);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isResult) {
      return ResultWidget(score: widget.score);
    }

    var question = _buildQuestion(widget.survey.question);
    var answers = widget.survey.answers.map((String answer) => _buildAnswer(answer)).toList();

    var children = <Widget>[]
      ..add(Container(
        height: 100.0,
        child: question,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(4.0),
          boxShadow: AppStyle.boxShadow,
        ),
      ))
      ..add(SizedBox(height: 20.0))
      ..addAll(answers)
      ..add(SizedBox(height: 20.0))
      ..add(
        MaterialButton(
          elevation: 0.2,
          padding: EdgeInsets.symmetric(vertical: 8.0),
          minWidth: MediaQuery.of(context).size.width * 0.4,
          child: Text(
            'ต่อไป',
            style: TextStyle(fontSize: 22.0, color: AppColors.primary, fontWeight: FontWeight.w600),
          ),
          color: selectedAnswer.isNotEmpty ? AppColors.secondary : Colors.grey.shade200,
          onPressed: selectedAnswer.isNotEmpty ? _next : null,
        ),
      );

    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(
//          horizontal: Dimension.screenHorizonPadding,
//          vertical: Dimension.screenVerticalPadding,
            ),
        child: Column(children: children),
      ),
    );
  }
}
