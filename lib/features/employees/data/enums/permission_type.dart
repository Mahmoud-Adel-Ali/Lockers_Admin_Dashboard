enum PermissionType {
  all, // كل الموظفين
  manageShippingCompanies, // إدارة شركات الشحن
  manageUnits, // إدارة الوحدات
  followReservations, // إدارة الحجوزات
  manageCustomers, // إدارة العملاء
  manageComplaints, // إدارة ألشكاوي
  manageMaintenance, // إدارة قسم الصيانة
}

extension PermissionTypeExtension on PermissionType {
  /// Arabic name
  String get arName {
    switch (this) {
      case PermissionType.all:
        return 'كل الموظفين';
      case PermissionType.manageShippingCompanies:
        return 'إدارة شركات الشحن';
      case PermissionType.manageUnits:
        return 'إدارة الوحدات';
      case PermissionType.followReservations:
        return 'إدارة الحجوزات';
      case PermissionType.manageCustomers:
        return 'إدارة العملاء';
      case PermissionType.manageComplaints:
        return 'إدارة ألشكاوي';
      case PermissionType.manageMaintenance:
        return 'إدارة قسم الصيانة';
    }
  }

  /// English readable name
  String get enName {
    switch (this) {
      case PermissionType.all:
        return 'All Employees';
      case PermissionType.manageShippingCompanies:
        return 'Manage Shipping Companies';
      case PermissionType.manageUnits:
        return 'Manage Units';
      case PermissionType.followReservations:
        return 'Follow Reservations';
      case PermissionType.manageCustomers:
        return 'Manage Customers';
      case PermissionType.manageComplaints:
        return 'Manage Complaints';
      case PermissionType.manageMaintenance:
        return 'Manage Maintenance';
    }
  }

  /// Convert to field key used in backend permissions
  String get backendKey {
    switch (this) {
      case PermissionType.all:
        return 'all';
      case PermissionType.manageShippingCompanies:
        return 'manageShippingCompanies';
      case PermissionType.manageUnits:
        return 'manageUnits';
      case PermissionType.followReservations:
        return 'followReservations';
      case PermissionType.manageCustomers:
        return 'manageCustomers';
      case PermissionType.manageComplaints:
        return 'manageComplaints';
      case PermissionType.manageMaintenance:
        return 'manageMaintenance';
    }
  }
}
