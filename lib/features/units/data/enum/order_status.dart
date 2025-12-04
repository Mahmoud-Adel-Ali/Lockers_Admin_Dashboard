//$table->enum('status', ['progress', 'reserved', 'pick_up', 'rejected', 'back_to_company'])->default('progress');

import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

enum OrderStatus {
  all, // for filter purpose
  waitingQrScan, // progress
  bookingActivated, // reserved
  lockerReleased, // pick_up
  lateClearance, // rejected
  backToCompany, // back_to_company
}

extension OrderStatusExtension on OrderStatus {
  String get arName {
    switch (this) {
      case OrderStatus.all:
        return "كل الحجوزات";
      case OrderStatus.waitingQrScan:
        return "في انتظار مسح الـ QR Code";
      case OrderStatus.bookingActivated:
        return "خزائن تم تفعيل الحجز لها";
      case OrderStatus.lockerReleased:
        return "خزائن تم تحريرها";
      case OrderStatus.lateClearance:
        return "خزائن متأخرة التفريغ";
      case OrderStatus.backToCompany:
        return "منتظر عودتها للشركة";
    }
  }

  String get enName {
    switch (this) {
      case OrderStatus.all:
        return "All Reservations";
      case OrderStatus.waitingQrScan:
        return "Waiting QR Scan";
      case OrderStatus.bookingActivated:
        return "Booking Activated";
      case OrderStatus.lockerReleased:
        return "Locker Released";
      case OrderStatus.lateClearance:
        return "Late Clearance";
      case OrderStatus.backToCompany:
        return "Back to Company";
    }
  }

  static OrderStatus fromApi(String value) {
    switch (value) {
      case "progress":
        return OrderStatus.waitingQrScan;
      case "reserved":
        return OrderStatus.bookingActivated;
      case "pick_up":
        return OrderStatus.lockerReleased;
      case "rejected":
        return OrderStatus.lateClearance;
      case "back_to_company":
        return OrderStatus.backToCompany;
      default:
        return OrderStatus.waitingQrScan;
    }
  }

  String get apiValue {
    switch (this) {
      case OrderStatus.all:
        return ""; // for returning all
      case OrderStatus.waitingQrScan:
        return "progress";
      case OrderStatus.bookingActivated:
        return "reserved";
      case OrderStatus.lockerReleased:
        return "pick_up";
      case OrderStatus.lateClearance:
        return "rejected";
      case OrderStatus.backToCompany:
        return "back_to_company";
    }
  }

  Color get color {
    switch (this) {
      case OrderStatus.all:
        return Colors.black; // not Show
      case OrderStatus.waitingQrScan:
        return AppColors.main; // Blue
      case OrderStatus.bookingActivated:
        return AppColors.green; // Green
      case OrderStatus.lockerReleased:
        return AppColors.black; // Amber
      case OrderStatus.lateClearance:
        return AppColors.red.shade900; // Red
      case OrderStatus.backToCompany:
        return AppColors.grey; // Purple
    }
  }
}
