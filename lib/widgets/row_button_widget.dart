import 'package:flutter/material.dart';

class RowButtonWidget extends StatelessWidget {
  final int currentQuestionNumber;
  final Function() goToPreviousQuestion;
  final Function() goToNextQuestion;

  const RowButtonWidget({
    super.key,
    required this.currentQuestionNumber,
    required this.goToPreviousQuestion,
    required this.goToNextQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Visibility(
            visible: currentQuestionNumber > 1,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent[700],
                ),
                onPressed: goToPreviousQuestion,
                child: const Icon(Icons.arrow_back_ios),
              ),
            ),
          ),
          const SizedBox(width: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            height: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent[700],
              ),
              onPressed: goToNextQuestion,
              child: const Icon(Icons.arrow_forward_ios),
            ),
          ),
        ],
      ),
    );
  }
}
