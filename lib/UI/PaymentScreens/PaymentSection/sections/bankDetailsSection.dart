import 'package:flutter/material.dart';

class BankDetailsSection extends StatelessWidget {
  final Function(int, Map<String, dynamic>?) onNavigate;
  final Map<String, dynamic> data;

  const BankDetailsSection({
    super.key,
    required this.onNavigate,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint(data['accountHolderName']);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Info Row
          Row(
            children: [
              InkWell(
                  onTap: () {
                    onNavigate(0, {});
                  },
                  child: Icon(Icons.arrow_back, color: Colors.black)),
              SizedBox(width: 10),
              CircleAvatar(
                backgroundColor: Colors.grey.shade400,
                child: Text(
                  (data['accountHolderName'][0] as String).toUpperCase(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data['accountHolderName'],
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "${data['banks'].length} accounts",
                    style: TextStyle(color: Colors.grey[600]),
                  )
                ],
              ),
            ],
          ),
          Divider(),

          // Banks List
          Expanded(
            child: ListView.builder(
              itemCount: data['banks'].length,
              itemBuilder: (context, index) {
                return buildBankTile(data['banks'][index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBankTile(Map<String, dynamic> bankData) {
    Map<String, dynamic> newData = {
      "accountHolderName": data['accountHolderName'],
      "mobile number": data['mobileno'],
      "selected bank": bankData['bankName'],
      "account number": bankData['accountNumber'],
      "ifsc code": bankData['ifscCode'],
      "balance": bankData['balance'],
    };

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.green,
        child: Text(bankData['bankName'][0],
            style: TextStyle(color: Colors.white)),
      ),
      title: Text(bankData['bankName'],
          style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(bankData['accountNumber']),
      onTap: () {
        onNavigate(2, newData);
      },
    );
  }
}
