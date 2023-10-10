import 'dart:convert';

import 'package:flutter_check_in_app/state/services/http/http_endpoints.dart';
import 'package:flutter_check_in_app/state/services/local/shared_references_key.dart';

import '../http/dio_services.dart';
import '../local/shared_preferences.dart';

class RetrievePnrApi {
  static String endpoint = Endpoints.retrievePnrEndpoint;

  static Future<void> retrievePNR({
    required String confirmationNumber,
    required String lastname,
  }) async {
    final String url = endpoint;
    final data = {
      "carrierCodes": [
        {"accessibleCarrierCode": "VU"}
      ],
      "clientIPAddress": "127.0.0.1",
      "reservationInfo": {
        "seriesNumber": "299",
        "confirmationNumber": confirmationNumber,
      }
    };
    final res = await DioClient.post(url, data, haveToken: true);
    final body = res.data;

    //final body = jsondata;
    final bodyJson = json.encode(body);
    SharedRServices().setString(SharedPnr.pnr, bodyJson);
  }
}
