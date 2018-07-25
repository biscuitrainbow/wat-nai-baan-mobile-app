import 'dart:async';
import 'dart:convert';

import 'package:buddish_project/data/model/User.dart';
import 'package:buddish_project/data/parser/user_parser.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:test/test.dart';

void main() {
  group('UserParse', () {
    setUp(() async {
      Future.wait([initializeDateFormatting('th', null)]);
    });

    test('parse json', () {
      final jsonResponse = json.decode(userJson);
      User user = UserParser.parse(jsonResponse);

      expect(user.id, '1');
      expect(user.email, 'natthaponsricort@gmail.com');
      expect(user.name, 'Natthapon Sricort');
      expect(user.tel, '0920922721');

      final expectedDate = DateTime(1994, 7, 1);
      expect(user.dateOfBirth, expectedDate);
      expect(user.gender, 'female');
    });
  });
}

const String userJson = '''{
    "id": "1",
    "email": "natthaponsricort@gmail.com",
    "name": "Natthapon Sricort",
    "tel": "0920922721",
    "date_of_birth" : "1994-07-01",
    "gender" : "female"
}''';
