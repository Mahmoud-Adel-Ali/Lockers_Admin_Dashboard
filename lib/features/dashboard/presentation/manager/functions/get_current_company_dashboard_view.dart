import 'package:flutter/material.dart';

import '../../../data/enums/dashboard_type.dart';

Widget getCurrentCompanyDashboardView(DashboardType type) {
  switch (type) {
    case DashboardType.Home:
      return Center(child: Text('Home'));
    case DashboardType.ShippingCompanies:
      return Center(child: Text('ShippingCompanies'));
    case DashboardType.Units:
      return Center(child: Text('Units'));
    case DashboardType.FollowUpReservations:
      return Center(child: Text('FollowUpReservations'));
    case DashboardType.Agreements:
      return Center(child: Text('Agreements'));
    case DashboardType.Customers:
      return Center(child: Text('Customers'));
    case DashboardType.Complaints:
      return Center(child: Text('Complaints'));
  }
}
