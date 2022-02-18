import 'package:intl/intl.dart';
import './ai_global_const.dart';

String currencyFormat(double aCurrencyValue) => NumberFormat(kFullCurrencyFormat).format(aCurrencyValue);
String decimalFormat(int aDecimalValue) => NumberFormat(kDecimalFormat).format(aDecimalValue);
