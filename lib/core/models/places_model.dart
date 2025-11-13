class CityModel {
  final String city;
  final List<String> neighborhoods;

  CityModel({required this.city, required this.neighborhoods});

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      city: json['city'] ?? '',
      neighborhoods:
          (json['neighborhoods'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {'city': city, 'neighborhoods': neighborhoods};
  }

  @override
  String toString() => 'CityModel(city: $city, neighborhoods: $neighborhoods)';
}

class PlacesDataModel {
  final List<CityModel> cities;

  PlacesDataModel({required this.cities});

  factory PlacesDataModel.fromJson(Map<String, dynamic> json) {
    return PlacesDataModel(
      cities:
          (json['cities'] as List<dynamic>?)
              ?.map((e) => CityModel.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {'cities': cities.map((e) => e.toJson()).toList()};
  }

  @override
  String toString() => 'PlacesDataModel(cities: $cities)';
}

class PlacesModel {
  final bool status;
  final String message;
  final PlacesDataModel? data;

  PlacesModel({required this.status, required this.message, this.data});

  factory PlacesModel.fromJson(Map<String, dynamic> json) {
    return PlacesModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null
          ? PlacesDataModel.fromJson(json['data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'status': status, 'message': message, 'data': data?.toJson()};
  }

  @override
  String toString() =>
      'PlacesModel(status: $status, message: $message, data: $data)';
}
