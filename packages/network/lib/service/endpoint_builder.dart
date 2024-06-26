import '../http/content_type.dart';
import '../networking/network_environment.dart';
import '../service/endpoint.dart';
import '../http/body_encoding.dart';
import '../http/http_method.dart';

const environment = NetworkEnvironment.qa;

class EndpointBuilder implements Endpoint {
  @override
  late String path;

  @override
  late ContentType contentType;

  @override
  late BodyEncoding bodyEncoding;

  @override
  late HTTPMethod httpMethod;

  @override
  Map<String, dynamic>? parameters;

  ///ioRequest.headers.set(name, value,preserveHeaderCase:true);
  @override
  late Map<String, String> headers = {};

  String get queryParameters {
    if (httpMethod == HTTPMethod.get && parameters != null) {
      final jsonString = Uri(queryParameters: parameters);
      return '?${jsonString.query}';
    }
    return '';
  }
}
