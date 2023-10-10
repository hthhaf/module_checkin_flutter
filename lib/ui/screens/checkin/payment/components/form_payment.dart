import 'package:flutter/material.dart';

import '../../../../../ulitites/Colors.dart';

class FormPayment extends StatelessWidget {
  const FormPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      margin: const EdgeInsets.fromLTRB(20, 90, 20, 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person),
              Text(
                "Nguyen Van A",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Container(
            color: colorBorder,
            height: 0.6,
            margin: const EdgeInsetsDirectional.symmetric(vertical: 10),
          ),
          const Row(),
          const Spacer(),
          Container(
            color: colorBorder,
            height: 0.6,
            margin: const EdgeInsetsDirectional.symmetric(vertical: 10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 20,
              ),
              const Text(
                "TỔNG CỘNG   VND " "75,600",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
