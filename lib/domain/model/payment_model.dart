
class PaymentModel {
  final List<String> dates;
  final String proofPaymentLink;

  PaymentModel({
    required this.dates,
    required this.proofPaymentLink,
  });

  factory PaymentModel.fromMap(Map<String, dynamic> map) {
    return PaymentModel(
      dates: List<String>.from(map['dates'] ?? []),
      proofPaymentLink: map['proofPaymentLink'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dates': dates,
      'proofPaymentLink': proofPaymentLink,
    };
  }
}