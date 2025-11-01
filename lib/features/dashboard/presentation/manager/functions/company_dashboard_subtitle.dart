import '../../../data/enums/dashboard_type.dart';

String companyDashboardSubtitle(DashboardType type) {
  //   var subtitle = adminFeaturesList
  //       .where((item) => item.type == type)
  //       .first
  //       .subtitle;

  //   return subtitle;
  // }

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
    case DashboardType.Employees:
      return 'الموظفين :';
    case DashboardType.Maintenance:
      return 'الصيانة :';
    // Rlate to FollowUpReservations
    case DashboardType.FollowUpReservationsDetails:
      return 'متابعة الحجوزات  >  حجوزات العملاء';
    // Related to ShippingCompanies
    case DashboardType.CompanyDetails:
      return 'شركات الشحن  >  تفاصيل الشركة';
    case DashboardType.CompanyEmployees:
      return 'شركات الشحن  >  تفاصيل الشركة > الموظفين';
  }
}
