import 'package:flutter/material.dart';
import 'package:jwelery_kart/bloc/base_bloc.dart';

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

  void onSubmit() {
    if (formKey.currentState.validate()) {
      print(
          "name : ${nameController.text}\naddress : ${addressController.text}\ncity : ${cityController.text}\nzip : ${zipController.text}\nemail : ${emailController.text}");
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
