import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_answer_model.freezed.dart';
part 'item_answer_model.g.dart';

@freezed
class ItemAnswerModel with _$ItemAnswerModel {
  factory ItemAnswerModel({
    String? optionid,
    @JsonKey(name: 'option_name') String? optionName,
    int? points,
    int? flag,
    @JsonKey(name: 'site_location_ids') dynamic siteLocationIds,
  }) = _ItemAnswerModel;

  factory ItemAnswerModel.fromJson(Map<String, dynamic> json) =>
      _$ItemAnswerModelFromJson(json);
}
