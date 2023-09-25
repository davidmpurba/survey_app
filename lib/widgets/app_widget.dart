import 'package:flutter/material.dart';
import 'package:survey_app/models/survey_model.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class QuestionInfo extends StatelessWidget {
  final int totalQuestion;
  final int questionNumber;

  QuestionInfo({super.key,
    required this.totalQuestion,
    required this.questionNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '$questionNumber/$totalQuestion',
      style: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class AnswerWidget extends StatelessWidget {
  final String? textAnswer;
  final int? selectedOption;
  final Function(String) onTextAnswerChanged;
  final Function(int?) onOptionSelected;
  final String questionType;
  final List<OptionItem> choices;

  AnswerWidget({super.key,
    required this.textAnswer,
    required this.selectedOption,
    required this.onTextAnswerChanged,
    required this.onOptionSelected,
    required this.questionType,
    required this.choices,
  });

  @override
  Widget build(BuildContext context) {
    if (questionType == 'isian angka') {
      return TextField(
        keyboardType: TextInputType.number,
        onChanged: onTextAnswerChanged,
        decoration: const InputDecoration(
          hintText: 'Masukkan jawaban...',
        ),
      );
    } else if (questionType == 'ya/tidak') {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[400],
              ),
              onPressed: () {
                onTextAnswerChanged('TIDAK');
              },
              child: const Text(
                'TIDAK',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            flex: 2,
            child: ElevatedButton(
              onPressed: () {
                onTextAnswerChanged('YA');
              },
              child: const Text('YA'),
            ),
          ),
        ],
      );
    } else if (questionType == 'pilihan') {
      return Column(
        children: choices.asMap().entries.map((entry) {
          final index = entry.key;
          final choice = entry.value.keterangan;
          return RadioListTile<int>(
            title: Text(choice),
            value: index,
            groupValue: selectedOption,
            onChanged: onOptionSelected,
          );
        }).toList(),
      );
    } else {
      return const SizedBox();
    }
  }
}


