import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/payment_receipt_controller.dart';

class PaymentReceiptView extends GetView<PaymentReceiptController> {
  const PaymentReceiptView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Receipt',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Menu:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            buildMenuItemRow('Pallubasa', 2, 20000),
            buildMenuItemRow('Nasi', 1, 5000),
            buildMenuItemRow('Bungkus', 3, 2000),
            // Tambahkan row untuk setiap menu dengan jumlah dan harga totalnya
            SizedBox(height: 24),
            Divider(),
            SizedBox(height: 12),
            buildTotalRow('Total Bayar:', 51000),
            buildTotalRow('Jumlah Uang:', 60000),
            buildTotalRow('Kembali:', 9000),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItemRow(String name, int quantity, int price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$name ($quantity)',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        Text(
          'Rp ${quantity * price}',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget buildTotalRow(String label, int amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Rp $amount',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
