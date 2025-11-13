// S , M , L

enum LockerSize { small, medium, large }

LockerSize parseLockerSize(String? value) {
  switch (value?.toLowerCase()) {
    case 'small':
      return LockerSize.small;
    case 'medium':
      return LockerSize.medium;
    case 'large':
      return LockerSize.large;
    default:
      return LockerSize.small;
  }
}

// extension

extension LockerSizeExtension on LockerSize {
  String get arName {
    switch (this) {
      case LockerSize.small:
        return 'صغيره';
      case LockerSize.medium:
        return 'متوسطه';
      case LockerSize.large:
        return 'كبيره';
    }
  }

  // en name
  String get enName {
    switch (this) {
      case LockerSize.small:
        return 'Small';
      case LockerSize.medium:
        return 'Medium';
      case LockerSize.large:
        return 'Large';
    }
  }
}
