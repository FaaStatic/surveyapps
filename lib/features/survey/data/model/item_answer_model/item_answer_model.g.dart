// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_answer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemAnswerModelImpl _$$ItemAnswerModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ItemAnswerModelImpl(
      optionid: json['optionid'] as String?,
      optionName: json['option_name'] as String?,
      points: json['points'] as int?,
      flag: json['flag'] as int?,
      siteLocationIds: json['site_location_ids'],
    );

Map<String, dynamic> _$$ItemAnswerModelImplToJson(
        _$ItemAnswerModelImpl instance) =>
    <String, dynamic>{
      'optionid': instance.optionid,
      'option_name': instance.optionName,
      'points': instance.points,
      'flag': instance.flag,
      'site_location_ids': instance.siteLocationIds,
    };
