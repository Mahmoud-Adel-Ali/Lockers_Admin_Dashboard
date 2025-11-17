import 'package:flutter/material.dart';

import '../../data/enums/customer_type.dart';
import '../../data/models/customer_model.dart';
import '../../data/repos/customers_repo.dart';

class CustomersProvider extends ChangeNotifier {
  CustomersRepo repo = CustomersRepo();

  String message = '';

  //* All Customers Variables
  List<CustomerModel> customers = [];
  var searchController = TextEditingController();
  CustomerType type = CustomerType.all;
  int currentPage = 1;
  int lastPage = 1;

  //* Get All Customers
  bool? checkGetAllCustomers = false;
  Future<void> getAllCustomers() async {
    checkGetAllCustomers = null;
    notifyListeners();
    final result = await repo.getAllCustomers(
      search: searchController.text.trim(),
      page: currentPage,
      status: type,
    );
    result.fold(
      (l) {
        message = l;
        checkGetAllCustomers = false;
      },
      (model) {
        message = model.message;
        checkGetAllCustomers = true;
        customers = model.data.data;
        currentPage = model.data.currentPage;
        lastPage = model.data.lastPage;
      },
    );
    notifyListeners();
  }

  // On Change Customer Type
  void onChangeCustomerType(CustomerType type) {
    this.type = type;
    currentPage = 1;
    getAllCustomers();
  }

  // next page
  void nextPage() {
    if (currentPage == lastPage) return;
    currentPage += 1;
    getAllCustomers();
  }

  // previous page
  void previousPage() {
    if (currentPage == 1) return;
    currentPage -= 1;
    getAllCustomers();
  }
}
