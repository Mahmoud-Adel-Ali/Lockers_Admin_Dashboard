import 'package:flutter/material.dart';

import '../../data/models/complaint_model.dart';
import '../../data/repos/complaints_repo.dart';

class ComplaintsProvider extends ChangeNotifier {
  ComplaintsRepo repo = ComplaintsRepo();

  List<ComplaintModel> complaints = [];
  String message = '';
  //* Get All Complaints
  bool? checkGettingAllComplaints = false;

  Future<void> getAllComplaints() async {
    //* Loading Stage.
    checkGettingAllComplaints = null;
    message = '';
    notifyListeners();

    final result = await repo.getAllComplaints();
    result.fold(
      (msg) {
        message = msg;
        checkGettingAllComplaints = false;
      },
      (model) {
        message = model.message;
        checkGettingAllComplaints = true;
        complaints = model.data;
      },
    );
    notifyListeners();
  }
}
