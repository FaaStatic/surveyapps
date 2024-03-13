// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ParticipantModelImpl _$$ParticipantModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ParticipantModelImpl(
      nik: json['nik'] as String?,
      name: json['name'] as String?,
      departement: json['departement'] as String?,
      departementId: json['departement_id'] as String?,
      role: json['role'] as String?,
      roleId: json['role_id'] as int?,
      siteLocation: json['site_location'] as String?,
      siteLocationId: json['site_location_id'] as String?,
      totalAssessment: json['total_assessment'] as int?,
      lastAssessment: json['last_assessment'] as String?,
      imageProfile: json['image_profile'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$ParticipantModelImplToJson(
        _$ParticipantModelImpl instance) =>
    <String, dynamic>{
      'nik': instance.nik,
      'name': instance.name,
      'departement': instance.departement,
      'departement_id': instance.departementId,
      'role': instance.role,
      'role_id': instance.roleId,
      'site_location': instance.siteLocation,
      'site_location_id': instance.siteLocationId,
      'total_assessment': instance.totalAssessment,
      'last_assessment': instance.lastAssessment,
      'image_profile': instance.imageProfile,
      'created_at': instance.createdAt?.toIso8601String(),
    };
