import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wise_wallet/Data/models/payment.dart';
import 'package:wise_wallet/Data/user.dart';
import 'package:wise_wallet/UI/PaymentScreens/PaymentSection/bloc/payment_section_bloc.dart';

class BankSelectionSection extends StatefulWidget {
  final Function(int index, Map<String, dynamic> data) onNavigate;
  final Map<dynamic, dynamic> data;
  const BankSelectionSection({
    super.key,
    required this.onNavigate,
    required this.data,
  });

  @override
  State<BankSelectionSection> createState() => _BankSelectionSectionState();
}

class _BankSelectionSectionState extends State<BankSelectionSection> {
  final List<Map<String, dynamic>> banks = [
    {'name': 'Bank A', 'id': 1},
    {'name': 'Bank B', 'id': 2},
    {'name': 'Bank C', 'id': 3},
  ];

  @override
  void initState() {
    super.initState();
    debugPrint("${widget.data}");
    debugPrint('${widget.data?['selected bank']}');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Select Your Bank",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          BankSelectionComponent(
            onNavigate: widget.onNavigate,
            data: widget.data.cast<String, dynamic>(),
          )
        ],
      ),
    );
  }
}

class BankSelectionComponent extends StatefulWidget {
  final Function(int index, Map<String, dynamic> data) onNavigate;
  final Map<String, dynamic>? data;
  const BankSelectionComponent(
      {super.key, this.data, required this.onNavigate});
  @override
  State<BankSelectionComponent> createState() => _BankSelectionComponentState();
}

class _BankSelectionComponentState extends State<BankSelectionComponent> {
  PaymentSectionBloc bloc = PaymentSectionBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    bloc.add(
      PaymentSectionBankSelectionEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentSectionBloc, PaymentSectionState>(
      bloc: bloc,
      listenWhen: (previous, current) => current is PaymentSectionActionState,
      buildWhen: (previous, current) => current is! PaymentSectionActionState,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is PaymentSectionBankSelectionLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PaymentSectionErrorState) {
          return Center(
            child: Text(
              state.error.toString(),
              style: const TextStyle(color: Colors.red),
            ),
          );
        } else if (state is PaymentSectionBankSelectionSuccessState) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: userSession.userBankAccountDetails?.banks.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    child: Text(
                      '->',
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  title: Text(
                    userSession.userBankAccountDetails?.banks[index].bankName ??
                        'Bank Name',
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded,
                      size: 18, color: Colors.grey),
                  onTap: () {
                    try {
                      final fromNumber =
                          int.tryParse(userSession.mobile ?? '0') ?? 0;
                      final toNumber = int.tryParse(
                              widget.data?['mobile number']?.toString() ??
                                  '0') ??
                          0;

                      payment.fromNumber = fromNumber;
                      payment.toNumber = toNumber;
                      payment.fromBank = userSession
                              .userBankAccountDetails?.banks[index].bankName ??
                          'Unknown Bank';
                      payment.toBank =
                          widget.data?['selected bank']?.toString() ?? 'N/A';

                      if (widget.data != null) {
                        widget.onNavigate(3, widget.data!);
                      } else {
                        debugPrint("widget.data is null");
                      }
                    } catch (e) {
                      debugPrint("Error in onTap: $e");
                    }
                  },
                ),
              );
            },
          );
        }
        return SizedBox();
      },
    );
  }
}
