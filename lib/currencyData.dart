import 'dart:convert';

import 'package:http/http.dart';

class GetCurrency {
  Future getData() async {
    var url = Uri.parse(
        'https://api.fastforex.io/fetch-one?from=CAD&to=INR&api_key=764b7e1fe2-dc9a45eb29-r5n4np');
    Response response = await get(url);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      double inrvalue = decodedData['result']['INR'];
      return inrvalue;
    } else {
      print(response.statusCode);
      throw ('There was a problem reacher the API');
    }
  }
}

class ConvertBrain {
  Future<double> getAnswer(int cadval) async {
    double realinr = await GetCurrency().getData();
    double inrval = cadval * realinr;
    print(inrval);
    return inrval;
  }
}
