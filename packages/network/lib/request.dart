import 'package:flutter/material.dart';

import 'http/http_request.dart';
import 'networking/network_exception.dart';
import 'service/endpoint_builder.dart';
import 'package:http/http.dart';
import 'dart:io';
import 'dart:convert';

abstract class RequestControllerImp {
  Future<dynamic> execute({required EndpointBuilder endpoint});
}

class RequestController implements RequestControllerImp {
  final _client = Client();

  @override
  Future execute({required EndpointBuilder endpoint}) async {
    BaseRequest request = HTTPRequest(endpoint);
    try {
      final response = await _client.send(request);
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        final data = await response.stream.transform(utf8.decoder).join();
        return jsonDecode(data.toString());
      } else {
        debugPrint(response.toString());
        returnException(response);
      }
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  dynamic returnException(StreamedResponse response) {
    switch (response.statusCode) {
      case 400:
        return BadRequestException(response.toString());
      case 401:
        return FetchDataException(
            'Error occurred while communication with server'
            ' with status code : ${response.statusCode}');
      case 403:
        return FetchDataException(
            'Error occurred while communication with server'
            ' with status code : ${response.statusCode}');
      case 404:
        return FetchDataException(
            'Error occurred while communication with server'
            ' with status code : ${response.statusCode}');
      case 500:
      default:
        return FetchDataException(
            'Error occurred while communication with server'
            ' with status code : ${response.statusCode}');
    }
  }
}
