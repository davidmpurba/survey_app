import 'package:flutter/material.dart';
import 'package:survey_app/models/survey_model.dart';
import 'package:survey_app/widgets/app_widget.dart';
import 'package:survey_app/widgets/row_button_widget.dart';

class QuestionPage extends StatefulWidget {
  final int totalQuestion;
  final int questionNumber;
  final Categorys category;
  final Question question;
  final Survey survey;
  final Function(int) navigateToQuestion;
  final Function() goToPreviousQuestion;
  final Function() goToNextQuestion;
  final int currentQuestionNumber;

  const QuestionPage({
    super.key,
    required this.totalQuestion,
    required this.questionNumber,
    required this.category,
    required this.question,
    required this.survey,
    required this.navigateToQuestion,
    required this.goToPreviousQuestion,
    required this.goToNextQuestion,
    required this.currentQuestionNumber,
  });

  @override
  QuestionPageState createState() => QuestionPageState();
}

class QuestionPageState extends State<QuestionPage> {
  String? textAnswer;
  int? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          alignment: Alignment.centerLeft,
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.grey),
              bottom: BorderSide(color: Colors.grey),
            ),
          ),
          child: const Text(
            'SURVEY APP',
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Wrap(
          alignment: WrapAlignment.spaceBetween,
          runAlignment: WrapAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.55,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  QuestionInfo(
                    totalQuestion: widget.totalQuestion,
                    questionNumber: widget.questionNumber,
                  ),
                  Text(
                    widget.question.pertanyaan,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Petunjuk',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  AnswerWidget(
                    textAnswer: textAnswer,
                    selectedOption: selectedOption,
                    onTextAnswerChanged: (value) {
                      setState(() {
                        textAnswer = value;
                      });
                    },
                    onOptionSelected: (value) {
                      setState(() {
                        selectedOption = value;
                      });
                    },
                    questionType: widget.question.tipe,
                    choices: widget.question.pilihan.pilihan,
                  ),
                ],
              ),
            ),
            RowButtonWidget(
              currentQuestionNumber: widget.currentQuestionNumber,
              goToPreviousQuestion: widget.goToPreviousQuestion,
              goToNextQuestion: () {
                if ((textAnswer != null && textAnswer!.isNotEmpty) ||
                    selectedOption != null) {
                  widget.goToNextQuestion();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
