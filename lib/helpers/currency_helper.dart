import 'package:intl/intl.dart';

class CurrencyHelper {
  static String convertToIdr(dynamic number) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return number != null ? currencyFormatter.format(number) : "Rp. -";
  }

  static String convertToCoin(dynamic number) {
    NumberFormat coinFormatter = NumberFormat.decimalPattern('vi_VN');
    return number != null ? coinFormatter.format(number) : "0";
  }
}
