enum UnitCustomerType { all, appClients, shippingCompanies }

extension UnitCustomerTypeExtension on UnitCustomerType {
  /// Arabic name
  String get arName {
    switch (this) {
      case UnitCustomerType.all:
        return 'الكل';
      case UnitCustomerType.appClients:
        return 'عملاء التطبيق';
      case UnitCustomerType.shippingCompanies:
        return 'شركات الشحن';
    }
  }

  /// English name
  String get enName {
    switch (this) {
      case UnitCustomerType.all:
        return 'All';
      case UnitCustomerType.appClients:
        return 'App Clients';
      case UnitCustomerType.shippingCompanies:
        return 'Shipping Companies';
    }
  }

  /// for backend name
  String get name {
    switch (this) {
      case UnitCustomerType.all:
        return '';
      case UnitCustomerType.appClients:
        return 'customers';
      case UnitCustomerType.shippingCompanies:
        return 'companies';
    }
  }

  /// string → enum
  static UnitCustomerType fromString(String value) {
    switch (value) {
      case 'all':
        return UnitCustomerType.all;
      case 'appClients':
        return UnitCustomerType.appClients;
      case 'shippingCompanies':
        return UnitCustomerType.shippingCompanies;
      default:
        throw Exception('Invalid UnitCustomerType: $value');
    }
  }
}
