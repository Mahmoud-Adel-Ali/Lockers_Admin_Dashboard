import '../../../../core/utils/assets.dart';
import '../enums/dashboard_type.dart';

class DashboardModel {
  final String title;
  final String subtitle;
  final DashboardType type;
  final List<DashboardType> relatedTypes;
  final String icon;

  DashboardModel({
    required this.title,
    required this.subtitle,
    required this.type,
    required this.icon,
    this.relatedTypes = const [],
  });
}

List<DashboardModel> adminFeaturesList = [
  //* Home
  DashboardModel(
    title: 'الرئيسية',
    subtitle: 'الصفحة الرئيسية :',
    type: DashboardType.Home,
    icon: Assets.imagesActiveHomeIcon,
    relatedTypes: [],
  ),
  //* Shipping Companies
  DashboardModel(
    title: 'شركات الشحن',
    subtitle: 'شركات الشحن :',
    type: DashboardType.ShippingCompanies,
    icon: Assets.imagesActiveCustomersIcon,
    relatedTypes: [],
  ),
  //* Units
  DashboardModel(
    title: 'الوحدات',
    subtitle: 'الوحدات :',
    type: DashboardType.Units,
    icon: Assets.imagesActiveUnitsIcon,
    relatedTypes: [],
  ),
  //* Follow-Up Reservations
  DashboardModel(
    title: 'متابعة الحجوزات',
    subtitle: 'متابعة الحجوزات :',
    type: DashboardType.FollowUpReservations,
    icon: Assets.imagesActiveFollowUpReservationIcon,
    relatedTypes: [DashboardType.FollowUpReservationsDetails],
  ),
  //* Agreements
  DashboardModel(
    title: 'الإتفاقات',
    subtitle: 'الإتفاقات :',
    type: DashboardType.Agreements,
    icon: Assets.imagesActiveAgreementsIcon,
    relatedTypes: [],
  ),
  //* Customers
  DashboardModel(
    title: 'العملاء',
    subtitle: 'العملاء :',
    type: DashboardType.Customers,
    icon: Assets.imagesActiveCustomersIcon,
    relatedTypes: [],
  ),
  //* Employees
  DashboardModel(
    title: 'الموظفين',
    subtitle: 'الموظفين :',
    type: DashboardType.Employees,
    icon: Assets.imagesActiveEmployeesIcon,
  ),
  //* Complaints
  DashboardModel(
    title: 'الشكاوي',
    subtitle: 'الشكاوي :',
    type: DashboardType.Complaints,
    icon: Assets.imagesActiveComplainsIcon,
    relatedTypes: [],
  ),
  //* Maintenance
  DashboardModel(
    title: 'الصيانة',
    subtitle: 'الصيانة :',
    type: DashboardType.Maintenance,
    icon: Assets.imagesActiveMaintenanceIcon,
    relatedTypes: [],
  ),
];
