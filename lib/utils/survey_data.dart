
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:survey_app/models/survey_model.dart';

class SurveyDataUtil {
  static Future<Survey> loadSurveyData() async {
    try {
      final jsonText = await rootBundle.loadString('assets/survey_data.json');
      final jsonData = json.decode(jsonText);
      return Survey.fromJson(jsonData);
    } catch (error) {
      throw Exception('Failed to load survey data: $error');
    }
  }
}
