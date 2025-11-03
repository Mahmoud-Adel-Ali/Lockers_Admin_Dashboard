enum CustomerType { all, system, newCustomers, blocked }

extension CustomerTypeExtension on CustomerType {
  /// Arabic name
  String get arName {
    switch (this) {
      case CustomerType.all:
        return "جميع العملاء";
      case CustomerType.system:
        return "عملاء النظام";
      case CustomerType.newCustomers:
        return "العملاء الجدد";
      case CustomerType.blocked:
        return "العملاء المحظورين";
    }
  }

  /// English name
  String get enName {
    switch (this) {
      case CustomerType.all:
        return "All Customers";
      case CustomerType.system:
        return "System Customers";
      case CustomerType.newCustomers:
        return "New Customers";
      case CustomerType.blocked:
        return "Blocked Customers";
    }
  }
}
