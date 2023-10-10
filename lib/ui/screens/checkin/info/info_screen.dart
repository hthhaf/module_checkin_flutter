import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_check_in_app/state/models/retrieve_pnr_custom_model.dart';
import 'package:flutter_check_in_app/ui/screens/checkin/info/components/list_passengers.dart';
import 'package:flutter_check_in_app/ulitites/colors.dart';
import 'package:provider/provider.dart';

import '../../../../state/providers/seat_provider.dart';
import '../../../../state/services/local/shared_preferences.dart';
import '../../../../state/services/local/shared_references_key.dart';
import 'components/flight_info.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  //late RetrievePnrCustomModel pnr;

  @override
  void initState() {
    super.initState();
    savePnrToPro();
  }

  Future<RetrievePnrCustomModel> customPnr() async {
    final pnr = await SharedRServices().getString(SharedPnr.pnr);
    final decodedPnr = json.decode(pnr);
    final customPnr = RetrievePnrCustomModel.fromJson(decodedPnr);

    return customPnr;
  }

  Future<void> savePnrToPro() async {
    final pnr2 = await customPnr();
    setState(() {
      Provider.of<SeatProvider>(context, listen: false).addPnr(pnr2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: bg,
      child: SafeArea(
        child: FutureBuilder<RetrievePnrCustomModel?>(
          future: customPnr(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError || snapshot.data == null) {
              return const Text('Error fetching data');
            } else {
              //print(snapshot.data!);
              return Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    child: FlightInfo(flightInfo: snapshot.data!),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    //top: 120,
                    bottom: 20,
                    child: Passenger(
                      confirmationNumber: snapshot.data!.confirmationNumber,
                    ),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
