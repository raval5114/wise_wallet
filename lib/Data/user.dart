import 'package:wise_wallet/Data/bankAccount.dart';

class User {
  String? firstName, lastName, email, dob, mobile, password;

  void loadSession(Map<String, dynamic> json) {
    firstName = json['firstname'] ?? "NA";
    lastName = json['lastname'] ?? "NA";
    email = json['email'] ?? "NA";
    dob = json['dob'] ?? "NA";
    mobile = json['mobileNo'] ?? "NA";
    password = json['password'] ?? "Na";
  }

  void cleanOutSession() {
    firstName = lastName = email = dob = mobile = password = null;
  }
}

class NewUser extends User {
  set newFirstname(String? value) => firstName = value;
  set newLastname(String? value) => lastName = value;
  set newEmail(String? value) => email = value;
  set newDob(String? value) => dob = value;
  set newMobile(String? value) => mobile = value;
  set newPassword(String? value) => password = value;

  Map<String, dynamic> toJson() {
    return {
      'firstname': firstName,
      'lastname': lastName,
      'email': email,
      'dob': dob,
      'mobile': mobile,
      'password': password,
    };
  }
}

class UserBankAccount extends User {
  late BankAccount userBankAccountDetails;
  void setBankAccountDetails({
    required String accountHolderName,
    required String mobileNumber,
    required List<Banks> banks,
  }) {
    userBankAccountDetails = BankAccount(
      accountHolderName: accountHolderName,
      mobileNumber: mobileNumber,
      banks: banks,
    );
  }
}

User userSession = User();
NewUser regUser = NewUser();
UserBankAccount bankAccount = UserBankAccount();
