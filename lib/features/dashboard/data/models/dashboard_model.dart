import '../../../../core/utils/assets.dart';
import '../enums/dashboard_type.dart';

class DashboardModel {
  final String title;
  final String subtitle;
  final DashboardType type;
  final List<DashboardType> relatedTypes;
  final String activeIcon;
  final String inactiveIcon;

  DashboardModel({
    required this.title,
    required this.subtitle,
    required this.type,
    required this.activeIcon,
    required this.inactiveIcon,
    this.relatedTypes = const [],
  });
}

List<DashboardModel> adminFeaturesList = [
  //*  Home
  DashboardModel(
    title: 'الرئيسية',
    subtitle: 'الصفحة الرئيسية :',
    type: DashboardType.Home,
    activeIcon: Assets.imagesActiveHomeIcon,
    inactiveIcon: Assets.imagesInactiveHomeIcon,
    relatedTypes: [],
  ),
  //* Shipping Companies
  DashboardModel(
    title: 'شركات الشحن',
    subtitle: 'شركات الشحن :',
    type: DashboardType.ShippingCompanies,
    activeIcon: Assets.imagesActiveCustomersIcon,
    inactiveIcon: Assets.imagesInactiveCustomersIcon,
    relatedTypes: [],
  ),
  //* Units
  DashboardModel(
    title: 'الوحدات',
    subtitle: 'الوحدات :',
    type: DashboardType.Units,
    activeIcon: Assets.imagesActiveUnitsIcon,
    inactiveIcon: Assets.imagesInactiveUnitsIcon,
    relatedTypes: [],
  ),
  //* Follow-Up Reservations
  DashboardModel(
    title: 'متابعة الحجوزات',
    subtitle: 'متابعة الحجوزات :',
    type: DashboardType.FollowUpReservations,
    activeIcon: Assets.imagesActiveFollowUpReservationIcon,
    inactiveIcon: Assets.imagesInactiveFollowUpReservationIcon,
    relatedTypes: [],
  ),
  //* Agreements
  DashboardModel(
    title: 'الإتفاقات',
    subtitle: 'الإتفاقات :',
    type: DashboardType.Agreements,
    activeIcon: Assets.imagesActiveAgreementsIcon,
    inactiveIcon: Assets.imagesInactiveAgreementsIcon,
    relatedTypes: [],
  ),
  //* Customers
  DashboardModel(
    title: 'العملاء',
    subtitle: 'العملاء :',
    type: DashboardType.Customers,
    activeIcon: Assets.imagesActiveCustomersIcon,
    inactiveIcon: Assets.imagesInactiveCustomersIcon,
    relatedTypes: [],
  ),
  //*  Employees
  DashboardModel(
    title: 'الموظفين',
    subtitle: 'الموظفين :',
    type: DashboardType.Employees,
    activeIcon: Assets.imagesActiveEmployeesIcon,
    inactiveIcon: Assets.imagesInactiveEmployeesIcon,
  ),
  //* Complaints
  DashboardModel(
    title: 'الشكاوي',
    subtitle: 'الشكاوي :',
    type: DashboardType.Complaints,
    activeIcon: Assets.imagesActiveComplainsIcon,
    inactiveIcon: Assets.imagesInactiveComplainsIcon,
    relatedTypes: [],
  ),
  //* Maintenance
  DashboardModel(
    title: 'الصيانة',
    subtitle: 'الصيانة :',
    type: DashboardType.Maintenance,

    activeIcon: Assets.imagesActiveMaintenanceIcon,
    inactiveIcon: Assets.imagesInactiveMaintenanceIcon,
    relatedTypes: [],
  ),
];
