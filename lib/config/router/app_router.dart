import 'package:go_router/go_router.dart';

import '../../ui/ui.dart';

final appRouter = GoRouter(
  initialLocation: Home.route,
  routes: [
    GoRoute(
      name: Home.route,
      path: Home.route,
      builder: (context, state) => Home()
    ),
    GoRoute(
      name: AccountStatements.route,
      path: AccountStatements.route,
      builder: (context, state) => AccountStatements()
    ),
    GoRoute(
      name: 'admin',
      path: AccountStatementsAdmin.route,
      builder: (context, state) => AccountStatementsAdmin()
    )
  ],
  redirect: (context, state) {
    return null;
  },
);