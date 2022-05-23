import 'package:story_kids/models/client/abstract_request.dart';
import 'package:story_kids/models/client/user_model.dart';

class CheckRequest extends AbstractRequest {
  late String userId;
  late String userMail;

  Future<void> initialize(UserModel userModel) async {
    type = "check";
    userId = userModel.id;
    userMail = userModel.mail;
    credentials = await getCredentials();
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'userId': userId,
      'liqpayPrivateKey': '${credentials!["private_key"]}',
      'liqpayPublicKey': '${credentials!["public_key"]}',
      'stripeSecretKey': '${credentials!["secret_key"]}',
    };
  }
}
