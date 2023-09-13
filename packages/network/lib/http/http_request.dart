import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart';
import 'package:network/Constants/constants.dart';
import 'package:network/http/body_encoding.dart';

import '../networking/network_environment.dart';
import '../service/endpoint_builder.dart';

class HTTPRequest extends Request {
  final EndpointBuilder service;

  HTTPRequest(this.service)
      : super(service.httpMethod.value, Uri.parse(service.path));

  @override
  String get body {
    switch (service.bodyEncoding) {
      case BodyEncoding.json:
        return json.encode(service.parameters);
      case BodyEncoding.body:
        return service.parameters.toString();
      default:
        return "";
    }
  }

  @override
  Map<String, String> get headers {
    var values = {"Content-Type": service.contentType.value};

    values.addAll(service.headers);
    return values;
  }

  @override
  Uint8List get bodyBytes {
    if (service.parameters == null) {
      return Uint8List(0);
    }
    if (service.bodyEncoding == BodyEncoding.body) {
      final queryParameters = Uri(queryParameters: service.parameters);
      List<int> bodyBytes = utf8.encode(queryParameters.query);
      return Uint8List.fromList(bodyBytes);
    } else {
      final encodedBody = const Utf8Codec().encode(body);
      return Uint8List.fromList(encodedBody);
    }
  }

  @override
  Uri get url {
    if (service.bodyEncoding == BodyEncoding.url) {
      return Uri.parse(
          '${_baseUrl()}/${service.path}${service.queryParameters}');
    }
    return Uri.parse('${_baseUrl()}/${service.path}');
  }

  String _baseUrl() {
    switch (environment) {
      case NetworkEnvironment.production:
        return apiProdBaseURL;
      case NetworkEnvironment.qa:
        return apiQABaseURL;
    }
  }
}
