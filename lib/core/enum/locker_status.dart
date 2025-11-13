enum LockerStatus {
  available, // متاح
  reserved, // محجوز
  booking, // جاري الحجز
}

LockerStatus parseLockerStatus(String? value) {
  switch (value?.toLowerCase()) {
    case 'available':
      return LockerStatus.available;
    case 'reserved':
      return LockerStatus.reserved;
    case 'progress':
      return LockerStatus.booking;
    default:
      return LockerStatus.available;
  }
}

extension LockerStatusExtension on LockerStatus {
  String get arName {
    switch (this) {
      case LockerStatus.available:
        return 'متاح';
      case LockerStatus.reserved:
        return 'محجوز حالياً';
      case LockerStatus.booking:
        return 'غير متاح مؤقتاً';
    }
  }

  String get enName {
    switch (this) {
      case LockerStatus.available:
        return 'Available';
      case LockerStatus.reserved:
        return 'Reserved';
      case LockerStatus.booking:
        return 'In Booking';
    }
  }
}
