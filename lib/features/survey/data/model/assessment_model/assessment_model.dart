import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:synapsissurvey/features/survey/data/model/participant_model/participant_model.dart';

part 'assessment_model.freezed.dart';
part 'assessment_model.g.dart';

@freezed
class AssessmentModel with _$AssessmentModel {
  const factory AssessmentModel(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "assessement_date") String? assessementDate,
      @JsonKey(name: "description") String? desc,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "role_assessor") int? roleAssessor,
      @JsonKey(name: "role_assessor_name") String? roleAssessorName,
      @JsonKey(name: "role_participant") int? roleParticipant,
      @JsonKey(name: "role_participant_name") String? roleParticipantName,
      @JsonKey(name: "departement_id") String? departementId,
      @JsonKey(name: "departement_name") String? departementName,
      @JsonKey(name: "site_location_id") String? siteLocationId,
      @JsonKey(name: "site_location_name") String? siteLocationName,
      @JsonKey(name: "image") String? image,
      @JsonKey(name: "participants") List<ParticipantModel>? participants,
      @JsonKey(name: "assessors") String? assessors,
      @JsonKey(name: "created_at") String? createdAt,
      @JsonKey(name: "updated_at") String? updatedAt,
      @JsonKey(name: "downloaded_at") String? downloadedAt,
      @JsonKey(name: "has_responses") bool? hasResponses}) = _AssessmentModel;

  factory AssessmentModel.fromJson(Map<String, dynamic> json) =>
      _$AssessmentModelFromJson(json);
}
