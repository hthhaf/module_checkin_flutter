import 'package:flutter/material.dart';
import 'package:flutter_check_in_app/ui/screens/checkin/info/components/details2.dart';
import 'package:flutter_check_in_app/ulitites/colors.dart';

import '../../../../../state/models/retrieve_pnr_custom_model.dart';
import '../../../../shared/navbar_custom_widget.dart';
import 'details1.dart';

// ignore: must_be_immutable
class FlightInfo extends StatelessWidget {
  RetrievePnrCustomModel flightInfo;

  FlightInfo({
    super.key,
    required this.flightInfo,
  });
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.35;
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
        image: DecorationImage(
          image: const AssetImage(
            'assets/images/clouds.jpg',
          ),
          colorFilter:
              ColorFilter.mode(priBlue.withOpacity(0.72), BlendMode.srcATop),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          NavBarCustom(
            text: "Chuyến bay VU${flightInfo.operatingFlightNumber}",
          ),
          Container(
            //color: bg,
            padding: const EdgeInsets.symmetric(vertical: 10),
            alignment: Alignment.center,
            child: RotatedBox(
              quarterTurns: 1,
              child: Icon(
                Icons.airplanemode_active,
                size: 32,
                color: white,
                shadows: [
                  BoxShadow(
                      color: Colors.black12.withOpacity(0.5),
                      offset: const Offset(14, -5),
                      spreadRadius: 5,
                      blurRadius: 20),
                ],
              ),
            ),
          ),
          Details1(
            origin: flightInfo.origin,
            destination: flightInfo.destination,
            flightDate: flightInfo.departureDate,
          ),
          const SizedBox(height: 10),
          Details2(
            originName: flightInfo.originName,
            destinationName: flightInfo.destinationName,
            departureTime: flightInfo.departureTime,
            arrivaltime: flightInfo.arrivaltime,
            duration: flightInfo.flightDuration,
          )
        ],
      ),
    );
  }
}
