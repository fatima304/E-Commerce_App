// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordResponseModel _$ResetPasswordResponseModelFromJson(
  Map<String, dynamic> json,
) => ResetPasswordResponseModel(
  statusCode: (json['statusCode'] as num).toInt(),
  message: json['message'] as String,
  errors: json['errors'] as String?,
);

Map<String, dynamic> _$ResetPasswordResponseModelToJson(
  ResetPasswordResponseModel instance,
) => <String, dynamic>{
  'statusCode': instance.statusCode,
  'message': instance.message,
  'errors': instance.errors,
};
