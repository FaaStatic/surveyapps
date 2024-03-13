// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_question_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ItemQuestionModel _$ItemQuestionModelFromJson(Map<String, dynamic> json) {
  return _ItemQuestionModel.fromJson(json);
}

/// @nodoc
mixin _$ItemQuestionModel {
  @JsonKey(name: "questionid")
  String? get questionId => throw _privateConstructorUsedError;
  @JsonKey(name: "section")
  String? get section => throw _privateConstructorUsedError;
  @JsonKey(name: "number")
  String? get number => throw _privateConstructorUsedError;
  @JsonKey(name: "type")
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: "question_name")
  String? get questionName => throw _privateConstructorUsedError;
  @JsonKey(name: "scoring")
  bool? get scroring => throw _privateConstructorUsedError;
  @JsonKey(name: "options")
  List<ItemAnswerModel>? get options => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemQuestionModelCopyWith<ItemQuestionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemQuestionModelCopyWith<$Res> {
  factory $ItemQuestionModelCopyWith(
          ItemQuestionModel value, $Res Function(ItemQuestionModel) then) =
      _$ItemQuestionModelCopyWithImpl<$Res, ItemQuestionModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "questionid") String? questionId,
      @JsonKey(name: "section") String? section,
      @JsonKey(name: "number") String? number,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "question_name") String? questionName,
      @JsonKey(name: "scoring") bool? scroring,
      @JsonKey(name: "options") List<ItemAnswerModel>? options});
}

/// @nodoc
class _$ItemQuestionModelCopyWithImpl<$Res, $Val extends ItemQuestionModel>
    implements $ItemQuestionModelCopyWith<$Res> {
  _$ItemQuestionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = freezed,
    Object? section = freezed,
    Object? number = freezed,
    Object? type = freezed,
    Object? questionName = freezed,
    Object? scroring = freezed,
    Object? options = freezed,
  }) {
    return _then(_value.copyWith(
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String?,
      section: freezed == section
          ? _value.section
          : section // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      questionName: freezed == questionName
          ? _value.questionName
          : questionName // ignore: cast_nullable_to_non_nullable
              as String?,
      scroring: freezed == scroring
          ? _value.scroring
          : scroring // ignore: cast_nullable_to_non_nullable
              as bool?,
      options: freezed == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<ItemAnswerModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemQuestionModelImplCopyWith<$Res>
    implements $ItemQuestionModelCopyWith<$Res> {
  factory _$$ItemQuestionModelImplCopyWith(_$ItemQuestionModelImpl value,
          $Res Function(_$ItemQuestionModelImpl) then) =
      __$$ItemQuestionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "questionid") String? questionId,
      @JsonKey(name: "section") String? section,
      @JsonKey(name: "number") String? number,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "question_name") String? questionName,
      @JsonKey(name: "scoring") bool? scroring,
      @JsonKey(name: "options") List<ItemAnswerModel>? options});
}

/// @nodoc
class __$$ItemQuestionModelImplCopyWithImpl<$Res>
    extends _$ItemQuestionModelCopyWithImpl<$Res, _$ItemQuestionModelImpl>
    implements _$$ItemQuestionModelImplCopyWith<$Res> {
  __$$ItemQuestionModelImplCopyWithImpl(_$ItemQuestionModelImpl _value,
      $Res Function(_$ItemQuestionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = freezed,
    Object? section = freezed,
    Object? number = freezed,
    Object? type = freezed,
    Object? questionName = freezed,
    Object? scroring = freezed,
    Object? options = freezed,
  }) {
    return _then(_$ItemQuestionModelImpl(
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String?,
      section: freezed == section
          ? _value.section
          : section // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      questionName: freezed == questionName
          ? _value.questionName
          : questionName // ignore: cast_nullable_to_non_nullable
              as String?,
      scroring: freezed == scroring
          ? _value.scroring
          : scroring // ignore: cast_nullable_to_non_nullable
              as bool?,
      options: freezed == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<ItemAnswerModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemQuestionModelImpl implements _ItemQuestionModel {
  const _$ItemQuestionModelImpl(
      {@JsonKey(name: "questionid") this.questionId,
      @JsonKey(name: "section") this.section,
      @JsonKey(name: "number") this.number,
      @JsonKey(name: "type") this.type,
      @JsonKey(name: "question_name") this.questionName,
      @JsonKey(name: "scoring") this.scroring,
      @JsonKey(name: "options") final List<ItemAnswerModel>? options})
      : _options = options;

  factory _$ItemQuestionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemQuestionModelImplFromJson(json);

  @override
  @JsonKey(name: "questionid")
  final String? questionId;
  @override
  @JsonKey(name: "section")
  final String? section;
  @override
  @JsonKey(name: "number")
  final String? number;
  @override
  @JsonKey(name: "type")
  final String? type;
  @override
  @JsonKey(name: "question_name")
  final String? questionName;
  @override
  @JsonKey(name: "scoring")
  final bool? scroring;
  final List<ItemAnswerModel>? _options;
  @override
  @JsonKey(name: "options")
  List<ItemAnswerModel>? get options {
    final value = _options;
    if (value == null) return null;
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ItemQuestionModel(questionId: $questionId, section: $section, number: $number, type: $type, questionName: $questionName, scroring: $scroring, options: $options)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemQuestionModelImpl &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.section, section) || other.section == section) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.questionName, questionName) ||
                other.questionName == questionName) &&
            (identical(other.scroring, scroring) ||
                other.scroring == scroring) &&
            const DeepCollectionEquality().equals(other._options, _options));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      questionId,
      section,
      number,
      type,
      questionName,
      scroring,
      const DeepCollectionEquality().hash(_options));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemQuestionModelImplCopyWith<_$ItemQuestionModelImpl> get copyWith =>
      __$$ItemQuestionModelImplCopyWithImpl<_$ItemQuestionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemQuestionModelImplToJson(
      this,
    );
  }
}

abstract class _ItemQuestionModel implements ItemQuestionModel {
  const factory _ItemQuestionModel(
          {@JsonKey(name: "questionid") final String? questionId,
          @JsonKey(name: "section") final String? section,
          @JsonKey(name: "number") final String? number,
          @JsonKey(name: "type") final String? type,
          @JsonKey(name: "question_name") final String? questionName,
          @JsonKey(name: "scoring") final bool? scroring,
          @JsonKey(name: "options") final List<ItemAnswerModel>? options}) =
      _$ItemQuestionModelImpl;

  factory _ItemQuestionModel.fromJson(Map<String, dynamic> json) =
      _$ItemQuestionModelImpl.fromJson;

  @override
  @JsonKey(name: "questionid")
  String? get questionId;
  @override
  @JsonKey(name: "section")
  String? get section;
  @override
  @JsonKey(name: "number")
  String? get number;
  @override
  @JsonKey(name: "type")
  String? get type;
  @override
  @JsonKey(name: "question_name")
  String? get questionName;
  @override
  @JsonKey(name: "scoring")
  bool? get scroring;
  @override
  @JsonKey(name: "options")
  List<ItemAnswerModel>? get options;
  @override
  @JsonKey(ignore: true)
  _$$ItemQuestionModelImplCopyWith<_$ItemQuestionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
