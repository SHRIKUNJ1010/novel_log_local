import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:novel_log_local/utility/constants.dart';

class SecureStorage {
  static const storage = FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true));

  static Future<void> setMobilePin(String userPin) async {
    await storage.write(key: AppConstants.userPin, value: userPin);
  }

  static Future<String?> getMobilePin() async {
    String? userPin = await storage.read(key: AppConstants.userPin);
    return userPin;
  }

  static Future<void> setMasterPassword(String userMasterPassword) async {
    await storage.write(
        key: AppConstants.userMasterPassword, value: userMasterPassword);
  }

  static Future<String?> getMasterPassword() async {
    String? userMasterPassword =
        await storage.read(key: AppConstants.userMasterPassword);
    return userMasterPassword;
  }
}
