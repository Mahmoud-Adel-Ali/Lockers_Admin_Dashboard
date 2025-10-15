import 'package:intl/intl.dart';

bool isArabic() {
  var arabic = Intl.getCurrentLocale();
  return arabic == 'ar';
}
