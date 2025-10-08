import 'package:json_annotation/json_annotation.dart';

part 'forgot_password_response_model.g.dart';

@JsonSerializable()
class ForgotPasswordResponseModel {
  final String message;

  ForgotPasswordResponseModel({required this.message});

  factory ForgotPasswordResponseModel.fromJson(dynamic json) {
    if (json is String) {
      return ForgotPasswordResponseModel(message: json);
    } else if (json is Map<String, dynamic>) {
      return _$ForgotPasswordResponseModelFromJson(json);
    } else {
      return ForgotPasswordResponseModel(message: "Something went wrong");
    }
  }

  Map<String, dynamic> toJson() => _$ForgotPasswordResponseModelToJson(this);
}
