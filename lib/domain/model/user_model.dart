
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

  UserModel copyWith({
    String? id,
    String? fullName,
    String? integrationMon,
    List<PaymentModel>? payments,
  }) {
    return UserModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      integrationMon: integrationMon ?? this.integrationMon,
      payments: payments ?? this.payments,
    );
  }

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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'integrationMon': integrationMon,
      'payments': payments.map((p) => p.toMap()).toList(),
    };
  }
}