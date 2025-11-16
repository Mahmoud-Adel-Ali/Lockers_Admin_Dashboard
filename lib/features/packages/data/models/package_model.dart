class PackageModel {
  final int id;
  final String name;
  final int countLocker;
  final num price;
  final int duration;

  const PackageModel({
    required this.id,
    required this.name,
    required this.countLocker,
    required this.price,
    required this.duration,
  });

  factory PackageModel.fromJson(Map<String, dynamic> json) {
    return PackageModel(
      id: json['id'] as int,
      name: json['name'] as String,
      countLocker: json['countLocker'] as int,
      price: json['price'] as num,
      duration: json['duration'] as int,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'countLocker': countLocker,
    'price': price,
    'duration': duration,
  };
}
