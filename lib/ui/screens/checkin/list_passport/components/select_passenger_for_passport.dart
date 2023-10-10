import 'package:flutter/material.dart';
import 'package:flutter_check_in_app/ui/screens/checkin/list_passport/components/select_card.dart';

class SelectPassengerForPassport extends StatelessWidget {
  const SelectPassengerForPassport({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.64,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => const SelectCard(),
      ),
    );
  }
}
