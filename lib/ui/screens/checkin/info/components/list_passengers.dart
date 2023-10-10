import 'package:flutter/material.dart';
import 'package:flutter_check_in_app/ui/screens/checkin/info/components/select_customers.dart';
import 'package:flutter_check_in_app/ulitites/colors.dart';

// ignore: must_be_immutable
class Passenger extends StatelessWidget {
  String confirmationNumber;

  Passenger({
    super.key,
    required this.confirmationNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: MediaQuery.of(context).size.height * 0.612,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Mã đặt chỗ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    height: 2,
                  ),
                ),
              ],
            ),
            Text(
              confirmationNumber,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                height: 1.5,
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Danh sách hành khách",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    height: 2,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 600,
              height: 380,
              child: SelectCustomers(),
            ),
          ],
        ),
      ),
    );
  }
}
