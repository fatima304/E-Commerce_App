import 'package:ecommerce_app/core/theme/app_color.dart';
import 'package:ecommerce_app/core/theme/app_text_style.dart';
import 'package:ecommerce_app/core/widgets/custom_back_button.dart';
import 'package:ecommerce_app/core/widgets/custom_textfield.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:ecommerce_app/features/orders/data/models/address/address_request_model.dart';
import 'package:ecommerce_app/features/orders/presentation/manager/address/address_cubit.dart';
import 'package:ecommerce_app/features/orders/presentation/manager/address/address_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _countryController = TextEditingController();
  final _cityController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _apartmentController = TextEditingController();
  bool _isPrimary = false;

  @override
  void dispose() {
    _nameController.dispose();
    _countryController.dispose();
    _cityController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _apartmentController.dispose();
    super.dispose();
  }

  void _saveAddress() {
    if (_formKey.currentState!.validate()) {
      final request = AddressRequestModel(
        state: _countryController.text.trim(),
        city: _cityController.text.trim(),
        street: _addressController.text.trim(),
        apartment: _apartmentController.text.trim(),
        phoneNumber: _phoneController.text.trim(),
        notes: _nameController.text.trim(),
      );

      context.read<AddressCubit>().addAddress(request);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const CustomBackButton(),
        title: Text(
          'Address',
          style: AppTextStyle.font17BlackSemiBold.copyWith(fontSize: 20),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _Label('Name'),
                    _FieldContainer(
                      child: CustomTextfield(
                        controller: _nameController,
                        hintText: 'Enter your name',
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _Label('Country'),
                              _FieldContainer(
                                child: CustomTextfield(
                                  controller: _countryController,
                                  hintText: 'Country',
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _Label('City'),
                              _FieldContainer(
                                child: CustomTextfield(
                                  controller: _cityController,
                                  hintText: 'City',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _Label('Phone Number'),
                    _FieldContainer(
                      child: CustomTextfield(
                        controller: _phoneController,
                        hintText: 'Phone number',
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _Label('Address'),
                              _FieldContainer(
                                child: CustomTextfield(
                                  controller: _addressController,
                                  hintText: 'Street address',
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _Label('Apartment'),
                              _FieldContainer(
                                child: CustomTextfield(
                                  controller: _apartmentController,
                                  hintText: 'Apt/Unit',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Save as primary address',
                          style: AppTextStyle.font15BlackMedium,
                        ),
                        Switch(
                          value: _isPrimary,
                          onChanged: (value) =>
                              setState(() => _isPrimary = value),
                          activeThumbColor: const Color(0xFF34C759),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
          BlocConsumer<AddressCubit, AddressState>(
            listener: (context, state) {
              if (state is AddressAdded) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Address saved successfully')),
                );
                Navigator.pop(context);
              } else if (state is AddressError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.error)));
              }
            },
            builder: (context, state) {
              final isLoading = state is AddressLoading;
              return MainButton(
                text: isLoading ? 'Saving...' : 'Save Address',
                onTap: isLoading ? null : _saveAddress,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _Label extends StatelessWidget {
  const _Label(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: AppTextStyle.font13DarkGreyRegular);
  }
}

class _FieldContainer extends StatelessWidget {
  const _FieldContainer({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
