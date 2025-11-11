// تعريف نمط التحقق من البريد الإلكتروني
String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
RegExp regexEmail = RegExp(pattern);

// تعريف نمط التحقق من كلمة المرور
RegExp regexPassword = RegExp(
  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
);

String? validatorOfEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'من فضلك أدخل البريد الإلكتروني';
  } else if (!regexEmail.hasMatch(value)) {
    return 'يرجى إدخال بريد إلكتروني صالح';
  }
  return null;
}

bool validatorOfEmailBool(String? value) {
  if (value == null || value.isEmpty) {
    return false;
  } else if (!regexEmail.hasMatch(value)) {
    return false;
  }
  return true;
}

String? validatorOfPassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'من فضلك أدخل كلمة المرور';
  } else if (value.length < 8) {
    return 'يجب أن تتكون كلمة المرور من 8 أحرف على الأقل';
  } else {
    // if (!regexPassword.hasMatch(value)) {
    //   return 'يجب أن تحتوي كلمة المرور على حرف كبير وصغير ورقم ورمز خاص';
    // } else {
    return null;
    // }
  }
}

bool validatorOfPasswordBool(String? value) {
  if (value == null || value.isEmpty) {
    return false;
  } else if (value.length < 8) {
    return false;
  } else {
    // if (!regexPassword.hasMatch(value)) {
    //   return false;
    // } else {
    return true;
    // }
  }
}

String? validatorOfUserName(String? value) {
  if (value == null || value.trim().length < 3) {
    return 'يجب أن يكون الاسم 3 أحرف على الأقل';
  }

  bool upper = value.contains(RegExp(r'[A-Z]'));
  bool lower = value.contains(RegExp(r'[a-z]'));
  final RegExp arabicNameRegExp = RegExp(r'^[\u0621-\u064A\s]+$');
  if ((upper && lower) || arabicNameRegExp.hasMatch(value)) {
    return null;
  } else {
    return 'يرجى إدخال اسم صحيح يحتوي على أحرف كبيرة وصغيرة';
  }
}

bool validatorOfUserNameBool(String? value) {
  if (value == null || value.trim().length < 3) {
    return false;
  }

  bool upper = value.contains(RegExp(r'[A-Z]'));
  bool lower = value.contains(RegExp(r'[a-z]'));
  final RegExp arabicNameRegExp = RegExp(r'^[\u0621-\u064A\s]+$');
  if ((upper && lower) || arabicNameRegExp.hasMatch(value)) {
    return true;
  } else {
    return false;
  }
}

final RegExp regexPhone = RegExp(r'^0(10|11|12|15)\d{8}$');
String? validatorOfEgyptianPhone(String? value) {
  if (value == null || value.isEmpty) {
    return 'من فضلك أدخل رقم الهاتف';
  } else if (!regexPhone.hasMatch(value)) {
    return 'يرجى إدخال رقم هاتف مصري صحيح';
  }
  return null;
}

bool validatorOfEgyptianPhoneBool(String? value) {
  if (value == null || value.isEmpty) return false;
  final isValid = regexPhone.hasMatch(value.trim());
  return isValid;
}

String? simpleValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'هذا الحقل مطلوب';
  }
  return null;
}

String? validatorOfPrice(String? value) {
  if (value == null || value.isEmpty) {
    return 'من فضلك أدخل السعر';
  } else if (double.tryParse(value) == null) {
    return 'يرجى إدخال رقم صالح';
  }
  return null;
}
