import 'package:ecommerce_app/core/network/api_error_handler.dart';
import 'package:ecommerce_app/features/orders/data/models/address/address_request_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repo/cart_repo.dart';
import 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  final CartRepository _cartRepository;

  AddressCubit(this._cartRepository) : super(const AddressInitial());

  Future<void> fetchAddresses() async {
    emit(const AddressLoading());
    try {
      final addresses = await _cartRepository.getAddresses();
      emit(AddressLoaded(addresses));
    } catch (e) {
      final error = ApiErrorHandler.handle(e);
      emit(AddressError(error.message ?? "Unknown error"));
    }
  }

  Future<void> addAddress(AddressRequestModel request) async {
    emit(const AddressLoading());
    try {
      final newAddress = await _cartRepository.addAddress(request);
      emit(AddressAdded(newAddress));
    } catch (e) {
      final error = ApiErrorHandler.handle(e);
      emit(AddressError(error.message ?? "Unknown error"));
    }
  }

  Future<void> deleteAddress(String id) async {
    emit(const AddressLoading());
    try {
      await _cartRepository.deleteAddress(id);
      emit(AddressDeleted(id));
    } catch (e) {
      final error = ApiErrorHandler.handle(e);
      emit(AddressError(error.message ?? "Unknown error"));
    }
  }

  Future<void> updateAddress(String id, AddressRequestModel request) async {
    emit(const AddressLoading());
    try {
      final updated = await _cartRepository.updateAddress(id, request);
      emit(AddressUpdated(updated));
    } catch (e) {
      final error = ApiErrorHandler.handle(e);
      emit(AddressError(error.message ?? "Unknown error"));
    }
  }
}
