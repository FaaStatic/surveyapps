import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_choose_param.freezed.dart';
part 'item_choose_param.g.dart';

@freezed
class ItemChooseParam with _$ItemChooseParam {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  factory ItemChooseParam({
    @JsonKey(name: 'question_id') String? questionId,
    String? answer,
  }) = _ItemChooseParam;

  factory ItemChooseParam.fromJson(Map<String, dynamic> json) =>
      _$ItemChooseParamFromJson(json);
}
