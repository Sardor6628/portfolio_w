import 'package:easy_localization/easy_localization.dart';
import 'package:website_p/main.dart';

class GlobalMethod{
  String formatDateDifference(DateTime startDate, DateTime endDate) {
    int years = endDate.year - startDate.year;
    int months = endDate.month - startDate.month;

    if (months < 0) {
      years -= 1;
      months += 12;
    }
    String year=years>1?"years".tr():"year".tr();
    String month=months>1?"months".tr():"month".tr();
    String yearStr = years > 0 ? "$years$year" : "";
    String monthStr = months > 0 ? "$months$month" : "";

    return [yearStr, monthStr].where((s) => s.isNotEmpty).join(" ");
  }
}