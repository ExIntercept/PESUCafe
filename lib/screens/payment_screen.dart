import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  final double totalAmount;

  PaymentScreen({required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
        backgroundColor: Colors.yellow,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Amount: ₹${totalAmount.toStringAsFixed(2)}', // Assuming INR currency symbol is ₹
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Select Payment Method:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Implement payment method
              },
              child: Text('UPI'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement payment method
              },
              child: Text('Card'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement payment method
              },
              child: Text('Netbanking'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement payment method
              },
              child: Text('Wallet'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement payment method
              },
              child: Text('Pay Later'),
            ),
          ],
        ),
      ),
    );
  }
}
