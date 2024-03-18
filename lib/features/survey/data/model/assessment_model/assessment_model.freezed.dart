// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assessment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AssessmentModel _$AssessmentModelFromJson(Map<String, dynamic> json) {
  return _AssessmentModel.fromJson(json);
}

/// @nodoc
mixin _$AssessmentModel {
  @JsonKey(name: "id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "assessement_date")
  String? get assessementDate => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String? get desc => throw _privateConstructorUsedError;
  @JsonKey(name: "type")
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: "role_assessor")
  dynamic get roleAssessor => throw _privateConstructorUsedError;
  @JsonKey(name: "role_assessor_name")
  String? get roleAssessorName => throw _privateConstructorUsedError;
  @JsonKey(name: "role_participant")
  dynamic get roleParticipant => throw _privateConstructorUsedError;
  @JsonKey(name: "role_participant_name")
  String? get roleParticipantName => throw _privateConstructorUsedError;
  @JsonKey(name: "departement_id")
  String? get departementId => throw _privateConstructorUsedError;
  @JsonKey(name: "departement_name")
  String? get departementName => throw _privateConstructorUsedError;
  @JsonKey(name: "site_location_id")
  String? get siteLocationId => throw _privateConstructorUsedError;
  @JsonKey(name: "site_location_name")
  String? get siteLocationName => throw _privateConstructorUsedError;
  @JsonKey(name: "image")
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: "participants")
  List<ParticipantModel>? get participants =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "assessors")
  String? get assessors => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "downloaded_at")
  String? get downloadedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "has_responses")
  bool? get hasResponses => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssessmentModelCopyWith<AssessmentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssessmentModelCopyWith<$Res> {
  factory $AssessmentModelCopyWith(
          AssessmentModel value, $Res Function(AssessmentModel) then) =
      _$AssessmentModelCopyWithImpl<$Res, AssessmentModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "assessement_date") String? assessementDate,
      @JsonKey(name: "description") String? desc,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "role_assessor") dynamic roleAssessor,
      @JsonKey(name: "role_assessor_name") String? roleAssessorName,
      @JsonKey(name: "role_participant") dynamic roleParticipant,
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
      @JsonKey(name: "has_responses") bool? hasResponses});
}

/// @nodoc
class _$AssessmentModelCopyWithImpl<$Res, $Val extends AssessmentModel>
    implements $AssessmentModelCopyWith<$Res> {
  _$AssessmentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? assessementDate = freezed,
    Object? desc = freezed,
    Object? type = freezed,
    Object? roleAssessor = freezed,
    Object? roleAssessorName = freezed,
    Object? roleParticipant = freezed,
    Object? roleParticipantName = freezed,
    Object? departementId = freezed,
    Object? departementName = freezed,
    Object? siteLocationId = freezed,
    Object? siteLocationName = freezed,
    Object? image = freezed,
    Object? participants = freezed,
    Object? assessors = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? downloadedAt = freezed,
    Object? hasResponses = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      assessementDate: freezed == assessementDate
          ? _value.assessementDate
          : assessementDate // ignore: cast_nullable_to_non_nullable
              as String?,
      desc: freezed == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      roleAssessor: freezed == roleAssessor
          ? _value.roleAssessor
          : roleAssessor // ignore: cast_nullable_to_non_nullable
              as dynamic,
      roleAssessorName: freezed == roleAssessorName
          ? _value.roleAssessorName
          : roleAssessorName // ignore: cast_nullable_to_non_nullable
              as String?,
      roleParticipant: freezed == roleParticipant
          ? _value.roleParticipant
          : roleParticipant // ignore: cast_nullable_to_non_nullable
              as dynamic,
      roleParticipantName: freezed == roleParticipantName
          ? _value.roleParticipantName
          : roleParticipantName // ignore: cast_nullable_to_non_nullable
              as String?,
      departementId: freezed == departementId
          ? _value.departementId
          : departementId // ignore: cast_nullable_to_non_nullable
              as String?,
      departementName: freezed == departementName
          ? _value.departementName
          : departementName // ignore: cast_nullable_to_non_nullable
              as String?,
      siteLocationId: freezed == siteLocationId
          ? _value.siteLocationId
          : siteLocationId // ignore: cast_nullable_to_non_nullable
              as String?,
      siteLocationName: freezed == siteLocationName
          ? _value.siteLocationName
          : siteLocationName // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      participants: freezed == participants
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<ParticipantModel>?,
      assessors: freezed == assessors
          ? _value.assessors
          : assessors // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      downloadedAt: freezed == downloadedAt
          ? _value.downloadedAt
          : downloadedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      hasResponses: freezed == hasResponses
          ? _value.hasResponses
          : hasResponses // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssessmentModelImplCopyWith<$Res>
    implements $AssessmentModelCopyWith<$Res> {
  factory _$$AssessmentModelImplCopyWith(_$AssessmentModelImpl value,
          $Res Function(_$AssessmentModelImpl) then) =
      __$$AssessmentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "assessement_date") String? assessementDate,
      @JsonKey(name: "description") String? desc,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "role_assessor") dynamic roleAssessor,
      @JsonKey(name: "role_assessor_name") String? roleAssessorName,
      @JsonKey(name: "role_participant") dynamic roleParticipant,
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
      @JsonKey(name: "has_responses") bool? hasResponses});
}

/// @nodoc
class __$$AssessmentModelImplCopyWithImpl<$Res>
    extends _$AssessmentModelCopyWithImpl<$Res, _$AssessmentModelImpl>
    implements _$$AssessmentModelImplCopyWith<$Res> {
  __$$AssessmentModelImplCopyWithImpl(
      _$AssessmentModelImpl _value, $Res Function(_$AssessmentModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? assessementDate = freezed,
    Object? desc = freezed,
    Object? type = freezed,
    Object? roleAssessor = freezed,
    Object? roleAssessorName = freezed,
    Object? roleParticipant = freezed,
    Object? roleParticipantName = freezed,
    Object? departementId = freezed,
    Object? departementName = freezed,
    Object? siteLocationId = freezed,
    Object? siteLocationName = freezed,
    Object? image = freezed,
    Object? participants = freezed,
    Object? assessors = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? downloadedAt = freezed,
    Object? hasResponses = freezed,
  }) {
    return _then(_$AssessmentModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      assessementDate: freezed == assessementDate
          ? _value.assessementDate
          : assessementDate // ignore: cast_nullable_to_non_nullable
              as String?,
      desc: freezed == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      roleAssessor: freezed == roleAssessor
          ? _value.roleAssessor
          : roleAssessor // ignore: cast_nullable_to_non_nullable
              as dynamic,
      roleAssessorName: freezed == roleAssessorName
          ? _value.roleAssessorName
          : roleAssessorName // ignore: cast_nullable_to_non_nullable
              as String?,
      roleParticipant: freezed == roleParticipant
          ? _value.roleParticipant
          : roleParticipant // ignore: cast_nullable_to_non_nullable
              as dynamic,
      roleParticipantName: freezed == roleParticipantName
          ? _value.roleParticipantName
          : roleParticipantName // ignore: cast_nullable_to_non_nullable
              as String?,
      departementId: freezed == departementId
          ? _value.departementId
          : departementId // ignore: cast_nullable_to_non_nullable
              as String?,
      departementName: freezed == departementName
          ? _value.departementName
          : departementName // ignore: cast_nullable_to_non_nullable
              as String?,
      siteLocationId: freezed == siteLocationId
          ? _value.siteLocationId
          : siteLocationId // ignore: cast_nullable_to_non_nullable
              as String?,
      siteLocationName: freezed == siteLocationName
          ? _value.siteLocationName
          : siteLocationName // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      participants: freezed == participants
          ? _value._participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<ParticipantModel>?,
      assessors: freezed == assessors
          ? _value.assessors
          : assessors // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      downloadedAt: freezed == downloadedAt
          ? _value.downloadedAt
          : downloadedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      hasResponses: freezed == hasResponses
          ? _value.hasResponses
          : hasResponses // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssessmentModelImpl implements _AssessmentModel {
  const _$AssessmentModelImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "name") this.name,
      @JsonKey(name: "assessement_date") this.assessementDate,
      @JsonKey(name: "description") this.desc,
      @JsonKey(name: "type") this.type,
      @JsonKey(name: "role_assessor") this.roleAssessor,
      @JsonKey(name: "role_assessor_name") this.roleAssessorName,
      @JsonKey(name: "role_participant") this.roleParticipant,
      @JsonKey(name: "role_participant_name") this.roleParticipantName,
      @JsonKey(name: "departement_id") this.departementId,
      @JsonKey(name: "departement_name") this.departementName,
      @JsonKey(name: "site_location_id") this.siteLocationId,
      @JsonKey(name: "site_location_name") this.siteLocationName,
      @JsonKey(name: "image") this.image,
      @JsonKey(name: "participants") final List<ParticipantModel>? participants,
      @JsonKey(name: "assessors") this.assessors,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "updated_at") this.updatedAt,
      @JsonKey(name: "downloaded_at") this.downloadedAt,
      @JsonKey(name: "has_responses") this.hasResponses})
      : _participants = participants;

  factory _$AssessmentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssessmentModelImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final String? id;
  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "assessement_date")
  final String? assessementDate;
  @override
  @JsonKey(name: "description")
  final String? desc;
  @override
  @JsonKey(name: "type")
  final String? type;
  @override
  @JsonKey(name: "role_assessor")
  final dynamic roleAssessor;
  @override
  @JsonKey(name: "role_assessor_name")
  final String? roleAssessorName;
  @override
  @JsonKey(name: "role_participant")
  final dynamic roleParticipant;
  @override
  @JsonKey(name: "role_participant_name")
  final String? roleParticipantName;
  @override
  @JsonKey(name: "departement_id")
  final String? departementId;
  @override
  @JsonKey(name: "departement_name")
  final String? departementName;
  @override
  @JsonKey(name: "site_location_id")
  final String? siteLocationId;
  @override
  @JsonKey(name: "site_location_name")
  final String? siteLocationName;
  @override
  @JsonKey(name: "image")
  final String? image;
  final List<ParticipantModel>? _participants;
  @override
  @JsonKey(name: "participants")
  List<ParticipantModel>? get participants {
    final value = _participants;
    if (value == null) return null;
    if (_participants is EqualUnmodifiableListView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "assessors")
  final String? assessors;
  @override
  @JsonKey(name: "created_at")
  final String? createdAt;
  @override
  @JsonKey(name: "updated_at")
  final String? updatedAt;
  @override
  @JsonKey(name: "downloaded_at")
  final String? downloadedAt;
  @override
  @JsonKey(name: "has_responses")
  final bool? hasResponses;

  @override
  String toString() {
    return 'AssessmentModel(id: $id, name: $name, assessementDate: $assessementDate, desc: $desc, type: $type, roleAssessor: $roleAssessor, roleAssessorName: $roleAssessorName, roleParticipant: $roleParticipant, roleParticipantName: $roleParticipantName, departementId: $departementId, departementName: $departementName, siteLocationId: $siteLocationId, siteLocationName: $siteLocationName, image: $image, participants: $participants, assessors: $assessors, createdAt: $createdAt, updatedAt: $updatedAt, downloadedAt: $downloadedAt, hasResponses: $hasResponses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssessmentModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.assessementDate, assessementDate) ||
                other.assessementDate == assessementDate) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other.roleAssessor, roleAssessor) &&
            (identical(other.roleAssessorName, roleAssessorName) ||
                other.roleAssessorName == roleAssessorName) &&
            const DeepCollectionEquality()
                .equals(other.roleParticipant, roleParticipant) &&
            (identical(other.roleParticipantName, roleParticipantName) ||
                other.roleParticipantName == roleParticipantName) &&
            (identical(other.departementId, departementId) ||
                other.departementId == departementId) &&
            (identical(other.departementName, departementName) ||
                other.departementName == departementName) &&
            (identical(other.siteLocationId, siteLocationId) ||
                other.siteLocationId == siteLocationId) &&
            (identical(other.siteLocationName, siteLocationName) ||
                other.siteLocationName == siteLocationName) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality()
                .equals(other._participants, _participants) &&
            (identical(other.assessors, assessors) ||
                other.assessors == assessors) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.downloadedAt, downloadedAt) ||
                other.downloadedAt == downloadedAt) &&
            (identical(other.hasResponses, hasResponses) ||
                other.hasResponses == hasResponses));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        assessementDate,
        desc,
        type,
        const DeepCollectionEquality().hash(roleAssessor),
        roleAssessorName,
        const DeepCollectionEquality().hash(roleParticipant),
        roleParticipantName,
        departementId,
        departementName,
        siteLocationId,
        siteLocationName,
        image,
        const DeepCollectionEquality().hash(_participants),
        assessors,
        createdAt,
        updatedAt,
        downloadedAt,
        hasResponses
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssessmentModelImplCopyWith<_$AssessmentModelImpl> get copyWith =>
      __$$AssessmentModelImplCopyWithImpl<_$AssessmentModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssessmentModelImplToJson(
      this,
    );
  }
}

abstract class _AssessmentModel implements AssessmentModel {
  const factory _AssessmentModel(
      {@JsonKey(name: "id") final String? id,
      @JsonKey(name: "name") final String? name,
      @JsonKey(name: "assessement_date") final String? assessementDate,
      @JsonKey(name: "description") final String? desc,
      @JsonKey(name: "type") final String? type,
      @JsonKey(name: "role_assessor") final dynamic roleAssessor,
      @JsonKey(name: "role_assessor_name") final String? roleAssessorName,
      @JsonKey(name: "role_participant") final dynamic roleParticipant,
      @JsonKey(name: "role_participant_name") final String? roleParticipantName,
      @JsonKey(name: "departement_id") final String? departementId,
      @JsonKey(name: "departement_name") final String? departementName,
      @JsonKey(name: "site_location_id") final String? siteLocationId,
      @JsonKey(name: "site_location_name") final String? siteLocationName,
      @JsonKey(name: "image") final String? image,
      @JsonKey(name: "participants") final List<ParticipantModel>? participants,
      @JsonKey(name: "assessors") final String? assessors,
      @JsonKey(name: "created_at") final String? createdAt,
      @JsonKey(name: "updated_at") final String? updatedAt,
      @JsonKey(name: "downloaded_at") final String? downloadedAt,
      @JsonKey(name: "has_responses")
      final bool? hasResponses}) = _$AssessmentModelImpl;

  factory _AssessmentModel.fromJson(Map<String, dynamic> json) =
      _$AssessmentModelImpl.fromJson;

  @override
  @JsonKey(name: "id")
  String? get id;
  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "assessement_date")
  String? get assessementDate;
  @override
  @JsonKey(name: "description")
  String? get desc;
  @override
  @JsonKey(name: "type")
  String? get type;
  @override
  @JsonKey(name: "role_assessor")
  dynamic get roleAssessor;
  @override
  @JsonKey(name: "role_assessor_name")
  String? get roleAssessorName;
  @override
  @JsonKey(name: "role_participant")
  dynamic get roleParticipant;
  @override
  @JsonKey(name: "role_participant_name")
  String? get roleParticipantName;
  @override
  @JsonKey(name: "departement_id")
  String? get departementId;
  @override
  @JsonKey(name: "departement_name")
  String? get departementName;
  @override
  @JsonKey(name: "site_location_id")
  String? get siteLocationId;
  @override
  @JsonKey(name: "site_location_name")
  String? get siteLocationName;
  @override
  @JsonKey(name: "image")
  String? get image;
  @override
  @JsonKey(name: "participants")
  List<ParticipantModel>? get participants;
  @override
  @JsonKey(name: "assessors")
  String? get assessors;
  @override
  @JsonKey(name: "created_at")
  String? get createdAt;
  @override
  @JsonKey(name: "updated_at")
  String? get updatedAt;
  @override
  @JsonKey(name: "downloaded_at")
  String? get downloadedAt;
  @override
  @JsonKey(name: "has_responses")
  bool? get hasResponses;
  @override
  @JsonKey(ignore: true)
  _$$AssessmentModelImplCopyWith<_$AssessmentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
