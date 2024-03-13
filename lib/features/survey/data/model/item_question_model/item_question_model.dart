import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:synapsissurvey/features/survey/data/model/item_answer_model/item_answer_model.dart';

part 'item_question_model.freezed.dart';
part 'item_question_model.g.dart';

@freezed
class ItemQuestionModel with _$ItemQuestionModel {
  const factory ItemQuestionModel({
    @JsonKey(name: "questionid") String? questionId,
    @JsonKey(name: "section") String? section,
    @JsonKey(name: "number") String? number,
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "question_name") String? questionName,
    @JsonKey(name: "scoring") bool? scroring,
    @JsonKey(name: "options") List<ItemAnswerModel>? options,
  }) = _ItemQuestionModel;

  factory ItemQuestionModel.fromJson(Map<String, dynamic> json) =>
      _$ItemQuestionModelFromJson(json);
}
