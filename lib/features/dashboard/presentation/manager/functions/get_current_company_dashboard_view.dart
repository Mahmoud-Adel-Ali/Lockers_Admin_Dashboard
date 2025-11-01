import 'package:flutter/material.dart';

import '../../../../companies/presentation/views/companies_view.dart';
import '../../../../follow_up_reservations/presentation/views/follow_up_reservations_details_view.dart';
import '../../../../follow_up_reservations/presentation/views/follow_up_reservations_view.dart';
import '../../../data/enums/dashboard_type.dart';

Widget getCurrentCompanyDashboardView(DashboardType type) {
  switch (type) {
    case DashboardType.Home:
      return Center(child: Text('Home'));
    case DashboardType.ShippingCompanies:
      return CompaniesView();
    case DashboardType.Units:
      return Center(child: Text('Units'));
    case DashboardType.FollowUpReservations:
      return FollowUpReservationsView();
    case DashboardType.Agreements:
      return Center(child: Text('Agreements'));
    case DashboardType.Customers:
      return Center(child: Text('Customers'));
    case DashboardType.Employees:
      return Center(child: Text('Employees'));
    case DashboardType.Complaints:
      return Center(child: Text('Complaints'));
    case DashboardType.Maintenance:
      return Center(child: Text('Maintenance'));
    // Rlate to FollowUpReservations
    case DashboardType.FollowUpReservationsDetails:
      return FollowUpReservationsDetailsView();
  }
}
