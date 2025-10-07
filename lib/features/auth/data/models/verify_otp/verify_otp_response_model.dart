import 'package:json_annotation/json_annotation.dart';

part 'verify_otp_response_model.g.dart';

@JsonSerializable()
class VerifyOtpResponseModel {
  final int? statusCode;
  final String? message;
  final Map<String, List<String>>? errors;

  VerifyOtpResponseModel({
    this.statusCode,
    this.message,
    this.errors,
  });

  factory VerifyOtpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyOtpResponseModelToJson(this);

  String? firstErrorMessage() {
    if (errors == null || errors!.isEmpty) return message;
    final firstList = errors!.values.first;
    return (firstList.isNotEmpty) ? firstList.first : message;
  }
}
