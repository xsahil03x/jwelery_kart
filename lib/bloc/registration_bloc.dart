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

  void onSubmit() async {
    if (formKey.currentState.validate()) {
      final customer = Customer.fresh(
          customerName: nameController.text,
          customerContact: prefsHelper.userPhone,
          customerAddress: addressController.text,
          customerCity: cityController.text,
          customerPincode: zipController.text,
          customerEmail: emailController.text);

      var response = await apiHelper.registerCustomer(customer);
      if (response == 'Success')
        print("Yes");
      else
        print("NO");
    }
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
