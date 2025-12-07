import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/assets.dart';
import '../../presentation/manager/dashboard_manager.dart';
import '../enums/dashboard_type.dart';

class DashboardModel {
  final String title;
  final String subtitle;
  final DashboardType type;
  final List<DashboardType> relatedTypes;
  final String icon;
  final bool canShow;

  DashboardModel({
    required this.title,
    required this.subtitle,
    required this.type,
    required this.icon,
    required this.canShow,
    this.relatedTypes = const [],
  });
}

List<DashboardModel> adminFeaturesList(BuildContext context) {
  var prov = context.read<DashboardManager>();
  return [
    //* Home
    DashboardModel(
      title: 'الرئيسية',
      subtitle: 'الصفحة الرئيسية :',
      canShow: prov.isAdmin,
      type: DashboardType.Home,
      icon: Assets.imagesActiveHomeIcon,
      relatedTypes: [],
    ),
    //* Shipping Companies
    DashboardModel(
      title: 'شركات الشحن',
      subtitle: 'شركات الشحن :',
      canShow: prov.isAdmin || prov.manageShippingCompanies,
      type: DashboardType.ShippingCompanies,
      icon: Assets.imagesActiveCustomersIcon,
      relatedTypes: [
        DashboardType.CompanyDetails,
        DashboardType.CompanyEmployees,
      ],
    ),
    //* Units
    DashboardModel(
      title: 'الوحدات',
      subtitle: 'الوحدات :',
      canShow: prov.isAdmin || prov.manageUnits,
      type: DashboardType.Units,
      icon: Assets.imagesActiveUnitsIcon,
      relatedTypes: [DashboardType.UnitDetails],
    ),
    //* Follow-Up Reservations
    DashboardModel(
      title: 'متابعة الحجوزات',
      subtitle: 'متابعة الحجوزات :',
      canShow: prov.isAdmin || prov.followReservations,
      type: DashboardType.FollowUpReservations,
      icon: Assets.imagesActiveFollowUpReservationIcon,
      relatedTypes: [
        DashboardType.FollowUpReservationsDetails,
        DashboardType.ReservationDetails,
      ],
    ),
    //* Packages
    DashboardModel(
      title: 'الباقات',
      subtitle: 'الباقات :',
      canShow: prov.isAdmin,
      type: DashboardType.Packages,
      icon: Assets.imagesActivePackagesIcon,
      relatedTypes: [],
    ),
    //* Customers
    DashboardModel(
      title: 'العملاء',
      subtitle: 'العملاء :',
      canShow: prov.isAdmin || prov.manageCustomers,
      type: DashboardType.Customers,
      icon: Assets.imagesActiveCustomersIcon,
      relatedTypes: [],
    ),
    //* Employees
    DashboardModel(
      title: 'الموظفين',
      subtitle: 'الموظفين :',
      canShow: prov.isAdmin,
      type: DashboardType.Employees,
      icon: Assets.imagesActiveEmployeesIcon,
    ),
    //* Complaints
    DashboardModel(
      title: 'الشكاوي',
      subtitle: 'الشكاوي :',
      canShow: prov.isAdmin || prov.manageComplaints,
      type: DashboardType.Complaints,
      icon: Assets.imagesActiveComplainsIcon,
      relatedTypes: [],
    ),
    //* Maintenance
    DashboardModel(
      title: 'الصيانة',
      subtitle: 'الصيانة :',
      canShow: prov.isAdmin || prov.manageMaintenance,
      type: DashboardType.Maintenance,
      icon: Assets.imagesActiveMaintenanceIcon,
      relatedTypes: [],
    ),
  ];
}
