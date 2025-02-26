import 'package:flutter/material.dart';
import 'package:wise_wallet/UI/PaymentScreens/PasswordEnteringScreen/repos.dart';

class PasswordCheckingComponent extends StatefulWidget {
  final VoidCallback onPinEntered;
  const PasswordCheckingComponent({super.key, required this.onPinEntered});

  @override
  State<PasswordCheckingComponent> createState() =>
      _PasswordCheckingComponentState();
}

class _PasswordCheckingComponentState extends State<PasswordCheckingComponent> {
  final List<TextEditingController> _controllers =
      List.generate(4, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());
  final PasswordEnteringScreenRepo repo = PasswordEnteringScreenRepo();

  String _errorMessage = "";
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNodes[0]);
    });
  }

  void _moveToNextField(int currentIndex, String value) {
    if (value.isNotEmpty && currentIndex < 3) {
      FocusScope.of(context).requestFocus(_focusNodes[currentIndex + 1]);
    } else if (value.isEmpty &&
        currentIndex > 0 &&
        _controllers[currentIndex].text.isEmpty) {
      FocusScope.of(context).requestFocus(_focusNodes[currentIndex - 1]);
    }
  }

  void _onPinEntered() async {
    if (_isLoading) return;
    setState(() => _isLoading = true);

    final pin = _controllers.map((e) => e.text).join();
    debugPrint("Entered PIN: $pin");

    // Validate PIN format
    if (!RegExp(r'^\d{4}$').hasMatch(pin)) {
      setState(() {
        _errorMessage = "Enter a valid 4-digit PIN";
        _isLoading = false;
      });
      debugPrint("Invalid PIN format");
      return;
    }

    setState(() => _errorMessage = "");

    try {
      String _pin = pin.toString();
      final isValid = await repo.checkPin(_pin);
      debugPrint("PIN validation result: $isValid");

      if (isValid) {
        debugPrint("Calling onPinEntered...");
        widget.onPinEntered();
        Future.delayed(const Duration(milliseconds: 200), () {
          Navigator.pop(context);
        });
      } else {
        setState(() => _errorMessage = "Invalid PIN!");
        _clearFields();
        debugPrint("Invalid PIN entered");
      }
    } catch (e) {
      setState(() => _errorMessage = "Something went wrong. Please try again.");
      _clearFields();
      debugPrint("PIN verification failed: $e");
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _clearFields() {
    for (var controller in _controllers) {
      controller.clear();
    }
    setState(() {});
    FocusScope.of(context).requestFocus(_focusNodes[0]);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Enter the 4-digit bank-provided password to proceed with the transaction.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(4, (index) {
                      return SizedBox(
                        width: 40,
                        child: TextField(
                          controller: _controllers[index],
                          focusNode: _focusNodes[index],
                          maxLength: 1,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          obscureText: true,
                          decoration: const InputDecoration(
                            counterText: '',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            _moveToNextField(index, value);
                          },
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _errorMessage,
                    style: const TextStyle(color: Colors.red, fontSize: 14),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _isLoading ? null : _onPinEntered,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: Colors.blueAccent,
              ),
              child: _isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text(
                      'Submit PIN',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }
}
