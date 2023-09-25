import 'package:flutter/material.dart';
import 'package:survey_app/models/survey_model.dart';
import 'package:survey_app/modules/finish_page.dart';
import 'package:survey_app/modules/question_page.dart';
import 'package:survey_app/utils/survey_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late Survey? survey;
  int currentQuestionNumber = 1;

  @override
  void initState() {
    super.initState();
    loadSurveyData();
  }

  Future<void> loadSurveyData() async {
    try {
      final loadedSurvey = await SurveyDataUtil.loadSurveyData();
      setState(() {
        survey = loadedSurvey;
      });
    } catch (error) {
      print('Error: $error');
    }
  }

  void goToNextQuestion() {
    if (survey == null) {
      return;
    }

    if (currentQuestionNumber < getTotalQuestionCount(survey!)) {
      currentQuestionNumber++;
      navigateToQuestion(currentQuestionNumber);
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => FinishPage(),
        ),
      );
    }
  }

  void goToPreviousQuestion() {
    if (survey == null) {
      return;
    }

    if (currentQuestionNumber > 1) {
      currentQuestionNumber--;
      navigateToQuestion(currentQuestionNumber);
    }
  }

  void navigateToQuestion(int questionNumber) {
    if (survey == null) {
      return;
    }

    final category = survey!.kategori[0];
    final question = category.pertanyaan[questionNumber - 1];

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => QuestionPage(
        navigateToQuestion: navigateToQuestion,
        currentQuestionNumber: currentQuestionNumber,
        goToPreviousQuestion: goToPreviousQuestion,
        goToNextQuestion: goToNextQuestion,
        questionNumber: questionNumber,
        category: category,
        question: question,
        totalQuestion: getTotalQuestionCount(survey!),
        survey: survey!,
      ),
    ));
  }

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
      body: survey == null
          ? const Center(child: CircularProgressIndicator())
          : BodyWidget(
              survey: survey!,
              navigateToQuestion: navigateToQuestion,
              currentQuestionNumber: currentQuestionNumber,
              goToPreviousQuestion: goToPreviousQuestion,
              goToNextQuestion: goToNextQuestion,
            ),
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    super.key,
    required this.survey,
    required this.navigateToQuestion,
    required this.goToPreviousQuestion,
    required this.goToNextQuestion,
    required this.currentQuestionNumber,
  });

  final Survey survey;
  final Function(int) navigateToQuestion;
  final Function() goToPreviousQuestion;
  final Function() goToNextQuestion;
  final int currentQuestionNumber;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                survey.name,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                survey.keterangan,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    navigateToQuestion(currentQuestionNumber);
                  },
                  child: const Text('MULAI SURVEY'),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

int getTotalQuestionCount(Survey survey) {
  int totalQuestions = 0;

  for (final category in survey.kategori) {
    totalQuestions += category.pertanyaan.length;
  }
  return totalQuestions;
}
