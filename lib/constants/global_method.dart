class GlobalMethod{
  String formatDateDifference(DateTime startDate, DateTime endDate) {
    int years = endDate.year - startDate.year;
    int months = endDate.month - startDate.month;

    if (months < 0) {
      years -= 1;
      months += 12;
    }

    String yearStr = years > 0 ? "$years year${years > 1 ? 's' : ''}" : "";
    String monthStr = months > 0 ? "$months month${months > 1 ? 's' : ''}" : "";

    return [yearStr, monthStr].where((s) => s.isNotEmpty).join(" ");
  }
}