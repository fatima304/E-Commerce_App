import 'package:json_annotation/json_annotation.dart';
import 'address_model.dart';

part 'address_response_model.g.dart';

@JsonSerializable()
class AddressResponseModel {
  final List<AddressModel> addresses;

  AddressResponseModel({required this.addresses});

  factory AddressResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AddressResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressResponseModelToJson(this);
}
