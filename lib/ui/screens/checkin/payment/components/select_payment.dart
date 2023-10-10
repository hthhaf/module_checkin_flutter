import 'package:flutter/material.dart';
import 'package:flutter_check_in_app/ulitites/colors.dart';

class SelectPayment extends StatelessWidget {
  const SelectPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      margin: const EdgeInsets.fromLTRB(20, 5, 0, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Phương thức thanh toán",
            style: TextStyle(
              height: 3,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) => const PaymentCard(),
            ),
          )
        ],
      ),
    );
  }
}

class PaymentCard extends StatelessWidget {
  const PaymentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 240,
      margin: const EdgeInsets.fromLTRB(0, 0, 10, 10),
      decoration: BoxDecoration(
        color: blue,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Colors.black12.withOpacity(0.24),
              offset: const Offset(1, 3),
              spreadRadius: 1,
              blurRadius: 3),
        ],
      ),
      child: const Stack(
        children: [
          //CheckboxCustom(),
        ],
      ),
    );
  }
}
