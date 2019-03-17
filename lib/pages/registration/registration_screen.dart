import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:jwelery_kart/config/application.dart';
import 'package:jwelery_kart/config/routes.dart';
import 'package:jwelery_kart/data/remote/jwelery_kart_api.dart';
import 'package:jwelery_kart/utils/dialog_utils.dart';
import 'package:jwelery_kart/data/local/sharedpreference_helper.dart';
import 'package:jwelery_kart/utils/snackbar_utils.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RegistrationScreenState();
  }
}

class RegistrationScreenState extends State<RegistrationScreen> {
  String phoneNo;
  String verificationCode;
  String verificationId;

  TextEditingController _numberController = new TextEditingController();
  TextEditingController _otpController = new TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _registerButtonEnabled = false;
  bool _otpButtonEnabled = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool showNumberPage = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Theme(
          data: Theme.of(context).copyWith(
            primaryColor: Colors.blueAccent,
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 48.0),
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
//                Image.asset(
//                  'assets/images/logo.png',
//                  height: 90.0,
//                ),
                new SizedBox(
                  height: 48.0,
                ),
                (!showNumberPage ? numberPage() : otpPage()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onRegisterButtonClick() async {
    DialogUtils.showProgressBar(context, "Requesting OTP...");

    this.phoneNo = '+91' + _numberController.text;

    final PhoneVerificationCompleted verificationCompleted =
        (FirebaseUser user) {
      saveAndNavigate(user);
    };

    final PhoneVerificationFailed verificationFailed =
        (AuthException authException) {
      print(
          'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');
      Navigator.pop(context);
    };

    final PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      this.verificationId = verificationId;
      Navigator.pop(context);
      setState(() {
        showNumberPage = true;
      });
    };

    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      this.verificationId = verificationId;
    };

    assert(phoneNo.length == 13);
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: const Duration(seconds: 0),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  Future<void> onOtpButtonClick() async {
    DialogUtils.showProgressBar(context, "Please Wait!");
    String otp = _otpController.text.trim();
    assert(otp.length == 6);
    assert(_otpController.text != null);
    assert(_numberController.text != null);

    final AuthCredential credential = PhoneAuthProvider.getCredential(
      verificationId: verificationId,
      smsCode: otp,
    );
    await _auth.signInWithCredential(credential).then((user) {
      saveAndNavigate(user);
    }).catchError((error) {
      if (error is PlatformException) {
        Navigator.pop(context);
        SnackbarUtils.show(_scaffoldKey, 'Invalid OTP please try again');
        setState(() {
          showNumberPage = false;
        });
      }
    });
  }

  Widget numberPage() {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 8.0,
        ),
        new TextField(
          controller: _numberController,
          onChanged: (text) {
            var _number = text;
            if (_number.trim().length == 10) {
              setState(() {
                _registerButtonEnabled = true;
              });
            } else {
              setState(() {
                _registerButtonEnabled = false;
              });
            }
          },
          keyboardType: TextInputType.phone,
          style: new TextStyle(color: Colors.black87, fontSize: 18.0),
          decoration: new InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: const EdgeInsets.all(2.0),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(
                  left: 4.0,
                  right: 4.0,
                ),
                child: new Icon(Icons.phone),
              ),
              suffixStyle: TextStyle(color: Colors.grey[500], fontSize: 16.0),
              counterText: "",
              hintText: "Enter your number"),
          obscureText: false,
          maxLength: 10,
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
          onPressed: _registerButtonEnabled ? onRegisterButtonClick : null,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  Icons.power_settings_new,
                  color: _registerButtonEnabled
                      ? Colors.white.withOpacity(0.9)
                      : Colors.grey[700],
                  size: 20.0,
                ),
                SizedBox(
                  width: 4.0,
                ),
                Text(
                  "Register",
                  style: new TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ),
        new SizedBox(
          height: 16.0,
        ),
      ],
    );
  }

  Widget otpPage() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
          ),
          child: new TextField(
            controller: _otpController,
            onChanged: (text) {
              var _otp = text;
              if (_otp.trim().length == 6) {
                setState(() {
                  _otpButtonEnabled = true;
                });
              } else {
                setState(() {
                  _otpButtonEnabled = false;
                });
              }
            },
            keyboardType: TextInputType.phone,
            style: new TextStyle(color: Colors.black87, fontSize: 18.0),
            decoration: new InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: const EdgeInsets.all(2.0),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(
                    left: 4.0,
                    right: 4.0,
                  ),
                  child: new Icon(Icons.phone),
                ),
                suffixStyle: TextStyle(color: Colors.grey[500], fontSize: 16.0),
                counterText: "",
                hintText: "Enter OTP"),
            obscureText: false,
            maxLength: 6,
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
          onPressed: _otpButtonEnabled ? onOtpButtonClick : null,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
            child: Text(
              "Submit",
              style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
            ),
          ),
        ),
        new SizedBox(
          height: 16.0,
        ),
      ],
    );
  }

  void saveAndNavigate(FirebaseUser user) async {
    Navigator.pop(context);
    await Future.delayed(
      Duration(milliseconds: 200),
    );
    SnackbarUtils.show(_scaffoldKey,
        user != null ? "Login Successful" : "Login Failed... Try Again");
    await Future.delayed(
      Duration(milliseconds: 700),
    );
    await apiHelper.fetchCustomer(user.phoneNumber).then((customer) {
      if (customer != null && user != null) {
        prefsHelper.isLogin = true;
        prefsHelper.userPhone = user.phoneNumber;
        Application.router.navigateTo(context, Routes.main);
      } else
        Application.router.navigateTo(context, Routes.userDetail);
    });
  }
}
