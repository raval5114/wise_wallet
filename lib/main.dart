import 'package:flutter/material.dart';
import 'package:wise_wallet/Data/config.dart';
import 'package:wise_wallet/Test/paymentMaking.dart';
import 'package:wise_wallet/UI/PaymentScreens/ScannerPaymentScreen/amountWritingScreen.dart';
import 'package:wise_wallet/splashscreen.dart';

void main() {
  debugPrint("Fetching local IP...");
  debugPrint("Local IP Address: ${DOMAIN_IP}");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Wise Wallets',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          extensions: <ThemeExtension>[
            CustomTheme(
              navyBlackGradient: const LinearGradient(
                colors: [
                  Color(0xFF000080),
                  Colors.black
                ], // Navy blue and black
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ],
        ),
        home: SplashScreen());
  }
}

class CustomTheme extends ThemeExtension<CustomTheme> {
  final LinearGradient navyBlackGradient;

  const CustomTheme({required this.navyBlackGradient});

  @override
  CustomTheme copyWith({LinearGradient? navyBlackGradient}) {
    return CustomTheme(
      navyBlackGradient: navyBlackGradient ?? this.navyBlackGradient,
    );
  }

  @override
  CustomTheme lerp(ThemeExtension<CustomTheme>? other, double t) {
    if (other is! CustomTheme) return this;
    return CustomTheme(
      navyBlackGradient:
          LinearGradient.lerp(navyBlackGradient, other.navyBlackGradient, t)!,
    );
  }
}
