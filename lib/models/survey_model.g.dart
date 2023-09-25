// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Survey _$SurveyFromJson(Map<String, dynamic> json) => Survey(
      id: json['id'] as int,
      name: json['name'] as String,
      keterangan: json['keterangan'] as String,
      kategori: (json['kategori'] as List<dynamic>)
          .map((e) => Categorys.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SurveyToJson(Survey instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'keterangan': instance.keterangan,
      'kategori': instance.kategori,
    };

Categorys _$CategorysFromJson(Map<String, dynamic> json) => Categorys(
      id: json['id'] as int,
      no: json['no'] as int,
      kategori: json['kategori'] as String,
      pertanyaan: (json['pertanyaan'] as List<dynamic>)
          .map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategorysToJson(Categorys instance) => <String, dynamic>{
      'id': instance.id,
      'no': instance.no,
      'kategori': instance.kategori,
      'pertanyaan': instance.pertanyaan,
    };

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      id: json['id'] as int,
      no: json['no'] as int,
      pertanyaan: json['pertanyaan'] as String,
      tipe: json['tipe'] as String,
      pilihan: Option.fromJson(json['pilihan'] as Map<String, dynamic>),
      angka: Range.fromJson(json['angka'] as Map<String, dynamic>),
      yatidak: Yatidak.fromJson(json['yatidak'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'id': instance.id,
      'no': instance.no,
      'pertanyaan': instance.pertanyaan,
      'tipe': instance.tipe,
      'pilihan': instance.pilihan,
      'angka': instance.angka,
      'yatidak': instance.yatidak,
    };

Option _$OptionFromJson(Map<String, dynamic> json) => Option(
      pilihan: (json['pilihan'] as List<dynamic>)
          .map((e) => OptionItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      petunjuk: json['petunjuk'] as String,
      lampiran_foto: json['lampiran_foto'] as String,
    );

Map<String, dynamic> _$OptionToJson(Option instance) => <String, dynamic>{
      'pilihan': instance.pilihan,
      'petunjuk': instance.petunjuk,
      'lampiran_foto': instance.lampiran_foto,
    };

OptionItem _$OptionItemFromJson(Map<String, dynamic> json) => OptionItem(
      status: json['status'] as String,
      keterangan: json['keterangan'] as String,
    );

Map<String, dynamic> _$OptionItemToJson(OptionItem instance) =>
    <String, dynamic>{
      'status': instance.status,
      'keterangan': instance.keterangan,
    };

Range _$RangeFromJson(Map<String, dynamic> json) => Range(
      status: json['status'] as String,
      from: json['from'] as int,
      to: json['to'] as int,
      petunjuk: json['petunjuk'] as String,
      lampiran_foto: json['lampiran_foto'] as String,
    );

Map<String, dynamic> _$RangeToJson(Range instance) => <String, dynamic>{
      'status': instance.status,
      'from': instance.from,
      'to': instance.to,
      'petunjuk': instance.petunjuk,
      'lampiran_foto': instance.lampiran_foto,
    };

Yatidak _$YatidakFromJson(Map<String, dynamic> json) => Yatidak(
      ya: json['ya'] as String,
      tidak: json['tidak'] as String,
      petunjuk: json['petunjuk'] as String,
      lampiran_foto: json['lampiran_foto'] as String,
    );

Map<String, dynamic> _$YatidakToJson(Yatidak instance) => <String, dynamic>{
      'ya': instance.ya,
      'tidak': instance.tidak,
      'petunjuk': instance.petunjuk,
      'lampiran_foto': instance.lampiran_foto,
    };
