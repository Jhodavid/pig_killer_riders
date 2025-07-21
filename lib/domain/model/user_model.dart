
import 'package:pig_killer_riders/domain/model/payment_model.dart';

class UserModel {
  final String id;
  final String fullName;
  final String integrationMon;
  final List<PaymentModel> payments;

  UserModel({
    required this.id,
    required this.fullName,
    required this.integrationMon,
    required this.payments,
  });

  factory UserModel.fromMap(Map<String, dynamic> map, String documentId) {
    return UserModel(
      id: documentId,
      fullName: map['fullName'] ?? '',
      integrationMon: map['integrationMon'] ?? '',
      payments: (map['payments'] as List<dynamic>? ?? [])
        .map((e) => PaymentModel.fromMap(e as Map<String, dynamic>))
        .toList(),
    );
  }
}