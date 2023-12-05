import 'package:network/network.dart';

abstract class _AuthenticationEndpointImp {
  EndpointBuilder logIn(String email, String password);

  EndpointBuilder logOut();
}

class AuthenticationEndpoint implements _AuthenticationEndpointImp {
  @override
  EndpointBuilder logIn(String email, String password) {
    var request = EndpointBuilder();
    request.path = "account/login/";
    request.bodyEncoding = BodyEncoding.json;
    request.contentType = ContentType.json;
    request.httpMethod = HTTPMethod.post;
    request.parameters = {
      'email': email,
      'password': password,
    };
    return request;
  }

  @override
  EndpointBuilder logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }
}
