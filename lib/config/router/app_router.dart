import 'package:go_router/go_router.dart';

import '../../../domain/domain.dart';
import '../../ui/ui.dart';

final appRouter = GoRouter(
  initialLocation: AccountStatements.route,
  routes: [
    GoRoute(
      path: AccountStatements.route,
      builder: (context, state) => AccountStatements()
    ),
    GoRoute(
      path: AccountStatementsAdmin.route,
        builder: (context, state) => AccountStatementsAdmin()
    )
  ],
  redirect: (context, state) {
    return null;
  },
);