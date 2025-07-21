
import 'package:pig_killer_riders/domain/gateway/users_gateway.dart';

import '../model/error_model.dart';
import '../model/payment_model.dart';
import '../model/user_model.dart';

class UsersUseCase {
  final UsersGateway gateway;

  UsersUseCase(this.gateway);

  Future<(ErrorModel?, List<UserModel>)> getUsers() {
    return gateway.getUsers();
  }

  Future<(ErrorModel?, UserModel)> setPayment(String userId, PaymentModel payment) {
    return gateway.setPayment(userId, payment);
  }

  Future<(ErrorModel?, UserModel)> createUser(UserModel user) {
    return gateway.createUser(user);
  }
}