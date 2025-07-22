import 'package:flutter/material.dart';
import 'package:pig_killer_riders/domain/domain.dart';
import 'package:pig_killer_riders/infraestructure/driven_adapters/users_firestore_service.dart';

class AccountStatements extends StatefulWidget {
  static const String name = 'Estados de cuenta';
  static const String route = '/account-statements';

  const AccountStatements({super.key});

  @override
  State<AccountStatements> createState() => _AccountStatementsState();
}

class _AccountStatementsState extends State<AccountStatements> {

  final UsersUseCase usersUseCase = UsersUseCase(
    UsersFirestoreService(), // Assuming UsersGateway is implemented somewhere
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: usersUseCase.getUsers(),
        builder: (context, snapshot) {
          if(snapshot.hasError || snapshot.data == null) {
            return Center(child: CircularProgressIndicator(color: Colors.white,),);
          }

          if(!snapshot.hasData) {
            return Text('Error en hasData del Future');
          }

          final (error, users) = snapshot.data as (ErrorModel?, List<UserModel>);

          return Column(
            children: [


              Expanded(
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final data = users[index];
                    final fullName = data.fullName;
                    final payments = data.payments;

                    final noPayments = _getTotalMonNotPayments(data);

                    return Card(
                      color: Colors.grey,
                      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: ExpansionTile(
                        initiallyExpanded: noPayments.isNotEmpty,
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                fullName,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold
                                )
                              ),
                            ],
                          )
                        ),

                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 5, bottom: 5),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Meses pagados:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )
                            )
                          ),
                          Wrap(
                            children: _getTotalMonPayments(payments),
                          ),

                          Container(
                            padding: EdgeInsets.only(left: 5, top: 20, bottom: 5),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Meses que debe:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )
                            )
                          ),
                          Wrap(
                            children: noPayments,
                          ),

                          const SizedBox(height: 10)
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  List<Widget> _getTotalMonPayments(List<PaymentModel> payments) {
    final elements = <Widget>[];

    for (var i = 0; i < payments.length; i++) {
      final dates = payments[i];

      for(var mes in dates.dates) {
        elements.add(
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Chip(
              label: Text(mes, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,)),
              color: WidgetStatePropertyAll<Color>(Colors.greenAccent),
            ),
          )
        );
      }
    }

    return elements;
  }

List<Widget> _getTotalMonNotPayments(UserModel user) {
  final integrationMon = user.integrationMon; // e.g., '2025-01'
  final payments = user.payments;

  // Collect paid months
  final paidMonths = <String>{};
  for (var payment in payments) {
    paidMonths.addAll(payment.dates);
  }

  // Parse integrationMon
  final startYear = int.parse(integrationMon.split('-')[0]);
  final startMonth = int.parse(integrationMon.split('-')[1]);

  final now = DateTime.now();
  final endYear = now.year;
  final endMonth = now.month;

  // Generate all months from integrationMon to now
  final allMonths = <String>[];
  var year = startYear;
  var month = startMonth;
  while (year < endYear || (year == endYear && month <= endMonth)) {
    allMonths.add('${year.toString().padLeft(4, '0')}-${month.toString().padLeft(2, '0')}');
    month++;
    if (month > 12) {
      month = 1;
      year++;
    }
  }

  // Find unpaid months
  final unpaidMonths = allMonths.where((m) => !paidMonths.contains(m)).toList();

  // Return as chips
  return unpaidMonths.map((mes) => Padding(
    padding: const EdgeInsets.only(left: 5),
    child: Chip(
      label: Text(mes, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
      color: const WidgetStatePropertyAll<Color>(Colors.red),
    ),
  )).toList();
}
}
