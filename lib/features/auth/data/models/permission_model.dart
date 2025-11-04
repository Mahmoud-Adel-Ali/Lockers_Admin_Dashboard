class PermissionModel {
  final bool manageUnits;
  final bool manageCustomers;
  final bool manageComplaints;
  final bool manageMaintenance;
  final bool followReservations;
  final bool manageShippingCompanies;

  PermissionModel({
    this.manageUnits = false,
    this.manageCustomers = false,
    this.manageComplaints = false,
    this.manageMaintenance = false,
    this.followReservations = false,
    this.manageShippingCompanies = false,
  });

  factory PermissionModel.fromJson(Map<String, dynamic> json) {
    return PermissionModel(
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
