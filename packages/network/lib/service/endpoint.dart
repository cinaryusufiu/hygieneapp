import 'package:network/http/body_encoding.dart';
import 'package:network/http/content_type.dart';
import 'package:network/http/http_method.dart';

abstract class Endpoint {
  late String path;
  late HTTPMethod httpMethod;
  late ContentType contentType;
  late BodyEncoding bodyEncoding;
  late Map<String, String> headers;
  Map<String, dynamic>? parameters;
}
