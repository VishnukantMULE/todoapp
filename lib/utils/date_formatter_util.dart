import 'package:intl/intl.dart';

class DateFormatterUtil
{


  String currentDate()
  {
    DateTime current=DateTime.now();
    String currentDateFormate=DateFormat.yMMMMEEEEd().format(current).toString();
    return currentDateFormate;
  }
  String DateFormateyMMMd(DateTime date)
  {
    String resultDate=DateFormat.yMMMMd().format(date).toString();
    return resultDate;
  }
}