import '../../../data/enums/dashboard_type.dart';

String companyDashboardSubtitle(DashboardType type) {
  switch (type) {
    case DashboardType.Home:
      return 'الصفحة الرئيسية :';
  }
}
