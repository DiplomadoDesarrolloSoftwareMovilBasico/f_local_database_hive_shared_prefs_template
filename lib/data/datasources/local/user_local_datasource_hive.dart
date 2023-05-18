import 'dart:async';
import 'package:hive/hive.dart';
import 'package:loggy/loggy.dart';

import '../../../domain/entities/user.dart';
import '../../models/userdb.dart';

class UserLocalDataSource {
  Future<void> addUser(User user) async {
    logInfo("Adding user to db");
    Hive.box('users').add(UserDB(email: user.email, password: user.password));
  }

  Future<List<User>> getAllUsers() async {
    return Hive.box('users')
        .values
        .map((e) => User(email: e.email, password: e.password))
        .toList();
  }

  Future<void> deleteAll() async {
    await Hive.box('users').clear();
  }
}
