// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'answer_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AnswerParam _$AnswerParamFromJson(Map<String, dynamic> json) {
  return _AnswerParam.fromJson(json);
}

/// @nodoc
mixin _$AnswerParam {
  @JsonKey(name: "assessment_id")
  String? get assessmentId => throw _privateConstructorUsedError;
  @JsonKey(name: "answers")
  List<ItemChooseParam>? get answers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnswerParamCopyWith<AnswerParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerParamCopyWith<$Res> {
  factory $AnswerParamCopyWith(
          AnswerParam value, $Res Function(AnswerParam) then) =
      _$AnswerParamCopyWithImpl<$Res, AnswerParam>;
  @useResult
  $Res call(
      {@JsonKey(name: "assessment_id") String? assessmentId,
      @JsonKey(name: "answers") List<ItemChooseParam>? answers});
}

/// @nodoc
class _$AnswerParamCopyWithImpl<$Res, $Val extends AnswerParam>
    implements $AnswerParamCopyWith<$Res> {
  _$AnswerParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assessmentId = freezed,
    Object? answers = freezed,
  }) {
    return _then(_value.copyWith(
      assessmentId: freezed == assessmentId
          ? _value.assessmentId
          : assessmentId // ignore: cast_nullable_to_non_nullable
              as String?,
      answers: freezed == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<ItemChooseParam>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnswerParamImplCopyWith<$Res>
    implements $AnswerParamCopyWith<$Res> {
  factory _$$AnswerParamImplCopyWith(
          _$AnswerParamImpl value, $Res Function(_$AnswerParamImpl) then) =
      __$$AnswerParamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "assessment_id") String? assessmentId,
      @JsonKey(name: "answers") List<ItemChooseParam>? answers});
}

/// @nodoc
class __$$AnswerParamImplCopyWithImpl<$Res>
    extends _$AnswerParamCopyWithImpl<$Res, _$AnswerParamImpl>
    implements _$$AnswerParamImplCopyWith<$Res> {
  __$$AnswerParamImplCopyWithImpl(
      _$AnswerParamImpl _value, $Res Function(_$AnswerParamImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assessmentId = freezed,
    Object? answers = freezed,
  }) {
    return _then(_$AnswerParamImpl(
      assessmentId: freezed == assessmentId
          ? _value.assessmentId
          : assessmentId // ignore: cast_nullable_to_non_nullable
              as String?,
      answers: freezed == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<ItemChooseParam>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$AnswerParamImpl implements _AnswerParam {
  const _$AnswerParamImpl(
      {@JsonKey(name: "assessment_id") this.assessmentId,
      @JsonKey(name: "answers") final List<ItemChooseParam>? answers})
      : _answers = answers;

  factory _$AnswerParamImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnswerParamImplFromJson(json);

  @override
  @JsonKey(name: "assessment_id")
  final String? assessmentId;
  final List<ItemChooseParam>? _answers;
  @override
  @JsonKey(name: "answers")
  List<ItemChooseParam>? get answers {
    final value = _answers;
    if (value == null) return null;
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AnswerParam(assessmentId: $assessmentId, answers: $answers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnswerParamImpl &&
            (identical(other.assessmentId, assessmentId) ||
                other.assessmentId == assessmentId) &&
            const DeepCollectionEquality().equals(other._answers, _answers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, assessmentId, const DeepCollectionEquality().hash(_answers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnswerParamImplCopyWith<_$AnswerParamImpl> get copyWith =>
      __$$AnswerParamImplCopyWithImpl<_$AnswerParamImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnswerParamImplToJson(
      this,
    );
  }
}

abstract class _AnswerParam implements AnswerParam {
  const factory _AnswerParam(
          {@JsonKey(name: "assessment_id") final String? assessmentId,
          @JsonKey(name: "answers") final List<ItemChooseParam>? answers}) =
      _$AnswerParamImpl;

  factory _AnswerParam.fromJson(Map<String, dynamic> json) =
      _$AnswerParamImpl.fromJson;

  @override
  @JsonKey(name: "assessment_id")
  String? get assessmentId;
  @override
  @JsonKey(name: "answers")
  List<ItemChooseParam>? get answers;
  @override
  @JsonKey(ignore: true)
  _$$AnswerParamImplCopyWith<_$AnswerParamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
