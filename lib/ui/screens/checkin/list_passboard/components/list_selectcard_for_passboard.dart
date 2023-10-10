import 'package:flutter/material.dart';

import 'package:flutter_check_in_app/state/models/passboard_model.dart';

import 'package:flutter_check_in_app/ui/screens/checkin/list_passboard/components/select_card_for_passboard.dart';

// ignore: must_be_immutable
class ListSelectCardForPassboard extends StatelessWidget {
  List<PassboardModel> passboardList;
  ListSelectCardForPassboard({super.key, required this.passboardList});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.74,
      child: ListView.builder(
        itemCount: passboardList.length,
        itemBuilder: (context, index) => SelectCardForPassBoard(
          customer: passboardList[index],
        ),
      ),
    );
  }
}

class PassboardList {}
