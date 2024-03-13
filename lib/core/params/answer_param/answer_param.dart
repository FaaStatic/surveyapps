import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:synapsissurvey/core/params/item_choose_param/item_choose_param.dart';

part 'answer_param.freezed.dart';
part 'answer_param.g.dart';

@freezed
class AnswerParam with _$AnswerParam {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory AnswerParam({
    @JsonKey(name: "assessment_id") String? assessmentId,
    @JsonKey(name: "answers") List<ItemChooseParam>? answers,
  }) = _AnswerParam;
  factory AnswerParam.fromJson(Map<String, dynamic> json) =>
      _$AnswerParamFromJson(json);
}
