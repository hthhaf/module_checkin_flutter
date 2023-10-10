import 'package:flutter_check_in_app/state/models/customer_model.dart';
import 'package:flutter_check_in_app/state/models/retrieve_pnr_custom_model.dart';
import 'package:flutter_check_in_app/state/models/seat_model.dart';

class PassboardModel {
  RetrievePnrCustomModel pnr;
  CustomerModel customer;
  SeatModel seat;

  PassboardModel({
    required this.pnr,
    required this.customer,
    required this.seat,
  });

  // factory PassboardModel.fromJson(Map<String, dynamic> json) {
  //   RetrievePnrCustomModel pnrTemp = RetrievePnrCustomModel.fromJson(json);
  //   CustomerModel customerTemp = CustomerModel.fromJson(json);

  //   return PassboardModel(
  //     pnr: pnrTemp,
  //     customer: customerTemp,
  //     seat: json['physicalFlightKey'],
  //   );
  // }
}
