import 'package:flutter_check_in_app/state/services/http/http_endpoints.dart';

import '../http/dio_services.dart';

class SavePnrApi {
  static String endpoint = Endpoints.savePnrEndpoint;

  static Future<int> savePnr(String confirmationNumber) async {
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
    print("############## savePnr ##################");
    print(confirmationNumber);
    print(body['exceptions'][0].toString());
    return body['exceptions'][0]['exceptionCode'];
  }
}
