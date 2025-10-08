// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
  id: json['id'] as String,
  state: json['state'] as String,
  city: json['city'] as String,
  street: json['street'] as String,
  apartment: json['apartment'] as String,
  phoneNumber: json['phoneNumber'] as String,
  notes: json['notes'] as String,
);

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'state': instance.state,
      'city': instance.city,
      'street': instance.street,
      'apartment': instance.apartment,
      'phoneNumber': instance.phoneNumber,
      'notes': instance.notes,
    };
