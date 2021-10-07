import 'package:flutter/material.dart';

class LoanUi extends StatefulWidget {
  @override
  _LoanUiState createState() => _LoanUiState();
}

class _LoanUiState extends State<LoanUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("Loan Pre-Qualification Page".toUpperCase()),
        ),
      ),
    );
  }
}
