class Payment {
  late int _toNumber;
  late double _amount;
  late int _fromNumber;
  late String _fromBank;
  late String _toBank;

  Payment();
  set fromNumber(int value) {
    _fromNumber = value;
  }

  set toNumber(int value) {
    _toNumber = value;
  }

  set fromBank(String value) {
    _fromBank = value;
  }

  set toBank(String value) {
    _toBank = value;
  }

  set amount(double value) {
    _amount = value;
  }

  int get fromNumber => _fromNumber;
  int get toNumber => _toNumber;
  String get fromBank => _fromBank;
  String get toBank => _toBank;
  double get amount => _amount;

  Map<String, dynamic> toJson() {
    return {
      'fromNumber': _fromNumber ?? 00,
      'toNumber': _toNumber ?? 00,
      'fromBank': _fromBank ?? "",
      'toBank': _toBank ?? "",
      'amount': _amount ?? 0.0,
    };
  }

  Payment.fromJson(Map<String, dynamic> json) {
    _fromNumber = json['fromNumber'] ?? 0;
    _toNumber = json['toNumber'] ?? 0;
    _fromBank = json['fromBank'] ?? "";
    _toBank = json['toBank'] ?? "";
    _amount = json['amount'] ?? 0.0;
  }
  void clear() {
    _fromNumber = 0;
    _toNumber = 0;
    _fromBank = "";
    _toBank = "";
    _amount = 0.0;
  }
}

final Payment payment = Payment();
