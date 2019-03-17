import 'package:flutter/material.dart';
import 'package:jwelery_kart/bloc/base_bloc.dart';
import 'package:jwelery_kart/data/local/sharedpreference_helper.dart';
import 'package:jwelery_kart/data/models/customer.dart';
import 'package:jwelery_kart/data/remote/jwelery_kart_api.dart';

class RegistrationBloc extends BaseBloc {
  final String customerContact;
  final formKey = GlobalKey<FormState>();

  TextEditingController nameController;
  TextEditingController addressController;
  TextEditingController cityController;
  TextEditingController zipController;
  TextEditingController emailController;

  RegistrationBloc(this.customerContact) {
    nameController = new TextEditingController();
    addressController = new TextEditingController();
    cityController = new TextEditingController();
    zipController = new TextEditingController();
    emailController = new TextEditingController();
  }

  Future<String> onSubmit() async {
    if (formKey.currentState.validate()) {
      final customer = Customer.fresh(
          customerName: nameController.text,
          customerContact: prefsHelper.userPhone,
          customerAddress: addressController.text,
          customerCity: cityController.text,
          customerPincode: zipController.text,
          customerEmail: emailController.text);

      return await apiHelper.registerCustomer(customer);
    }
    return 'Invalid Form';
  }

  @override
  void dispose() {
    nameController?.dispose();
    addressController?.dispose();
    cityController?.dispose();
    zipController?.dispose();
    emailController?.dispose();
  }
}
