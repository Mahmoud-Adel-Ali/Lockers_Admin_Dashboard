// user => App Users : مستخدمي التطبيق
// company => Shipping Companies : شركات الشحن
// employee => Shipping Company Employees : موظفي شركات الشحن

enum ComplaintsType { all, user, company, employee }

extension ComplaintsTypeExtension on ComplaintsType {
  /// Arabic display name
  String get arName {
    switch (this) {
      case ComplaintsType.all:
        return 'كل الشكاوي';
      case ComplaintsType.user:
        return 'مستخدمي التطبيق';
      case ComplaintsType.company:
        return 'شركات الشحن';
      case ComplaintsType.employee:
        return 'موظفي شركات الشحن';
    }
  }

  /// English display name
  String get enName {
    switch (this) {
      case ComplaintsType.all:
        return 'All Complaints';
      case ComplaintsType.user:
        return 'App Users';
      case ComplaintsType.company:
        return 'Shipping Companies';
      case ComplaintsType.employee:
        return 'Shipping Company Employees';
    }
  }

  /// Parse from string (case-insensitive)
  static ComplaintsType parseFromString(String value) {
    switch (value.toLowerCase()) {
      case 'user':
        return ComplaintsType.user;
      case 'company':
        return ComplaintsType.company;
      case 'employee':
        return ComplaintsType.employee;
      default:
        return ComplaintsType.user;
    }
  }
}
