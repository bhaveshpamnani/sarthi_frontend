import 'package:intl/intl.dart';

class SFormatter{
  static String formatDate(DateTime? date)  {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date);
  }
  static String formatCurrency(double amount){
    return NumberFormat.currency(locale: 'en_IN',symbol: '\\₹').format(amount);
  }
  static String formatPhoneNumber(String phoneNumber){
    // Removing any non-digit characters from the input
    String cleanedNumber = phoneNumber.replaceAll(RegExp(r'[^\\d]'), '');

    // Checking if the number is valid
    if (cleanedNumber.length != 10) {
      return "Invalid phone number";
    }

    // Formatting the number in Indian style
    String formattedNumber =
        "+91-${cleanedNumber.substring(0, 3)}-${cleanedNumber.substring(3, 6)}-${cleanedNumber.substring(6)}";

    return formattedNumber;
  }



}