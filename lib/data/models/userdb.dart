import 'package:hive/hive.dart';

part 'userdb.g.dart';

@HiveType(typeId: 0)
class UserDB {
  UserDB({
    required this.email,
    required this.password,
  });

  @HiveField(0)
  final String email;
  @HiveField(1)
  final String password;
}
