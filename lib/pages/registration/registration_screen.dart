import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  final String testSmsCode = '031998';
  final String testPhoneNumber = '+917987036365';

  TextEditingController _numberController = new TextEditingController();
  TextEditingController _otpController = new TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> _message = Future<String>.value('');
  TextEditingController _smsCodeController = TextEditingController();

  bool _registerButtonEnabled = false;
  bool _otpButtonEnabled = false;

  String _sessionId;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool showNumberPage = false;
  bool isLoading = false;

  Future<void> _testVerifyPhoneNumber() async {
    final PhoneVerificationCompleted verificationCompleted =
        (FirebaseUser user) {
      _message = Future<String>.value('signInWithPhoneNumber succeeded: $user');
      print(_message);
    };

    final PhoneVerificationFailed verificationFailed =
        (AuthException authException) {
      _message = Future<String>.value(
          'Phone numbber verification failed. Code: ${authException.code}. Message: ${authException.message}');
      print(_message);
    };

    final PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      this.verificationId = verificationId;
      _smsCodeController.text = testSmsCode;
    };

    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      this.verificationId = verificationId;
      _smsCodeController.text = testSmsCode;
    };

    await _auth.verifyPhoneNumber(
        phoneNumber: testPhoneNumber,
        timeout: const Duration(seconds: 0),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  Future<String> _testSignInWithPhoneNumber(String smsCode) async {
    final FirebaseUser user = await _auth.signInWithPhoneNumber(
      verificationId: verificationId,
      smsCode: smsCode,
    );

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    _smsCodeController.text = '';
    return 'signInWithPhoneNumber succeeded: $user';
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[100],
      body: Container(
        child: Center(
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

//  onRegisterButtonClick() async {
//    DialogUtils.showProgressBar(context, "Requesting OTP...");
//
//    var number = _numberController.text;
//    assert(number.length == 10);
//    var response = await apiHelper.getWithoutAuth(ApiEndpoint.sendOtp + number);
//    if (NetworkUtils.isReqSuccess(tag: "sendOtp", response: response)) {
//      Navigator.pop(context);
//
//      _sessionId = json.decode(response.body)['Details'];
//      assert(_sessionId != null && _sessionId.isNotEmpty);
//      setState(() {
//        showNumberPage = !showNumberPage;
//      });
//    } else {
//      Navigator.pop(context);
//      SnackbarUtils.show(
//          _scaffoldKey, "Something went wrong. Please try again");
////_scaffoldKey.currentState.showSnackBar(snackbar)
//    }
//  }

//  onOtpButtonClick() async {
//    DialogUtils.showProgressBar(context, "Please Wait!");
//    String otp = _otpController.text.trim();
//    assert(otp.length == 6);
//
//    Map<String, String> _map = new Map();
//// {
////   "device_name": "string",
////   "otp_input": "string",
////   "phone": "string",
////   "session_id": "string"
//// }
////TODO: remove this hardcode
//    assert(_sessionId != null);
//    assert(_otpController.text != null);
//    assert(_numberController.text != null);
//
//    _map.putIfAbsent("device_name", () => "Ayush_phone");
//    _map.putIfAbsent("otp_input", () => _otpController.text.trim());
//    _map.putIfAbsent("phone", () => _numberController.text.trim());
//    _map.putIfAbsent("session_id", () => _sessionId);
//
//    print(json.encode(_map));
//    http.Response response = await apiHelper.postWithoutAuth(
//        ApiEndpoint.verifyOtp, json.encode(_map));
//    if (NetworkUtils.isReqSuccess(
//      tag: "verifyOtp",
//      response: response,
//    )) {
//      print(response.headers);
//      String token = response.headers['authorization'];
//      assert(token != null && token.isNotEmpty);
//      prefsHelper.isLogin = true;
//      prefsHelper.token = token;
//      Navigator.pop(context);
//      await Future.delayed(
//        Duration(milliseconds: 200),
//      );
//
//      SnackbarUtils.show(_scaffoldKey, "Login Successful");
//      await Future.delayed(
//        Duration(milliseconds: 700),
//      );
//      Navigator.pushReplacement(
//          context, new MaterialPageRoute(builder: (context) => new AreaPage()));
//    } else {
//      Navigator.pop(context);
//
//      SnackbarUtils.show(_scaffoldKey, "Invalid OTP. Please try again");
////_scaffoldKey.currentState.showSnackBar(snackbar)
//    }
//  }

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
          onPressed: () {
            _testVerifyPhoneNumber();
          },
//          onPressed: _registerButtonEnabled ? onRegisterButtonClick : null,
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
          onPressed: () {},
//          onPressed: _otpButtonEnabled ? onOtpButtonClick : null,
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
}
