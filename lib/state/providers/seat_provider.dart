import 'package:flutter/cupertino.dart';
import 'package:flutter_check_in_app/state/models/customer_model.dart';
import 'package:flutter_check_in_app/state/models/seat_assignment_model.dart';
import 'package:flutter_check_in_app/state/models/seat_model.dart';

import '../models/retrieve_pnr_custom_model.dart';

class SeatProvider extends ChangeNotifier {
  bool _toggleBottomCard = false;
  SeatModel _seat = SeatModel(row: -1, seat: " ");

  late RetrievePnrCustomModel _pnr;

  List<CustomerModel> _customers = [];
  late CustomerModel _customer;

  bool get toggleBottomCard => _toggleBottomCard;
  SeatModel get seat => _seat;
  RetrievePnrCustomModel get pnr => _pnr;
  CustomerModel get customer => _customer;

  List<SeatAssignmentModel> get listSeatAssignment => seatAssignment();
  List<CustomerModel> get customers => _customers;

  void addPnr(RetrievePnrCustomModel pnr) {
    _pnr = pnr;
  }

  void addCustomers(List<CustomerModel> customers) {
    _customers = customers;
  }

  void addCustomer(CustomerModel customer) {
    _customer = customer;
  }

  void updateSeatAssignment() {
    for (var e in listSeatAssignment) {
      if (e.customer.customerKey == _customer.customerKey) {
        e.seat = _seat;
      }
    }
  }

  void addSeatModel(SeatModel seat) {
    _seat = seat;
  }

  void toggleElement(bool isSelected) {
    if (isSelected) {
      _toggleBottomCard = true;
    } else {
      _toggleBottomCard = false;
    }

    notifyListeners();
  }

  List<SeatAssignmentModel> seatAssignment() {
    List<SeatAssignmentModel> listSeatAssignment = [];
    for (var e in _customers) {
      SeatAssignmentModel seatAssignment = SeatAssignmentModel(
        confirmationNumber: pnr.confirmationNumber,
        logicalFlightKey: pnr.logicalFlightKey,
        physicalFlightKey: pnr.physicalFlightKey,
        customer: e,
        seat: _seat,
      );
      listSeatAssignment.add(seatAssignment);
    }

    return listSeatAssignment;
  }

  void reset() {
    _toggleBottomCard = false;
    _seat = SeatModel(row: -1, seat: " ");
    _customers = [];

    notifyListeners(); // Notify listeners after resetting the state
  }
}
