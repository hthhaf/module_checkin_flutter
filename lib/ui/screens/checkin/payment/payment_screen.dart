import 'package:flutter/material.dart';
import 'package:flutter_check_in_app/ui/screens/checkin/payment/components/background.dart';
import 'package:flutter_check_in_app/ui/screens/checkin/payment/components/form_payment.dart';
import 'package:flutter_check_in_app/ui/screens/checkin/payment/components/select_payment.dart';

import '../../../../ulitites/Colors.dart';
import '../list_passboard/list_passboard_screen.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: bg,
      child: SafeArea(
        child: Stack(
          children: [
            const Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: BackgroundPayment(),
            ),
            Positioned(
              left: 0,
              right: 0,
              child: Column(
                children: [
                  const FormPayment(),
                  const SelectPayment(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PassboardScreen()));
                    },
                    // ignore: sort_child_properties_last
                    child: const Text(
                      "THANH TOÁN",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 120, vertical: 12),
                        backgroundColor: priBlue,
                        shape: const StadiumBorder() // Background color
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
