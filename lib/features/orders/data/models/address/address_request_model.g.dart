// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressRequestModel _$AddressRequestModelFromJson(Map<String, dynamic> json) =>
    AddressRequestModel(
      state: json['state'] as String,
      city: json['city'] as String,
      street: json['street'] as String,
      apartment: json['apartment'] as String,
      phoneNumber: json['phoneNumber'] as String,
      notes: json['notes'] as String,
    );

Map<String, dynamic> _$AddressRequestModelToJson(
  AddressRequestModel instance,
) => <String, dynamic>{
  'state': instance.state,
  'city': instance.city,
  'street': instance.street,
  'apartment': instance.apartment,
  'phoneNumber': instance.phoneNumber,
  'notes': instance.notes,
};
