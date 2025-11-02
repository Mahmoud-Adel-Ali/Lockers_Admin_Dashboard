import 'package:flutter/material.dart';

import '../../../../agreements/presentation/views/agreements_view.dart';
import '../../../../companies/presentation/views/companies_view.dart';
import '../../../../companies/presentation/views/company_details_view.dart';
import '../../../../companies/presentation/views/company_emplyees_view.dart';
import '../../../../employees/presentation/views/employees_view.dart';
import '../../../../follow_up_reservations/presentation/views/follow_up_reservations_details_view.dart';
import '../../../../follow_up_reservations/presentation/views/follow_up_reservations_view.dart';
import '../../../../maintenance/presentation/views/maintenance_view.dart';
import '../../../../units/presentation/views/unit_details_view.dart';
import '../../../../units/presentation/views/units_view.dart';
import '../../../data/enums/dashboard_type.dart';

Widget getCurrentCompanyDashboardView(DashboardType type) {
  switch (type) {
    case DashboardType.Home:
      return Center(child: Text('Home'));
    case DashboardType.ShippingCompanies:
      return CompaniesView();
    case DashboardType.Units:
      return const UnitsView();
    case DashboardType.FollowUpReservations:
      return const FollowUpReservationsView();
    case DashboardType.Agreements:
      return const AgreementsView();
    case DashboardType.Customers:
      return Center(child: Text('Customers'));
    case DashboardType.Employees:
      return const EmployeesView();
    case DashboardType.Complaints:
      return Center(child: Text('Complaints'));
    case DashboardType.Maintenance:
      return const MaintenanceView();
    //* Related to FollowUpReservations
    case DashboardType.FollowUpReservationsDetails:
      return const FollowUpReservationsDetailsView();
    //* Related to ShippingCompanies
    case DashboardType.CompanyDetails:
      return const CompanyDetailsView();
    case DashboardType.CompanyEmployees:
      return const CompanyEmplyeesView();
    //* Related to Units
    case DashboardType.UnitDetails:
      return const UnitDetailsView();
  }
}
