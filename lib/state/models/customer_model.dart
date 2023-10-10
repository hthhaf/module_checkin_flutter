class CustomerModel {
  String customerKey,
      airLinePersonKey,
      seatAssignmentKey,
      firstName,
      lastName,
      //gender,
      title;
  //address,
  //city,
  //country;
  DateTime dob;

  CustomerModel({
    required this.customerKey,
    required this.airLinePersonKey,
    required this.seatAssignmentKey,
    required this.firstName,
    required this.lastName,
    //required this.gender,
    required this.title,
    //required this.address,
    //required this.city,
    //required this.country,
    required this.dob,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      customerKey: json['key'],
      airLinePersonKey: json['airlinePersons'][0]['key'],
      seatAssignmentKey: json['airlinePersons'][0]['seatAssignments'][0]['key'],
      firstName: json['airlinePersons'][0]['firstName'],
      lastName: json['airlinePersons'][0]['lastName'],
      //gender: json['airlinePersons'][0]['gender'],
      title: json['airlinePersons'][0]['title'],
      // address: json['airlinePersons'][0]['address'],
      //city: json['airlinePersons'][0]['city'],
      //country: json['airlinePersons'][0]['country'],
      dob: DateTime.parse(json['airlinePersons'][0]['dob']),
    );
  }

  factory CustomerModel.jsontoModel(dynamic json) {
    return CustomerModel(
      customerKey: json['customerKey'],
      airLinePersonKey: json['airLinePersonKey'],
      seatAssignmentKey: json['seatAssignmentKey'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      //gender: json['airlinePersons'],
      title: json['title'],
      // address: json['airlinePersons'],
      //city: json['airlinePersons'],
      //country: json['airlinePersons'][,
      dob: DateTime.parse(json['dob']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'customerKey': customerKey,
      'airLinePersonKey': airLinePersonKey,
      'seatAssignmentKey': seatAssignmentKey,
      'firstName': firstName,
      'lastName': lastName,
      //'gender': gender,
      'title': title,
      //'address': address,
      //'city': city,
      //'country': country,
      'dob': dob.toIso8601String(),
    };
  }

  // @override
  // bool operator ==(Object other) {
  //   if (identical(this, other)) return true;

  //   return other is CustomerModel && other.customerKey == customerKey && other.airLinePersonKey == airLinePersonKey &&
  //   other.seatAssignmentKey == seatAssignmentKey && other.firstName == firstName && other.lastName == lastName &&
  //   other.title == title &&
  //   other.dob == dob;
  // }

  // @override
  // int get hashCode => customerKey.hashCode ^ customerKey.hashCode;
}
