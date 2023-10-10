import 'package:flutter_check_in_app/state/models/customer_model.dart';
import 'package:flutter_check_in_app/state/models/seat_model.dart';

class SeatAssignmentModel {
  String confirmationNumber, logicalFlightKey, physicalFlightKey;
  CustomerModel customer;
  SeatModel seat;

  SeatAssignmentModel({
    required this.confirmationNumber,
    required this.logicalFlightKey,
    required this.physicalFlightKey,
    required this.customer,
    required this.seat,
  });

  factory SeatAssignmentModel.fromJson(Map<String, dynamic> json) {
    return SeatAssignmentModel(
      confirmationNumber: json['confirmationNumber'],
      logicalFlightKey: json['logicalFlightKey'],
      physicalFlightKey: json['physicalFlightKey'],
      customer: json['customerKey'],
      seat: json['seat'],
    );
  }
}
