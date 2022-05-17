
import 'dart:convert';

String dateFormatter(DateTime date) {
  dynamic dayData =
      '{ "1" : "Mon", "2" : "Tue", "3" : "Wed", "4" : "Thur", "5" : "Fri", "6" : "Sat", "7" : "Sun" }';

  dynamic monthData =
      '{ "1" : "Jan", "2" : "Feb", "3" : "Mar", "4" : "Apr", "5" : "May", "6" : "June", "7" : "Jul", "8" : "Aug", "9" : "Sep", "10" : "Oct", "11" : "Nov", "12" : "Dec" }';

  return json.decode(dayData)['${date.weekday}'] +
      ", " +
      date.day.toString() +
      " " +
      json.decode(monthData)['${date.month}'] +
      " " +
      date.year.toString();
}
