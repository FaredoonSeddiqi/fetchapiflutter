import 'package:api/models/usernames.dart';

class properties {
  final String gender;
  final String phone;
  final String email;
  final names name;

  properties({
    required this.gender,
    required this.phone,
    required this.email,
    required this.name,
  });
  String get fullname {
    return '${name.title} ${name.first}${name.last}';
  }
}
