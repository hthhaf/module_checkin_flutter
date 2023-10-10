import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../../state/services/local/shared_preferences.dart';
import '../../../../../state/services/local/shared_references_key.dart';
import '../../../../../ulitites/Colors.dart';

class SelectPassenger extends StatelessWidget {
  const SelectPassenger({super.key});

  @override
  Widget build(BuildContext context) {
    return const DropdownButtonExample();
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  List<dynamic> customers = [];
  @override
  void initState() {
    super.initState();
    fetchCustomers();
  }

  Future<List<dynamic>> getCustomers() async {
    final customers = await SharedRServices()
        .getString(SharedSelectedCustomers.selectedCustomers);
    final decodeCustomers = json.decode(customers);

    List<dynamic> customersList = [];

    decodeCustomers.forEach((value) {
      customersList.add(value);
    });
    return customersList;
  }

  Future<void> fetchCustomers() async {
    final customersData = await getCustomers();
    setState(() {
      customers = customersData;
    });
  }

  String getName(Map<String, dynamic> json) {
    return (json['lastName'] + ' ' + json['firstName']);
  }

  @override
  Widget build(BuildContext context) {
    String dropdownValue = customers.isNotEmpty ? getName(customers[0]) : '';
    return DropdownButton<dynamic>(
      value: dropdownValue,
      elevation: 3,
      icon: const Icon(
        Icons.arrow_drop_down,
        color: yellow,
      ),
      selectedItemBuilder: (BuildContext context) {
        return customers.map<Widget>((dynamic item) {
          return Row(
            children: [
              Text(
                getName(item),
                style: const TextStyle(
                  color: white,
                ),
              ),
            ],
          );
        }).toList();
      },
      onChanged: (dynamic value) {
        if (value != null) {
          setState(() {
            dropdownValue = value;
          });
        }
      },
      items: customers.map<DropdownMenuItem<dynamic>>((dynamic value) {
        return DropdownMenuItem<dynamic>(
          value: getName(value),
          child: Text(
            getName(value),
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        );
      }).toList(),
    );
  }
}
