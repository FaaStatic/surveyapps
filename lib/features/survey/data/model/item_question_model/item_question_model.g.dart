// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemQuestionModelImpl _$$ItemQuestionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ItemQuestionModelImpl(
      questionId: json['questionid'] as String?,
      section: json['section'] as String?,
      number: json['number'] as String?,
      type: json['type'] as String?,
      questionName: json['question_name'] as String?,
      scroring: json['scoring'] as bool?,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => ItemAnswerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ItemQuestionModelImplToJson(
        _$ItemQuestionModelImpl instance) =>
    <String, dynamic>{
      'questionid': instance.questionId,
      'section': instance.section,
      'number': instance.number,
      'type': instance.type,
      'question_name': instance.questionName,
      'scoring': instance.scroring,
      'options': instance.options,
    };
