import 'dart:convert';
import 'package:aims/core/models/error_model.dart';
import 'package:aims/core/models/success._model.dart';
import 'package:http/http.dart' as http;

handleResponse(http.Response response) {
  try {
    print(
        'ResponseCode:: ${response.statusCode},   ResponseBody:: ${response.body}');

    final int code = response.statusCode;
    final dynamic body = json.decode(response.body);
    if (code == 200 || code == 201) {
      return SuccessModel(body);
    }

    return ErrorModel(body['error']);
  } catch (ex) {
    print(ex.toString());
    return ErrorModel('Request failed');
  }
}
