import 'package:pig_killer_riders/infraestructure/db/firestore_db.dart';

import '../../domain/domain.dart';

class UsersFirestoreService extends UsersGateway {

  final FirestoreService firestoreService;

  UsersFirestoreService() : firestoreService = FirestoreService();

  @override
  Future<(ErrorModel?, UserModel)> createUser(UserModel user) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<(ErrorModel?, List<UserModel>)> getUsers() async {
    try {
      final snapshot = await firestoreService.db.collection('Members').get();

      final allUsersMap = snapshot.docs
        .map((doc) => doc.data()['users'])
        .whereType<List>()
        .expand((users) => users)
        .whereType<Map<String, dynamic>>()
        .toList();

      final doc = snapshot.docs.first;
      final List<UserModel> allUsers = allUsersMap.map(
        (userMap) => UserModel.fromMap(userMap, doc.id)).toList();

      print(allUsers);

      return (null, allUsers);
    } catch(e) {
      return (ErrorModel(name: e.toString()), <UserModel>[]);
    }

  }

  @override
  Future<(ErrorModel?, UserModel)> setPayment(String userId, PaymentModel payment) {
    // TODO: implement setPayment
    throw UnimplementedError();
  }
}