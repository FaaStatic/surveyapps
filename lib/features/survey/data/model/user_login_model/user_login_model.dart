import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_login_model.freezed.dart';
part 'user_login_model.g.dart';

@freezed
class UserLoginModel with _$UserLoginModel {
  factory UserLoginModel({
    @JsonKey(name: 'user_id') String? userId,
    String? nik,
    @JsonKey(name: 'system_role_id') int? systemRoleId,
    @JsonKey(name: 'system_role') String? systemRole,
    String? name,
    String? email,
    String? phone,
    @JsonKey(name: 'departement_id') String? departementId,
    String? departement,
    @JsonKey(name: 'site_location_id') String? siteLocationId,
    @JsonKey(name: 'site_location') String? siteLocation,
  }) = _UserLoginModel;

  factory UserLoginModel.fromJson(Map<String, dynamic> json) =>
      _$UserLoginModelFromJson(json);
}
