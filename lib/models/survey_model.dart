import 'package:json_annotation/json_annotation.dart';

part 'survey_model.g.dart';

@JsonSerializable()
class Survey {
  final int id;
  final String name;
  final String keterangan;
  final List<Categorys> kategori;

  Survey({
    required this.id,
    required this.name,
    required this.keterangan,
    required this.kategori,
  });

  factory Survey.fromJson(Map<String, dynamic> json) => _$SurveyFromJson(json);
  Map<String, dynamic> toJson() => _$SurveyToJson(this);
}

@JsonSerializable()
class Categorys {
  final int id;
  final int no;
  final String kategori;
  final List<Question> pertanyaan;

  Categorys({
    required this.id,
    required this.no,
    required this.kategori,
    required this.pertanyaan,
  });

  factory Categorys.fromJson(Map<String, dynamic> json) =>
      _$CategorysFromJson(json);
  Map<String, dynamic> toJson() => _$CategorysToJson(this);
}

@JsonSerializable()
class Question {
  final int id;
  final int no;
  final String pertanyaan;
  final String tipe;
  final Option pilihan;
  final Range angka;
  final Yatidak yatidak;

  Question({
    required this.id,
    required this.no,
    required this.pertanyaan,
    required this.tipe,
    required this.pilihan,
    required this.angka,
    required this.yatidak,
  });

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}

@JsonSerializable()
class Option {
  final List<OptionItem> pilihan;
  final String petunjuk;
  final String lampiran_foto;

  Option({
    required this.pilihan,
    required this.petunjuk,
    required this.lampiran_foto,
  });

  factory Option.fromJson(Map<String, dynamic> json) =>
      _$OptionFromJson(json);
  Map<String, dynamic> toJson() => _$OptionToJson(this);
}

@JsonSerializable()
class OptionItem {
  final String status;
  final String keterangan;

  OptionItem({
    required this.status,
    required this.keterangan,
  });

  factory OptionItem.fromJson(Map<String, dynamic> json) =>
      _$OptionItemFromJson(json);
  Map<String, dynamic> toJson() => _$OptionItemToJson(this);
}

@JsonSerializable()
class Range {
  final String status;
  final int from;
  final int to;
  final String petunjuk;
  final String lampiran_foto;

  Range({
    required this.status,
    required this.from,
    required this.to,
    required this.petunjuk,
    required this.lampiran_foto,
  });

  factory Range.fromJson(Map<String, dynamic> json) =>
      _$RangeFromJson(json);
  Map<String, dynamic> toJson() => _$RangeToJson(this);
}

@JsonSerializable()
class Yatidak {
  final String ya;
  final String tidak;
  final String petunjuk;
  final String lampiran_foto;

  Yatidak({
    required this.ya,
    required this.tidak,
    required this.petunjuk,
    required this.lampiran_foto,
  });

  factory Yatidak.fromJson(Map<String, dynamic> json) =>
      _$YatidakFromJson(json);
  Map<String, dynamic> toJson() => _$YatidakToJson(this);
}
