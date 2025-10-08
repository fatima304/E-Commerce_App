import 'package:json_annotation/json_annotation.dart';

part 'address_request_model.g.dart';

@JsonSerializable()
class AddressRequestModel {
  final String state;
  final String city;
  final String street;
  final String apartment;
  final String phoneNumber;
  final String notes;

  AddressRequestModel({
    required this.state,
    required this.city,
    required this.street,
    required this.apartment,
    required this.phoneNumber,
    required this.notes,
  });

  Map<String, dynamic> toJson() => _$AddressRequestModelToJson(this);
}
