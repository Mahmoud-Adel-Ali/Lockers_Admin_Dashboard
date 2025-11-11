import 'package:flutter/material.dart';

import '../../../../companies/presentation/views/companies_view.dart';
import '../../../../companies/presentation/views/company_details_view.dart';
import '../../../../companies/presentation/views/company_emplyees_view.dart';
import '../../../../complaints/presentation/views/complaints_view.dart';
import '../../../../customers/presentation/views/customers_view.dart';
import '../../../../employees/presentation/views/employees_view.dart';
import '../../../../follow_up_reservations/presentation/views/follow_up_reservations_details_view.dart';
import '../../../../follow_up_reservations/presentation/views/follow_up_reservations_view.dart';
import '../../../../home/presentation/views/home_view.dart';
import '../../../../maintenance/presentation/views/maintenance_view.dart';
import '../../../../packages/presentation/views/packages_view.dart';
import '../../../../units/presentation/views/unit_details_view.dart';
import '../../../../units/presentation/views/units_view.dart';
import '../../../data/enums/dashboard_type.dart';

Widget getCurrentCompanyDashboardView(DashboardType type) {
  switch (type) {
    case DashboardType.Home:
      return const HomeView();
    case DashboardType.ShippingCompanies:
      return const CompaniesView();
    case DashboardType.Units:
      return const UnitsView();
    case DashboardType.FollowUpReservations:
      return const FollowUpReservationsView();
    case DashboardType.Packages:
      return const PackagesView();
    case DashboardType.Customers:
      return const CustomersView();
    case DashboardType.Employees:
      return const EmployeesView();
    case DashboardType.Complaints:
      return const ComplaintsView();
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
