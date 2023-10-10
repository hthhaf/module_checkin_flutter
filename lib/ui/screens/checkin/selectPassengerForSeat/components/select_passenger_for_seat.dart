import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_check_in_app/state/models/customer_model.dart';
import 'package:flutter_check_in_app/state/models/seat_model.dart';
import 'package:flutter_check_in_app/ui/screens/checkin/seatonairbus/seats_airbus_screen.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

import '../../../../../state/models/retrieve_pnr_custom_model.dart';
import '../../../../../state/models/seat_assignment_model.dart';
import '../../../../../state/providers/auth_provider.dart';
import '../../../../../state/providers/seat_provider.dart';
import '../../../../../state/services/apis/retrieve_seat_availability_list.dart';
import '../../../../../state/services/local/shared_preferences.dart';
import '../../../../../state/services/local/shared_references_key.dart';
import '../../../../../ulitites/Colors.dart';

class SelectPassengerForSeat extends StatefulWidget {
  const SelectPassengerForSeat({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SelectPassengerForSeatState createState() => _SelectPassengerForSeatState();
}

class _SelectPassengerForSeatState extends State<SelectPassengerForSeat> {
  List<CustomerModel> customers = [];

  @override
  void initState() {
    super.initState();
    fetchCustomers();
  }

  Future<List<CustomerModel>> getCustomers() async {
    final customers = await SharedRServices()
        .getString(SharedSelectedCustomers.selectedCustomers);
    final decodeCustomers = json.decode(customers);

    List<CustomerModel> customersList = [];

    decodeCustomers.forEach((value) {
      CustomerModel customerModel = CustomerModel.jsontoModel(value);
      customersList.add(customerModel);
    });
    return customersList;
  }

  Future<void> fetchCustomers() async {
    List<CustomerModel> customersData = await getCustomers();
    setState(() {
      Provider.of<SeatProvider>(context, listen: false)
          .addCustomers(customersData);
    });
  }

  Future<RetrievePnrCustomModel> customPnr() async {
    final pnr = await SharedRServices().getString(SharedPnr.pnr);
    final decodedPnr = json.decode(pnr);
    final customPnr = RetrievePnrCustomModel.fromJson(decodedPnr);

    return customPnr;
  }

  Future<dynamic> retrieveSeats(BuildContext context) async {
    ProgressDialog progress = ProgressDialog(context);
    progress.style(
      progressWidget: const CircularProgressIndicator(),
    );

    try {
      context.read<AuthProvider>().auth;
      progress.show();

      RetrievePnrCustomModel pnr = await customPnr();
      String formattedDate = DateFormat('yyyy-MM-dd').format(pnr.departureDate);
      final seats = await RetrieveSeatAvailabilityListApi.seatsAvailabilityList(
          pnr.logicalFlightID, formattedDate);

      progress.hide();

      return seats;
    } catch (error) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SeatProvider>(
      builder: (context, seatProvider, _) {
        List<SeatAssignmentModel> seatsAssignment =
            seatProvider.listSeatAssignment;
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.64,
          child: ListView.builder(
            itemCount: seatsAssignment.length,
            itemBuilder: (context, index) {
              return selectSeatCard(seatsAssignment[index]);
            },
          ),
        );
      },
    );
  }

  Container selectSeatCard(SeatAssignmentModel seatsAssignment) {
    CustomerModel customer = seatsAssignment.customer;
    SeatModel seat = seatsAssignment.seat;
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
              Row(
                children: [
                  Text(
                    "${customer.title}.",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "${customer.lastName} ${customer.firstName}",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Consumer<SeatProvider>(
                builder: (context, seatProvider, _) {
                  return Text(
                    seat.row != -1
                        ? '${seat.row}${seat.seat}'
                        : 'Chưa chọn ghế',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  );
                },
              ),
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
              Provider.of<SeatProvider>(context, listen: false)
                  .addCustomer(customer);
              dynamic seats = await retrieveSeats(context);
              // ignore: use_build_context_synchronously
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SeatsAirbus(
                    retrieveSeats: seats,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
