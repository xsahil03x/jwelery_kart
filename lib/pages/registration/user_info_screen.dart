import 'package:flutter/material.dart';
import 'package:jwelery_kart/bloc/base_provider.dart';
import 'package:jwelery_kart/bloc/registration_bloc.dart';
import 'package:jwelery_kart/config/application.dart';
import 'package:jwelery_kart/config/routes.dart';
import 'package:jwelery_kart/data/local/sharedpreference_helper.dart';
import 'package:jwelery_kart/utils/dialog_utils.dart';
import 'package:jwelery_kart/utils/snackbar_utils.dart';

class UserInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegistrationBloc>(
      builder: (_, bloc) => bloc ?? RegistrationBloc(prefsHelper.userPhone),
      onDispose: (_, bloc) => bloc.dispose(),
      child: UserDetailForm(),
    );
  }
}

class UserDetailForm extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final registrationBloc = Provider.of<RegistrationBloc>(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Enter Details"),
      ),
      body: Form(
        key: registrationBloc.formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Theme(
                data: Theme.of(context).copyWith(
                  primaryColor: Colors.blueAccent,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new SizedBox(
                      height: 48.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: registrationBloc.nameController,
                        decoration: InputDecoration(
                          icon: Icon(Icons.account_box),
                          hintText: "Name",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 16.0),
                        ),
                        validator: (text) {
                          if (text.trim().length == 0)
                            return "Please provide a valid name.";
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: registrationBloc.addressController,
                        decoration: InputDecoration(
                          icon: Icon(Icons.my_location),
                          hintText: "Address",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 16.0),
                        ),
                        validator: (text) {
                          if (text.trim().length == 0)
                            return "Please provide a valid address.";
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: registrationBloc.cityController,
                        decoration: InputDecoration(
                          icon: Icon(Icons.location_city),
                          hintText: "City",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 16.0),
                        ),
                        validator: (text) {
                          if (text.trim().length == 0)
                            return "Please provide a valid city.";
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: registrationBloc.zipController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          icon: Icon(Icons.local_post_office),
                          hintText: "Zip",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 16.0),
                        ),
                        validator: (text) {
                          if (text.trim().length == 0)
                            return "Please provide a valid zip code.";
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: registrationBloc.emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          icon: Icon(Icons.alternate_email),
                          hintText: "Email",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 16.0),
                        ),
                        validator: (text) {
                          if (text.trim().length == 0 ||
                              !isValidEmail(text.trim()))
                            return "Please provide a valid email address.";
                        },
                      ),
                    ),
                    new SizedBox(
                      height: 24.0,
                    ),
                    new RaisedButton(
                      elevation: 2.0,
                      disabledTextColor: Colors.grey[700],
                      disabledColor: Colors.grey[300],
                      color: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      textColor: Colors.white.withOpacity(0.9),
                      onPressed: () async {
                        DialogUtils.showProgressBar(
                            context, "Registering User...");
                        var response = await registrationBloc.onSubmit();
                        if (response == 'Success') {
                          Navigator.pop(context);
                          await Future.delayed(
                            Duration(milliseconds: 200),
                          );
                          SnackbarUtils.show(
                              _scaffoldKey, 'Successfully Registered');
                          await Future.delayed(
                            Duration(milliseconds: 700),
                          );
                          prefsHelper.isLogin = true;

                          Application.router.navigateTo(context, Routes.main);
                        } else if (response == 'Fail') {
                          Navigator.pop(context);
                          SnackbarUtils.show(
                              _scaffoldKey, 'Something went wrong...');
                        } else {
                          Navigator.pop(context);
                          SnackbarUtils.show(_scaffoldKey, 'Invalid Data...');
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 4.0),
                        child: Text(
                          "Save Details",
                          style: new TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    new SizedBox(
                      height: 16.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

bool isValidEmail(String input) {
  final RegExp regex = new RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  return regex.hasMatch(input);
}
