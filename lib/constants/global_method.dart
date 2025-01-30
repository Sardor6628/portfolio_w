import 'package:easy_localization/easy_localization.dart';

class GlobalMethod {
  String formatDateDifference(DateTime startDate, DateTime endDate) {
    int years = endDate.year - startDate.year;
    int months = endDate.month - startDate.month;

    // Adjust months if days are not complete
    if (endDate.day < startDate.day) {
      months -= 1;
    }

    // Handle negative months
    if (months < 0) {
      years -= 1;
      months += 12;
    }

    // Include start month
    if (months > 0 || years > 0) {
      months += 1; // Fix: Ensure the start month is counted
    }

    String yearLabel = years > 1 ? "years".tr() : "year".tr();
    String monthLabel = months > 1 ? "months".tr() : "month".tr();

    String yearStr = years > 0 ? "$years $yearLabel" : "";
    String monthStr = months > 0 ? "$months $monthLabel" : "";

    return [yearStr, monthStr].where((s) => s.isNotEmpty).join(" ");
  }
}