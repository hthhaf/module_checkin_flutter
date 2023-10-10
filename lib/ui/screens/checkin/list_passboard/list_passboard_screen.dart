import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_check_in_app/state/models/passboard_model.dart';
import 'package:flutter_check_in_app/state/models/seat_model.dart';
import 'package:flutter_check_in_app/ui/screens/checkin/list_passboard/components/list_selectcard_for_passboard.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:provider/provider.dart';

import '../../../../state/models/customer_model.dart';
import '../../../../state/models/retrieve_pnr_custom_model.dart';
import '../../../../state/providers/auth_provider.dart';
import '../../../../state/providers/seat_provider.dart';
import '../../../../state/services/apis/retrieve_pnr_api.dart';
import '../../../../state/services/local/shared_preferences.dart';
import '../../../../state/services/local/shared_references_key.dart';
import '../../../../ulitites/Colors.dart';
import '../../../shared/navbar_custom_widget.dart';

class PassboardScreen extends StatefulWidget {
  const PassboardScreen({super.key});

  @override
  State<PassboardScreen> createState() => _PassboardScreenState();
}

class _PassboardScreenState extends State<PassboardScreen> {
  @override
  void initState() {
    super.initState();
    _getPnr(context);
  }

  List<PassboardModel> passboardList = [];

  Future<void> _getPnr(BuildContext context) async {
    SeatProvider seatProvider =
        Provider.of<SeatProvider>(context, listen: false);

    ProgressDialog progressDialog = ProgressDialog(context);
    progressDialog.style(
      progressWidget: const CircularProgressIndicator(),
    );

    context.read<AuthProvider>().auth;
    try {
      progressDialog.show();

      await RetrievePnrApi.retrievePNR(
        confirmationNumber: seatProvider.pnr.confirmationNumber,
        lastname: " ",
      );

      final pnr = await SharedRServices().getString(SharedPnr.pnr);
      final decodedPnr = json.decode(pnr);
      final customPnr = RetrievePnrCustomModel.fromJson(decodedPnr);

      progressDialog.hide();
      final logicalFlight = decodedPnr['airlines'][0]['logicalFlight'][0];

      final physicalFlights = logicalFlight['physicalFlights'][0];

      final customers = physicalFlights['customers'];

      print(customers);
      for (var e in customers) {
        var temp = CustomerModel.fromJson(e);
        SeatModel seatTemp = SeatModel(
            row: e['airlinePersons'][0]['seatAssignments'][0]['rowNumber'],
            seat: e['airlinePersons'][0]['seatAssignments'][0]['seat']);

        passboardList.add(
            PassboardModel(pnr: customPnr, customer: temp, seat: seatTemp));
        print(passboardList[0].pnr.confirmationNumber);
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: bg,
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage(
                'assets/images/bgclouds.jpg',
              ),
              colorFilter: ColorFilter.mode(
                  priBlue.withOpacity(0.32), BlendMode.srcATop),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              NavBarCustom(
                text: 'Thẻ lên tàu',
              ),
              const SizedBox(height: 30),
              const Text(
                "Chọn hành khách để in thẻ lên tàu                                                ",
                style: TextStyle(
                  fontSize: 13,
                  color: white,
                ),
              ),
              const SizedBox(height: 5),
              ListSelectCardForPassboard(
                passboardList: passboardList,
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) {
                  //   return const SeatScreen();
                  // }));
                },
                // ignore: sort_child_properties_last
                child: const Text(
                  "TIẾP TỤC",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 120, vertical: 12),
                    backgroundColor: priBlue,
                    shape: const StadiumBorder() // Background color
                    ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
