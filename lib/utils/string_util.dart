import 'package:intl/intl.dart';

String toBearer(String token) {
  return 'Bearer $token';
}

bool isEmail(String em) {
  String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = new RegExp(p);
  return regExp.hasMatch(em);
}

String mysqlDateTimeFormat = 'yyyy-MM-dd hh:mm:ss';

String toMysqlDateTime(DateTime datetime) {
  DateFormat formatter = DateFormat(mysqlDateTimeFormat);
  return formatter.format(datetime);
}

DateTime fromMysqlDateTime(String datetime) {
  DateFormat formatter = DateFormat(mysqlDateTimeFormat);
  return formatter.parse(datetime);
}
