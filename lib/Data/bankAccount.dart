class BankAccount {
  final String accountHolderName;
  final String mobileNumber;
  final List<Banks> banks;
  BankAccount(
      {required this.accountHolderName,
      required this.mobileNumber,
      required this.banks});
  factory BankAccount.fromJson(Map<String, dynamic> json) {
    List<Map<String, dynamic>> bankList = json['banks'];

    return BankAccount(
        accountHolderName: json['accountHolderName'],
        mobileNumber: json['mobile'],
        banks: bankList
            .map((Map<String, dynamic> bank) => Banks.fromJson(bank))
            .toList());
  }
}

class Banks {
  final String bankName;
  final bool netBanking;
  final String accountNumber;
  final String ifscCode;
  final double balance;
  Banks(
      {required this.bankName,
      required this.netBanking,
      required this.accountNumber,
      required this.ifscCode,
      required this.balance});
  factory Banks.fromJson(Map<String, dynamic> json) {
    return Banks(
        bankName: json['bankName'],
        netBanking: json['netBanking'],
        accountNumber: json['accountNumber'],
        ifscCode: json['ifscCode'],
        balance: json['balance']);
  }
}
