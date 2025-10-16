import '../../../data/enums/dashboard_type.dart';

String companyDashboardSubtitle(DashboardType type) {
  switch (type) {
    case DashboardType.Home:
      return 'الصفحة الرئيسية :';
    case DashboardType.ShippingCompanies:
      return 'شركات الشحن :';
    case DashboardType.Units:
      return 'الوحدات :';
    case DashboardType.FollowUpReservations:
      return 'متابعة الحجوزات :';
    case DashboardType.Agreements:
      return 'الإتفاقات :';
    case DashboardType.Customers:
      return 'العملاء :';
    case DashboardType.Complaints:
      return 'الشكاوي :';
  }
}
