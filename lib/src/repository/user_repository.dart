import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserRepository {
  final storage = new FlutterSecureStorage();

  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    await Future.delayed(Duration(seconds: 1));
    return 'token';
  }

  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    /// await Future.delayed(Duration(seconds: 1));
    await storage.delete(key: 'token');
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    /// Implement flutter_secure_storage
    /// await Future.delayed(Duration(seconds: 1));
    await storage.write(key: 'token', value: token);
    return;
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    /// await Future.delayed(Duration(seconds: 1));
    final token = await storage.read(key: 'token');
    return token != null;
  }
}
