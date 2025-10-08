import 'package:ecommerce_app/features/orders/data/models/address/address_model.dart';
import 'package:meta/meta.dart';

@sealed
abstract class AddressState {
  const AddressState();
}

class AddressInitial extends AddressState {
  const AddressInitial();
}

class AddressLoading extends AddressState {
  const AddressLoading();
}

class AddressLoaded extends AddressState {
  final List<AddressModel> addresses;
  const AddressLoaded(this.addresses);
}

class AddressAdded extends AddressState {
  final AddressModel address;
  const AddressAdded(this.address);
}

class AddressUpdated extends AddressState {
  final AddressModel address;
  const AddressUpdated(this.address);
}

class AddressDeleted extends AddressState {
  final String id;
  const AddressDeleted(this.id);
}

class AddressError extends AddressState {
  final String error;
  const AddressError(this.error);
}
