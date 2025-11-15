class PermissionsModel {
  final bool manageUnits;
  final bool manageCustomers;
  final bool manageComplaints;
  final bool manageMaintenance;
  final bool followReservations;
  final bool manageShippingCompanies;

  PermissionsModel({
    required this.manageUnits,
    required this.manageCustomers,
    required this.manageComplaints,
    required this.manageMaintenance,
    required this.followReservations,
    required this.manageShippingCompanies,
  });

  factory PermissionsModel.fromJson(Map<String, dynamic> json) {
    return PermissionsModel(
      manageUnits: json['manageUnits'] ?? false,
      manageCustomers: json['manageCustomers'] ?? false,
      manageComplaints: json['manageComplaints'] ?? false,
      manageMaintenance: json['manageMaintenance'] ?? false,
      followReservations: json['followReservations'] ?? false,
      manageShippingCompanies: json['manageShippingCompanies'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'manageUnits': manageUnits,
      'manageCustomers': manageCustomers,
      'manageComplaints': manageComplaints,
      'manageMaintenance': manageMaintenance,
      'followReservations': followReservations,
      'manageShippingCompanies': manageShippingCompanies,
    };
  }
}
