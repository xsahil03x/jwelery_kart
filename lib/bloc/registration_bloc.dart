//import 'package:jwelery_kart/logic/viewmodel/registration_viewmodel.dart';
//import 'package:rxdart/rxdart.dart';
//import 'dart:async';
//
//class RegistrationBlock extends Object {
//  final otpController = StreamController<RegistrationViewModel>();
//
////  final loginController = StreamController<RegistrationViewModel>();
////  final apiController = BehaviorSubject<FetchProcess>();
//  final otpResendController = StreamController<bool>();
//  final otpResultController = BehaviorSubject<bool>();
//
//  Sink<RegistrationViewModel> get otpSink => otpController.sink;
//
//  Sink<RegistrationViewModel> get RegistrationSink => otpController.sink;
//
//  Sink<bool> get resendOtpSink => otpResendController.sink;
//
//  Stream<bool> get otpResult => otpResultController.stream;
//
//  Stream<FetchProcess> get apiResult => apiController.stream;
//
//  LoginBloc() {
//    otpController.stream.listen(apiCall);
//    otpResendController.stream.listen(resendOtp);
//    loginController.stream.listen(apiCall);
//  }
//
//  void apiCall(UserLoginViewModel userLogin) async {
//    FetchProcess process = new FetchProcess(loading: true);
//    //for progress loading
//    apiController.add(process);
//    if (userLogin.otp == null) {
//      process.type = ApiType.performOTP;
//      await userLogin.getOtp(userLogin.phonenumber);
//      otpResultController.add(userLogin.otpResult);
//    } else {
//      process.type = ApiType.performLogin;
//      await userLogin.performLogin(userLogin);
//    }
//
//    process.loading = false;
//    process.response = userLogin.apiResult;
//    //for error dialog
//    apiController.add(process);
//    userLogin = null;
//  }
//
//  void resendOtp(bool flag) {
//    otpResultController.add(false);
//  }
//
//  void dispose() {
//    otpController.close();
//    otpResendController.close();
//    apiController.close();
//    otpResultController.close();
//    loginController.close();
//  }
//}
