//import 'package:flutter_check_in_app/state/services/apis/data_seat.dart';
import 'package:flutter_check_in_app/state/services/http/http_endpoints.dart';

import '../http/dio_services.dart';
//import 'data_seat.dart';

class RetrieveSeatAvailabilityListApi {
  static String endpoint = Endpoints.retrieveSeatAvailabilityList;

  static Future<dynamic> seatsAvailabilityList(
      int logicalFlightID, String departureDate) async {
    final String url = endpoint;
    final data = {
      "carrierCodes": [
        {"accessibleCarrierCode": "VU"}
      ],
      "clientIPAddress": "127.0.0.1",
      "logicalFlightID": logicalFlightID,
      "departureDate": departureDate,
      "cabinName": "",
      "currency": "VND",
      "utcOffset": 1,
      "fareBasisCode": "",
      "excludePricing": true
    };
    final res = await DioClient.post(url, data, haveToken: true);
    final body = res.data;
    //final body = seatData;

    return body;
  }
}
