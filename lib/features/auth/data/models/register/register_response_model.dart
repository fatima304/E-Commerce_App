import 'package:json_annotation/json_annotation.dart';

part 'register_response_model.g.dart';

@JsonSerializable()
class RegisterResponseModel {
  final int? statusCode;
  final String? message;
  final Map<String, List<String>>? errors;

  RegisterResponseModel({
    this.statusCode,
    this.message,
    this.errors,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseModelToJson(this);

  String? firstErrorMessage() {
    if (errors == null || errors!.isEmpty) return message;
    final firstList = errors!.values.first;
    return (firstList.isNotEmpty) ? firstList.first : message;
  }
}
