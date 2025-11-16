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

// From API
CustomerType customerTypeFromString(String type) {
  switch (type) {
    case "all":
      return CustomerType.all;
    case "active":
      return CustomerType.system;
    case "pending":
      return CustomerType.newCustomers;
    case "blocked":
      return CustomerType.blocked;
    default:
      return CustomerType.system;
  }
}

// To API
String customerTypeToString(CustomerType type) {
  switch (type) {
    case CustomerType.all:
      return "all";
    case CustomerType.system:
      return "active";
    case CustomerType.newCustomers:
      return "pending";
    case CustomerType.blocked:
      return "blocked";
    
  }
}
