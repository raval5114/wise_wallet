import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wise_wallet/UI/PaymentScreens/PaymentProccesingScreen/bloc/payment_processing_bloc.dart';
import 'package:wise_wallet/UI/PaymentScreens/PaymentProccesingScreen/widgets/paymentProceesingComponent.dart';
import 'package:wise_wallet/UI/PaymentScreens/PaymentProccesingScreen/widgets/paymentProceesingSuceessfulComponent.dart';

class PaymentProcessingScreen extends StatelessWidget {
  final Map<String, dynamic> data;
  const PaymentProcessingScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: BlocProvider(
          create: (context) =>
              PaymentProcessingBloc()..add(PaymentProcessingEvent(data: data)),
          child: PaymentProcessingScreenComponent(),
        ),
      ),
    );
  }
}

class PaymentProcessingScreenComponent extends StatelessWidget {
  const PaymentProcessingScreenComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentProcessingBloc, PaymentProcessingState>(
      listenWhen: (previous, current) => current is PaymentProcessActionstate,
      buildWhen: (previous, current) => current is! PaymentProcessActionstate,
      listener: (context, state) {
        if (state is PaymentProcessErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(state.errorMessage), backgroundColor: Colors.red),
          );
        }
      },
      builder: (context, state) {
        if (state is PaymentProcessLoadingstate) {
          return PaymentProcessingComponent();
        } else if (state is PaymentProcessSuccessState) {
          return PaymentProcessingSuccessfulComponent(data: state.data);
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Payment failed. Please try again."),
              ElevatedButton(
                onPressed: () => context
                    .read<PaymentProcessingBloc>()
                    .add(PaymentProcessingEvent(data: {})),
                child: const Text("Retry"),
              ),
            ],
          ),
        );
      },
    );
  }
}
