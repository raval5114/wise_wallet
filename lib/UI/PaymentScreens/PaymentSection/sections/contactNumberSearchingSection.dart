import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wise_wallet/Data/testingData.dart';
import 'package:wise_wallet/UI/PaymentScreens/PaymentSection/bloc/payment_section_bloc.dart';

// ContactNumberSearching
class ContactNumberSearchingSection extends StatefulWidget {
  final Function(int index, Map<String, dynamic>? data) onNavigate;

  const ContactNumberSearchingSection({super.key, required this.onNavigate});

  @override
  State<ContactNumberSearchingSection> createState() =>
      _ContactNumberSearchingSectionState();
}

class _ContactNumberSearchingSectionState
    extends State<ContactNumberSearchingSection> {
  List<Map<String, dynamic>> filteredContacts = [];

  @override
  void initState() {
    super.initState();
    filteredContacts = List.from(testingdata);
  }

  void onSearch(String value) {
    context
        .read<PaymentSectionBloc>()
        .add(PaymentSectionContactSearchingEvent(number: value));
    debugPrint('value:$value');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Bar
          TextField(
            onChanged: onSearch,
            decoration: InputDecoration(
              hintText: "Search contacts",
              filled: true,
              fillColor: Colors.grey[200],
              prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: BlocConsumer<PaymentSectionBloc, PaymentSectionState>(
              listener: (context, state) {},
              listenWhen: (previous, current) =>
                  current is PaymentSectionActionState,
              buildWhen: (previous, current) =>
                  current is! PaymentSectionActionState,
              builder: (context, state) {
                if (state is PaymentSectionContactSearchingSuccessState) {
                  filteredContacts = state.data;
                  return filteredContacts.isNotEmpty
                      ? ListView.builder(
                          itemCount: filteredContacts.length,
                          itemBuilder: (context, index) {
                            final contact = filteredContacts[index];
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.grey[300],
                                child: Text(
                                  _getInitials(contact['accountHolderName']),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              title: Text(
                                contact['accountHolderName'],
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              onTap: () => widget.onNavigate(1, contact),
                            );
                          },
                        )
                      : const Center(
                          child: Text(
                            "No contacts found",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        );
                } else if (state
                    is PaymentSectionContactSearchingLoadingState) {
                  return _buildShimmerEffect();
                } else {
                  return const SizedBox();
                }
              },
            ),
          )
        ],
      ),
    );
  }

  // Shimmer Effect
  Widget _buildShimmerEffect() {
    return ListView.builder(
      itemCount: 5, // Simulating 5 shimmer items
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 24,
            ),
            title: Container(
              height: 10,
              width: 100,
              color: Colors.white,
            ),
            subtitle: Container(
              height: 10,
              width: 200,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  String _getInitials(String accountHolderName) {
    List<String> accountHolderNameParts = accountHolderName.split(" ");
    return accountHolderNameParts.length > 1
        ? "${accountHolderNameParts[0][0]}${accountHolderNameParts[1][0]}"
            .toUpperCase()
        : accountHolderNameParts[0][0].toUpperCase();
  }
}
