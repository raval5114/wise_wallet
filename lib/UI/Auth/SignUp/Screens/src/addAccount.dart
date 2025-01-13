import 'package:flutter/material.dart';

class AddAccountDetails extends StatefulWidget {
  const AddAccountDetails({super.key});

  @override
  State<AddAccountDetails> createState() => _AddAccountDetailsState();
}

class _AddAccountDetailsState extends State<AddAccountDetails> {
  // Controllers for the input fields
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _ifscCodeController = TextEditingController();

  // Error text for validation
  String? _errorText(String text, String fieldName) {
    if (text.isEmpty) {
      return "$fieldName cannot be empty";
    }
    return null;
  }

  void _validateFields() {
    setState(() {}); // Triggers rebuild for validation updates
  }

  void _showAccountDetailsOverlay() {
    showDialog(
      context: context,
      barrierDismissible: true, // Allows dismissing by tapping outside
      builder: (context) {
        return Material(
          type: MaterialType.transparency, // Ensures transparency
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(25),
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        "Entered Bank Details",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Displaying account details in a structured way
                    _buildAccountInfoRow("Account Number:", "1234567"),
                    _buildAccountInfoRow("IFSC Code:", "1234567"),
                    _buildAccountInfoRow("Bank Name:", "SBI"),
                    _buildAccountInfoRow("Balance", "20000"),
                    const SizedBox(height: 20),

                    // Add account button
                    ElevatedButton(
                      onPressed: () {
                        if (_accountNumberController.text.isNotEmpty &&
                            _ifscCodeController.text.isNotEmpty) {
                          // Perform submission logic here
                          Navigator.of(context).pop(); // Close the overlay
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text("Account details added successfully!"),
                            ),
                          );
                        } else {
                          _validateFields();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        elevation: 6,
                      ),
                      child: const Center(
                        child: Text(
                          "Add Account",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Existing Accounts Section with Title
                    const Text(
                      "Linked Bank Accounts",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    SizedBox(
                      height: 220,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 6,
                        itemBuilder: (context, index) => _buildAccountCard(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

// Reusable widget for displaying account info in a row
  Widget _buildAccountInfoRow(String label, String value) {
    return Row(
      children: [
        Text(
          "$label ",
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 16, color: Colors.blueAccent),
        ),
      ],
    );
  }

// Reusable widget for displaying account cards
  Widget _buildAccountCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Account: ****1234",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Bank Name: Canara",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "IFSC: ABCD0123456",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    // Your delete functionality
                  },
                  splashRadius: 22,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose controllers to free resources
    _accountNumberController.dispose();
    _ifscCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          "Add Your Bank Account",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 10),
        const Text(
          "Securely link your bank account details",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.white70),
        ),
        const SizedBox(height: 20),

        // Account Number Input
        TextField(
          controller: _accountNumberController,
          decoration: InputDecoration(
            hintText: "Enter Account Number",
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            prefixIcon:
                const Icon(Icons.account_balance, color: Colors.blueAccent),
            errorText:
                _errorText(_accountNumberController.text, "Account Number"),
          ),
          onChanged: (value) => _validateFields(),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 20),

        // IFSC Code Input
        TextField(
          controller: _ifscCodeController,
          decoration: InputDecoration(
            hintText: "Enter IFSC Code",
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            prefixIcon: const Icon(Icons.code, color: Colors.blueAccent),
            errorText: _errorText(_ifscCodeController.text, "IFSC Code"),
          ),
          onChanged: (value) => _validateFields(),
        ),
        const SizedBox(height: 30),

        // Add Account Button
        ElevatedButton(
          onPressed: _showAccountDetailsOverlay,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(vertical: 15),
          ),
          child: const Text(
            "Add Account",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
