import 'package:flutter/material.dart';

import '../../data/enums/complaints_type.dart';
import '../../data/models/complaint_model.dart';
import '../../data/repos/complaints_repo.dart';

class ComplaintsProvider extends ChangeNotifier {
  ComplaintsRepo repo = ComplaintsRepo();

  List<ComplaintModel> complaints = [];
  List<ComplaintModel> filteredComplaints = [];
  ComplaintsType complaintsType = ComplaintsType.all;
  var searchController = TextEditingController();

  String message = '';
  //* Get All Complaints
  bool? checkGettingAllComplaints = false;

  Future<void> getAllComplaints() async {
    //* Loading Stage.
    checkGettingAllComplaints = null;
    message = '';
    notifyListeners();

    final result = await repo.getAllComplaints(search: searchController.text);
    result.fold(
      (msg) {
        message = msg;
        checkGettingAllComplaints = false;
      },
      (model) {
        message = model.message;
        checkGettingAllComplaints = true;
        complaints = model.data;
        onChangeComplaintsType(complaintsType);
      },
    );
    notifyListeners();
  }

  void onChangeComplaintsType(ComplaintsType newType) {
    complaintsType = newType;
    if (complaintsType == ComplaintsType.all) {
      filteredComplaints = complaints;
    } else {
      filteredComplaints = complaints
          .where((element) => element.type == complaintsType)
          .toList();
    }
    notifyListeners();
  }

  //* Reply to complaint
  bool? checkReplyingToComplaint = false;
  Future<void> replyToComplaint({
    required int id,
    required String reply,
  }) async {
    checkReplyingToComplaint = null;
    notifyListeners();

    final result = await repo.replyToComplaint(id: id, reply: reply);
    result.fold(
      (msg) {
        message = msg;
        checkReplyingToComplaint = false;
      },
      (model) {
        message = model.message;
        checkReplyingToComplaint = true;
        getAllComplaints();
      },
    );
    notifyListeners();
  }
}
