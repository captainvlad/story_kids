import 'package:encrypt/encrypt.dart';

class EncryptionManager {
// MARK: SECURE INFORMATION: cipherKey
  static const String _keyString = "****************";
  static final Key _key = Key.fromUtf8(_keyString);

  static encrypt(String data) {
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(_key));
    return encrypter.encrypt(data, iv: iv).base64;
  }

  static decrypt(String data) {
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(_key));
    return encrypter.decrypt64(data, iv: iv);
  }
}
