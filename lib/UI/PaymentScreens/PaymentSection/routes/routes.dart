import 'package:go_router/go_router.dart';
import 'package:wise_wallet/UI/PaymentScreens/PaymentSection/paymentSection.dart';
import 'package:wise_wallet/UI/PaymentScreens/PaymentSection/paymentSection_2.dart';
import 'package:wise_wallet/UI/PaymentScreens/PaymentSection/sections/contactNumberSearchingSection.dart';

final GoRouter router = GoRouter(
  routes: [
    ShellRoute(
        builder: (context, state, child) => Paymentsection2(child: child),
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => ContactNumberSearchingSection(
              onNavigate: (int index, Map<String, dynamic>? data) {},
            ),
          ),
        ])
  ],
);
