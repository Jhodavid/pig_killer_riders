
import 'package:pig_killer_riders/domain/model/payment_model.dart';

import '../model/error_model.dart';
import '../model/user_model.dart';

abstract class UsersGateway {
  const UsersGateway();

  Future<(ErrorModel?, List<UserModel>)> getUsers();
  Future<(ErrorModel?, UserModel)> setPayment(String userId, PaymentModel payment);
  Future<(ErrorModel?, UserModel)> createUser(UserModel user);
}