import 'package:flutter/material.dart';

import '../../data/models/admin_data.dart';
import '../../data/repos/auth_repo.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepo repo = AuthRepo();

  // Signin
  bool? checSingin = false;
  String message = '';
  AdminData? companyData;
  Future<void> signin({required String phone, required String password}) async {
    // Loading Signin
    checSingin = null;
    message = '';
    notifyListeners();
    //
    final res = await repo.signin(phone: phone, password: password);
    res.fold(
      (msg) {
        checSingin = false;
        message = msg;
      },
      (model) {
        checSingin = true;
        message = model.message;
        companyData = model.data;
        // CompanyHiveServices.saveCompanyData(companyData!);
        // CompanyHiveServices.setCompanyLoggedIn();
      },
    );
    notifyListeners();
  }

  // Forget Password
  var formKey = GlobalKey<FormState>();
  var phoneController = TextEditingController();

  bool? checkForgetPassword = false;
  Future<void> forgetPassword() async {
    checkForgetPassword = null;
    message = '';
    notifyListeners();
    final res = await repo.forgetPassword(phone: phoneController.text);
    res.fold(
      (msg) {
        checkForgetPassword = false;
        message = msg;
      },
      (model) {
        checkForgetPassword = true;
        message = model.message;
      },
    );
    notifyListeners();
  }

  // Verify OTP
  var otpController = TextEditingController();

  bool? checkVerifyOTP = false;
  Future<void> verifyOTP() async {
    checkVerifyOTP = null;
    message = '';
    notifyListeners();
    final res = await repo.verifyOTP(
      phone: phoneController.text,
      otp: otpController.text,
    );
    res.fold(
      (msg) {
        checkVerifyOTP = false;
        message = msg;
      },
      (model) {
        checkVerifyOTP = true;
        message = model.message;
      },
    );
    notifyListeners();
  }

  // Reset Password
  var passwordController = TextEditingController();
  var passwordConfirmationController = TextEditingController();

  bool? checkResetPassword = false;
  Future<void> resetPassword() async {
    checkResetPassword = null;
    message = '';
    notifyListeners();
    final res = await repo.resetPassword(
      phone: phoneController.text,
      password: passwordController.text,
      passwordConfirmation: passwordConfirmationController.text,
    );
    res.fold(
      (msg) {
        checkResetPassword = false;
        message = msg;
      },
      (model) {
        checkResetPassword = true;
        message = model.message;
        clearControllers();
      },
    );
    notifyListeners();
  }

  void clearControllers() {
    phoneController.clear();
    otpController.clear();
    passwordController.clear();
    passwordConfirmationController.clear();
  }
}
