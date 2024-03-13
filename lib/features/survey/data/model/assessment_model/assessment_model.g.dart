// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assessment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AssessmentModelImpl _$$AssessmentModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AssessmentModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      assessementDate: json['assessement_date'] as String?,
      desc: json['description'] as String?,
      type: json['type'] as String?,
      roleAssessor: json['role_assessor'] as int?,
      roleAssessorName: json['role_assessor_name'] as String?,
      roleParticipant: json['role_participant'] as int?,
      roleParticipantName: json['role_participant_name'] as String?,
      departementId: json['departement_id'] as String?,
      departementName: json['departement_name'] as String?,
      siteLocationId: json['site_location_id'] as String?,
      siteLocationName: json['site_location_name'] as String?,
      image: json['image'] as String?,
      participants: (json['participants'] as List<dynamic>?)
          ?.map((e) => ParticipantModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      assessors: json['assessors'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      downloadedAt: json['downloaded_at'] as String?,
      hasResponses: json['has_responses'] as bool?,
    );

Map<String, dynamic> _$$AssessmentModelImplToJson(
        _$AssessmentModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'assessement_date': instance.assessementDate,
      'description': instance.desc,
      'type': instance.type,
      'role_assessor': instance.roleAssessor,
      'role_assessor_name': instance.roleAssessorName,
      'role_participant': instance.roleParticipant,
      'role_participant_name': instance.roleParticipantName,
      'departement_id': instance.departementId,
      'departement_name': instance.departementName,
      'site_location_id': instance.siteLocationId,
      'site_location_name': instance.siteLocationName,
      'image': instance.image,
      'participants': instance.participants,
      'assessors': instance.assessors,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'downloaded_at': instance.downloadedAt,
      'has_responses': instance.hasResponses,
    };
