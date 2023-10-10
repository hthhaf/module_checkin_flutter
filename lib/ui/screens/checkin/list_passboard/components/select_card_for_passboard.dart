import 'package:flutter/material.dart';
import 'package:flutter_check_in_app/ui/screens/checkin/list_passboard/components/passboard_screens.dart';
import 'package:flutter_check_in_app/ulitites/colors.dart';

import '../../../../../state/models/passboard_model.dart';

// ignore: must_be_immutable
class SelectCardForPassBoard extends StatelessWidget {
  PassboardModel customer;
  SelectCardForPassBoard({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 70,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${customer.customer.title}. ${customer.customer.lastName} ${customer.customer.firstName}",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Text("Checked-in"),
            ],
          ),
          IconButton(
            alignment: Alignment.center,
            icon: const Icon(
              Icons.add,
              size: 36,
              color: priBlue,
            ),
            onPressed: () async {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Passboard(pb: customer),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
