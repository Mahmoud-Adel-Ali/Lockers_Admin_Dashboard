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

List<DashboardModel> adminFeaturesList = [];
