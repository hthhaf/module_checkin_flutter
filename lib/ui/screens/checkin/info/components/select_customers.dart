import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_check_in_app/state/models/customer_model.dart';
import 'package:multiselect_scope/multiselect_scope.dart';

import '../../../../../state/services/local/shared_preferences.dart';
import '../../../../../state/services/local/shared_references_key.dart';
import '../../../../../ulitites/Colors.dart';
import '../../security_questions/security_questions_screen.dart';

class SelectCustomers extends StatefulWidget {
  const SelectCustomers({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SelectCustomersState createState() => _SelectCustomersState();
}

class _SelectCustomersState extends State<SelectCustomers> {
  Future<List<CustomerModel>> customCustomers() async {
    final pnr = await SharedRServices().getString(SharedPnr.pnr);

    final decodedPnr = json.decode(pnr);

    final logicalFlight = decodedPnr['airlines'][0]['logicalFlight'][0];

    final physicalFlights = logicalFlight['physicalFlights'][0];

    final customers = physicalFlights['customers'];
    List<CustomerModel> customersList = [];

    customers.forEach((value) {
      customersList.add(CustomerModel.fromJson(value));
    });
    return customersList;
  }

  late MultiselectController _multiselectController;
  late Future<List<CustomerModel>> _customerData;
  bool isAnyCustomerSelected = false;
  List<CustomerModel> selectedCustomers = [];

  void saveSelectedCustomers(List<CustomerModel> newSelectedCustomers) {
    final List<dynamic> customerListJson =
        newSelectedCustomers.map((customer) => customer.toJson()).toList();

    final String customerListJsonString = json.encode(customerListJson);
    SharedRServices().setString(
      SharedSelectedCustomers.selectedCustomers,
      customerListJsonString,
    );
  }

  @override
  void initState() {
    super.initState();
    _multiselectController = MultiselectController();
    _customerData = customCustomers();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CustomerModel>>(
      future: _customerData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return MultiselectScope<CustomerModel>(
            controller: _multiselectController,
            dataSource: snapshot.data ?? [],
            clearSelectionOnPop: true,
            keepSelectedItemsBetweenUpdates: true,
            onSelectionChanged: (indexes, items) {
              setState(() {
                isAnyCustomerSelected = indexes.isNotEmpty;
              });
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 600,
                  height: 330,
                  child: ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      final controller = MultiselectScope.controllerOf(context);
                      final itemIsSelected = controller.isSelected(index);
                      return InkWell(
                        onTap: () {
                          controller.select(index);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 0,
                            vertical: 8,
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12.withOpacity(0.1),
                                  offset: const Offset(1, 1),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                ),
                              ],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              color: itemIsSelected
                                  ? Theme.of(context).primaryColor
                                  : white,
                            ),
                            child: Text(
                              "${snapshot.data![index].title} ${snapshot.data![index].lastName} ${snapshot.data![index].firstName}",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const Spacer(),
                Align(
                  child: ElevatedButton(
                    onPressed: isAnyCustomerSelected
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const SecurityQuestionsScreen();
                                },
                              ),
                            );
                            final List<CustomerModel> newSelectedCustomers =
                                snapshot.data!
                                    .where((customer) =>
                                        _multiselectController.isSelected(
                                            snapshot.data!.indexOf(customer)))
                                    .toList();

                            saveSelectedCustomers(newSelectedCustomers);
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 120, vertical: 12),
                        backgroundColor: priBlue,
                        shape: const StadiumBorder() // Background color
                        ),
                    child: const Text(
                      "TIẾP TỤC",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
