import 'package:network/network.dart';
import 'package:user_repository/models/models.dart';

abstract class _UserEndpointImp {
  EndpointBuilder signIn(String email, String password);

  EndpointBuilder logOut();

  EndpointBuilder signUp(User myUser, String password);

  EndpointBuilder resetPassword(String email);

  EndpointBuilder setUserData(User user);

  EndpointBuilder getMyUser(String myUserId);

  EndpointBuilder uploadPicture(String file, String userId);
}

class UserEndpoint implements _UserEndpointImp {
  @override
  EndpointBuilder signIn(String email, String password) {
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
  EndpointBuilder getMyUser(String myUserId) {
    // TODO: implement getMyUser
    throw UnimplementedError();
  }

  @override
  EndpointBuilder logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
  EndpointBuilder resetPassword(String email) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  EndpointBuilder setUserData(User user) {
    // TODO: implement setUserData
    throw UnimplementedError();
  }

  @override
  EndpointBuilder signUp(User myUser, String password) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  EndpointBuilder uploadPicture(String file, String userId) {
    // TODO: implement uploadPicture
    throw UnimplementedError();
  }
}
