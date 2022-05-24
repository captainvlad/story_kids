import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:story_kids/managers/client/encryption_manager.dart';
import 'package:story_kids/models/client/user_model.dart';
import 'package:story_kids/models/client/utils.dart';

class UserStorageManager {
  static final UserStorageManager instance = UserStorageManager._internal();
  UserStorageManager._internal();

  Future<UserModel> addUser(UserModel user) async {
    var databaseReference = FirebaseDatabase.instance.ref();
    DatabaseEvent event = await databaseReference.once();

    int childrenNumber = event.snapshot.children.length;
    int currentTime = Utils.getMilliseconds();

    String newUserId = "$childrenNumber-$currentTime";
    user.id = newUserId;

    await databaseReference.child(user.id).set(
      {
        'id': EncryptionManager.encrypt(user.id),
        'mail': EncryptionManager.encrypt(user.mail),
        'name': EncryptionManager.encrypt(user.name),
        'surname': EncryptionManager.encrypt(user.surname),
        'username': EncryptionManager.encrypt(user.userName),
        'password': EncryptionManager.encrypt(user.password),
        'plan': EncryptionManager.encrypt(user.chosenPlanName),
        'payment': EncryptionManager.encrypt(user.paymentService),
        'category': EncryptionManager.encrypt(user.chosenCategory),
      },
    );

    return user;
  }

  Future<void> updateUserPaymentService(
    UserModel user,
    String newPaymentService,
  ) async {
    user.paymentService = newPaymentService;
    String encryptedUserMail = EncryptionManager.encrypt(user.mail);

    DataSnapshot? userSnapshot =
        await _getSnapshotByKeyValue('mail', encryptedUserMail);

    if (userSnapshot != null) {
      await _updateSnapshotField(userSnapshot, 'payment', newPaymentService);
    }
  }

  Future<DataSnapshot?> _getSnapshotByKeyValue(
    String key,
    String value,
  ) async {
    Iterable<DataSnapshot> children = await _getAllSnapshots();

    DataSnapshot? neededChild = children.firstWhereOrNull(
      (element) {
        var pValue = element.child(key).value;

        if (pValue == null) {
          return false;
        } else {
          pValue as String;
          return pValue == value;
        }
      },
    );

    return neededChild;
  }

  Future<String?> _getValueByKey(
    DataSnapshot snapshot,
    String keyValue,
  ) async {
    DataSnapshot? node = snapshot.children.firstWhereOrNull(
      (element) {
        if (element.key == null) {
          return false;
        } else {
          return element.key as String == keyValue;
        }
      },
    );

    return node?.value as String?;
  }

  Future<Iterable<DataSnapshot>> _getAllSnapshots() async {
    var databaseReference = FirebaseDatabase.instance.ref();
    DatabaseEvent event = await databaseReference.once();

    return event.snapshot.children;
  }

  Future<void> _updateSnapshotField(
    DataSnapshot item,
    String field,
    String value,
  ) async {
    String fieldValueEncoded = EncryptionManager.encrypt(value);
    await item.ref.update({field: fieldValueEncoded});
  }

  Future<void> _removeSnapshot(DataSnapshot item) async {
    await item.ref.remove();
  }

  Future<void> _removeAllSnapshots() async {
    var users = await _getAllSnapshots();

    for (var user in users) {
      await _removeSnapshot(user);
    }
  }

  Future<UserModel> _snapshotToUser(DataSnapshot item) async {
    String? idEncrypted = await _getValueByKey(item, "id");
    String? mailEncrypted = await _getValueByKey(item, "mail");
    String? nameEncrypted = await _getValueByKey(item, "name");
    String? surnameEncrypted = await _getValueByKey(item, "surname");
    String? usernameEncrypted = await _getValueByKey(item, "username");
    String? passwordEncrypted = await _getValueByKey(item, "password");
    String? chosenPlanNameEncrypted = await _getValueByKey(item, "plan");
    String? paymentServiceEncrypted = await _getValueByKey(item, "payment");
    String? chosenCategoryEncrypted = await _getValueByKey(item, "category");

    return UserModel(
      id: EncryptionManager.decrypt(idEncrypted!),
      mail: EncryptionManager.decrypt(mailEncrypted!),
      name: EncryptionManager.decrypt(nameEncrypted!),
      surname: EncryptionManager.decrypt(surnameEncrypted!),
      userName: EncryptionManager.decrypt(usernameEncrypted!),
      password: EncryptionManager.decrypt(passwordEncrypted!),
      chosenCategory: EncryptionManager.decrypt(chosenCategoryEncrypted!),
      chosenPlanName: EncryptionManager.decrypt(chosenPlanNameEncrypted!),
      paymentService: EncryptionManager.decrypt(paymentServiceEncrypted!),
    );
  }

  Future<UserModel?> getUserByMail(String mailValue) async {
    String encryptedMailValue = EncryptionManager.encrypt(mailValue);

    DataSnapshot? item =
        await UserStorageManager.instance._getSnapshotByKeyValue(
      "mail",
      encryptedMailValue,
    );

    if (item == null) {
      return null;
    } else {
      return await UserStorageManager.instance._snapshotToUser(item);
    }
  }
}
