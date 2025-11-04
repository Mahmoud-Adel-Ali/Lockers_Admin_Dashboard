import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/functions/pick_image.dart';
import '../../../../core/models/location_details_model.dart';
import '../../../../core/services/hive_services.dart';
import '../../../auth/data/models/admin_data.dart';
import '../../data/repo/profile_repo.dart';

class ProfileProvider extends ChangeNotifier {
  ProfileRepo repo = ProfileRepo();

  AdminData? adminData;

  void saveAdminData(AdminData admin) {
    HiveServices.saveAdminData(admin);
    // notifyListeners();
  }

  void getAdminData() {
    adminData = HiveServices.getAdminData();
    // fillLocationDetails(adminData!);
    fillAdminData();
    log(adminData.toString());
    notifyListeners();
  }

  void clearUserData() {
    HiveServices.clearAdminData();
    notifyListeners();
  }

  // Profile Controllers & form key
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();

  void fillAdminData() {
    nameController.text = adminData?.name ?? '';
    emailController.text = adminData?.email ?? '';
  }

  // Change Password
  bool? checkChangingPassword = false;
  String checkChangingPasswordMessage = '';

  Future<void> changePassword({
    required String currentPassword,
    required String password,
    required String passwordConfirmation,
  }) async {
    checkChangingPassword = null;
    notifyListeners();
    final response = await repo.changePassword(
      currentPassword: currentPassword,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
    response.fold(
      (msg) {
        checkChangingPasswordMessage = msg;
        checkChangingPassword = false;
      },
      (authModel) {
        checkChangingPassword = true;
        checkChangingPasswordMessage = authModel.message;
      },
    );
    notifyListeners();
  }

  // Update profile
  bool? checkUpdateProfile = false;
  String message = '';

  Future<void> updateProfile() async {
    checkUpdateProfile = null;
    message = '';
    notifyListeners();

    final result = await repo.updateProfile(
      image: imageFile,
      name: nameController.text,
      email: emailController.text,
    );
    result.fold(
      (msg) {
        message = msg;
        checkUpdateProfile = false;
      },
      (authModel) {
        message = authModel.message;
        checkUpdateProfile = true;
        imageFile = null;
        saveAdminData(authModel.data!);
        // fillLocationDetails(authModel.data!);
        getAdminData();
      },
    );
    notifyListeners();
  }

  //* Location Model
  // LocationDetailsModel? locationModel;

  // void fillLocationDetails(AdminData Admin) {
  //   locationModel = LocationDetailsModel(
  //     latitude: Admin.latitude,
  //     longitude: Admin.longitude,
  //     city: Admin.city,
  //     neighborhood: Admin.neighborhood,
  //     street: Admin.street,
  //     buildingNum: Admin.buildNumber,
  //     administrativeArea: Admin.additionAddress,
  //   );
  // }

  //* Edit Location Controllers
  var locationFormKey = GlobalKey<FormState>();
  var cityController = TextEditingController();
  var neighborhoodController = TextEditingController();
  var streetController = TextEditingController();
  var buildNumberController = TextEditingController();
  var additionAddressController = TextEditingController();

  void fillLocationControllers(LocationDetailsModel model) {
    // locationModel = model;
    log("Model : ${model.toString()}");
    // log("Fill Location data : ${locationModel.toString()}");

    cityController = TextEditingController(text: model.city);
    neighborhoodController = TextEditingController(text: model.neighborhood);
    streetController = TextEditingController(text: model.street);
    buildNumberController = TextEditingController(text: model.buildingNum);
    additionAddressController = TextEditingController(
      text: model.administrativeArea,
    );
    // notifyListeners();
  }

  //* Update Location
  // bool? checkUpdateLocation = false;
  // Future<void> updateLocation() async {
  //   var newLocationModel = LocationDetailsModel(
  //     latitude: locationModel!.latitude,
  //     longitude: locationModel!.longitude,
  //     city: cityController.text,
  //     neighborhood: neighborhoodController.text,
  //     street: streetController.text,
  //     buildingNum: buildNumberController.text,
  //     administrativeArea: additionAddressController.text,
  //   );
  //   locationModel = newLocationModel;

  //   checkUpdateLocation = null;
  //   notifyListeners();
  //   log("Before Update Location: ${locationModel.toString()}");
  //   final response = await repo.updateLocation(
  //     locationDetailsModel: newLocationModel,
  //   );
  //   response.fold(
  //     (msg) {
  //       message = msg;
  //       checkUpdateLocation = false;
  //     },
  //     (model) {
  //       message = model.message;
  //       checkUpdateLocation = true;
  //       saveAdminData(model.data!);
  //       getAdminData();
  //       log(
  //         "After Update Location [Admin Data after update location]: ${model.data!.toString()}",
  //       );
  //     },
  //   );
  //   notifyListeners();
  //   checkUpdateLocation = null;
  // }

  XFile? imageFile;
  void pickFromGallery() async {
    imageFile = await pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
      maxWidth: 1000,
      maxHeight: 1000,
    );
    notifyListeners();
  }

  void pickFromCamera() async {
    imageFile = await pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
      maxWidth: 1000,
      maxHeight: 1000,
    );
    notifyListeners();
  }

  void clearImage() {
    imageFile = null;
    notifyListeners();
  }
}
