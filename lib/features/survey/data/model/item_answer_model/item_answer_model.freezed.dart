// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_answer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ItemAnswerModel _$ItemAnswerModelFromJson(Map<String, dynamic> json) {
  return _ItemAnswerModel.fromJson(json);
}

/// @nodoc
mixin _$ItemAnswerModel {
  String? get optionid => throw _privateConstructorUsedError;
  @JsonKey(name: 'option_name')
  String? get optionName => throw _privateConstructorUsedError;
  int? get points => throw _privateConstructorUsedError;
  int? get flag => throw _privateConstructorUsedError;
  @JsonKey(name: 'site_location_ids')
  dynamic get siteLocationIds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemAnswerModelCopyWith<ItemAnswerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemAnswerModelCopyWith<$Res> {
  factory $ItemAnswerModelCopyWith(
          ItemAnswerModel value, $Res Function(ItemAnswerModel) then) =
      _$ItemAnswerModelCopyWithImpl<$Res, ItemAnswerModel>;
  @useResult
  $Res call(
      {String? optionid,
      @JsonKey(name: 'option_name') String? optionName,
      int? points,
      int? flag,
      @JsonKey(name: 'site_location_ids') dynamic siteLocationIds});
}

/// @nodoc
class _$ItemAnswerModelCopyWithImpl<$Res, $Val extends ItemAnswerModel>
    implements $ItemAnswerModelCopyWith<$Res> {
  _$ItemAnswerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? optionid = freezed,
    Object? optionName = freezed,
    Object? points = freezed,
    Object? flag = freezed,
    Object? siteLocationIds = freezed,
  }) {
    return _then(_value.copyWith(
      optionid: freezed == optionid
          ? _value.optionid
          : optionid // ignore: cast_nullable_to_non_nullable
              as String?,
      optionName: freezed == optionName
          ? _value.optionName
          : optionName // ignore: cast_nullable_to_non_nullable
              as String?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      flag: freezed == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as int?,
      siteLocationIds: freezed == siteLocationIds
          ? _value.siteLocationIds
          : siteLocationIds // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemAnswerModelImplCopyWith<$Res>
    implements $ItemAnswerModelCopyWith<$Res> {
  factory _$$ItemAnswerModelImplCopyWith(_$ItemAnswerModelImpl value,
          $Res Function(_$ItemAnswerModelImpl) then) =
      __$$ItemAnswerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? optionid,
      @JsonKey(name: 'option_name') String? optionName,
      int? points,
      int? flag,
      @JsonKey(name: 'site_location_ids') dynamic siteLocationIds});
}

/// @nodoc
class __$$ItemAnswerModelImplCopyWithImpl<$Res>
    extends _$ItemAnswerModelCopyWithImpl<$Res, _$ItemAnswerModelImpl>
    implements _$$ItemAnswerModelImplCopyWith<$Res> {
  __$$ItemAnswerModelImplCopyWithImpl(
      _$ItemAnswerModelImpl _value, $Res Function(_$ItemAnswerModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? optionid = freezed,
    Object? optionName = freezed,
    Object? points = freezed,
    Object? flag = freezed,
    Object? siteLocationIds = freezed,
  }) {
    return _then(_$ItemAnswerModelImpl(
      optionid: freezed == optionid
          ? _value.optionid
          : optionid // ignore: cast_nullable_to_non_nullable
              as String?,
      optionName: freezed == optionName
          ? _value.optionName
          : optionName // ignore: cast_nullable_to_non_nullable
              as String?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      flag: freezed == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as int?,
      siteLocationIds: freezed == siteLocationIds
          ? _value.siteLocationIds
          : siteLocationIds // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemAnswerModelImpl implements _ItemAnswerModel {
  _$ItemAnswerModelImpl(
      {this.optionid,
      @JsonKey(name: 'option_name') this.optionName,
      this.points,
      this.flag,
      @JsonKey(name: 'site_location_ids') this.siteLocationIds});

  factory _$ItemAnswerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemAnswerModelImplFromJson(json);

  @override
  final String? optionid;
  @override
  @JsonKey(name: 'option_name')
  final String? optionName;
  @override
  final int? points;
  @override
  final int? flag;
  @override
  @JsonKey(name: 'site_location_ids')
  final dynamic siteLocationIds;

  @override
  String toString() {
    return 'ItemAnswerModel(optionid: $optionid, optionName: $optionName, points: $points, flag: $flag, siteLocationIds: $siteLocationIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemAnswerModelImpl &&
            (identical(other.optionid, optionid) ||
                other.optionid == optionid) &&
            (identical(other.optionName, optionName) ||
                other.optionName == optionName) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.flag, flag) || other.flag == flag) &&
            const DeepCollectionEquality()
                .equals(other.siteLocationIds, siteLocationIds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, optionid, optionName, points,
      flag, const DeepCollectionEquality().hash(siteLocationIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemAnswerModelImplCopyWith<_$ItemAnswerModelImpl> get copyWith =>
      __$$ItemAnswerModelImplCopyWithImpl<_$ItemAnswerModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemAnswerModelImplToJson(
      this,
    );
  }
}

abstract class _ItemAnswerModel implements ItemAnswerModel {
  factory _ItemAnswerModel(
          {final String? optionid,
          @JsonKey(name: 'option_name') final String? optionName,
          final int? points,
          final int? flag,
          @JsonKey(name: 'site_location_ids') final dynamic siteLocationIds}) =
      _$ItemAnswerModelImpl;

  factory _ItemAnswerModel.fromJson(Map<String, dynamic> json) =
      _$ItemAnswerModelImpl.fromJson;

  @override
  String? get optionid;
  @override
  @JsonKey(name: 'option_name')
  String? get optionName;
  @override
  int? get points;
  @override
  int? get flag;
  @override
  @JsonKey(name: 'site_location_ids')
  dynamic get siteLocationIds;
  @override
  @JsonKey(ignore: true)
  _$$ItemAnswerModelImplCopyWith<_$ItemAnswerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
