// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnswerParamImpl _$$AnswerParamImplFromJson(Map<String, dynamic> json) =>
    _$AnswerParamImpl(
      assessmentId: json['assessment_id'] as String?,
      answers: (json['answers'] as List<dynamic>?)
          ?.map((e) => ItemChooseParam.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AnswerParamImplToJson(_$AnswerParamImpl instance) =>
    <String, dynamic>{
      'assessment_id': instance.assessmentId,
      'answers': instance.answers?.map((e) => e.toJson()).toList(),
    };
