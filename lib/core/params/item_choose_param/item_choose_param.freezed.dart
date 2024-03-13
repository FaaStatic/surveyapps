// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_choose_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ItemChooseParam _$ItemChooseParamFromJson(Map<String, dynamic> json) {
  return _ItemChooseParam.fromJson(json);
}

/// @nodoc
mixin _$ItemChooseParam {
  @JsonKey(name: 'question_id')
  String? get questionId => throw _privateConstructorUsedError;
  String? get answer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemChooseParamCopyWith<ItemChooseParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemChooseParamCopyWith<$Res> {
  factory $ItemChooseParamCopyWith(
          ItemChooseParam value, $Res Function(ItemChooseParam) then) =
      _$ItemChooseParamCopyWithImpl<$Res, ItemChooseParam>;
  @useResult
  $Res call({@JsonKey(name: 'question_id') String? questionId, String? answer});
}

/// @nodoc
class _$ItemChooseParamCopyWithImpl<$Res, $Val extends ItemChooseParam>
    implements $ItemChooseParamCopyWith<$Res> {
  _$ItemChooseParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = freezed,
    Object? answer = freezed,
  }) {
    return _then(_value.copyWith(
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String?,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemChooseParamImplCopyWith<$Res>
    implements $ItemChooseParamCopyWith<$Res> {
  factory _$$ItemChooseParamImplCopyWith(_$ItemChooseParamImpl value,
          $Res Function(_$ItemChooseParamImpl) then) =
      __$$ItemChooseParamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'question_id') String? questionId, String? answer});
}

/// @nodoc
class __$$ItemChooseParamImplCopyWithImpl<$Res>
    extends _$ItemChooseParamCopyWithImpl<$Res, _$ItemChooseParamImpl>
    implements _$$ItemChooseParamImplCopyWith<$Res> {
  __$$ItemChooseParamImplCopyWithImpl(
      _$ItemChooseParamImpl _value, $Res Function(_$ItemChooseParamImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = freezed,
    Object? answer = freezed,
  }) {
    return _then(_$ItemChooseParamImpl(
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String?,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$ItemChooseParamImpl implements _ItemChooseParam {
  _$ItemChooseParamImpl(
      {@JsonKey(name: 'question_id') this.questionId, this.answer});

  factory _$ItemChooseParamImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemChooseParamImplFromJson(json);

  @override
  @JsonKey(name: 'question_id')
  final String? questionId;
  @override
  final String? answer;

  @override
  String toString() {
    return 'ItemChooseParam(questionId: $questionId, answer: $answer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemChooseParamImpl &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, questionId, answer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemChooseParamImplCopyWith<_$ItemChooseParamImpl> get copyWith =>
      __$$ItemChooseParamImplCopyWithImpl<_$ItemChooseParamImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemChooseParamImplToJson(
      this,
    );
  }
}

abstract class _ItemChooseParam implements ItemChooseParam {
  factory _ItemChooseParam(
      {@JsonKey(name: 'question_id') final String? questionId,
      final String? answer}) = _$ItemChooseParamImpl;

  factory _ItemChooseParam.fromJson(Map<String, dynamic> json) =
      _$ItemChooseParamImpl.fromJson;

  @override
  @JsonKey(name: 'question_id')
  String? get questionId;
  @override
  String? get answer;
  @override
  @JsonKey(ignore: true)
  _$$ItemChooseParamImplCopyWith<_$ItemChooseParamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
