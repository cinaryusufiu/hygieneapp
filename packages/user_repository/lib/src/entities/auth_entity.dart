import 'package:equatable/equatable.dart';
import 'package:network/network.dart';
import 'package:user_repository/src/entities/entities.dart';

class AuthEntity extends Equatable implements Serializable {
  final String? token;
  final UserEntity? userEntity;

  const AuthEntity({required this.token, this.userEntity});

  @override
  Map<String, Object?> toDocument() {
    return {
      'id': token,
      'user': userEntity?.toDocument(),
    };
  }

  static AuthEntity fromDocument(Map<String, dynamic> doc) {
    return AuthEntity(
        token: doc['token'] as String?,
        userEntity: UserEntity.fromDocument(doc['user_info']));
  }

  @override
  List<Object?> get props => [token];

  @override
  String toString() {
    return '''UserEntity: {
      token: $token
      user_info: $userEntity
    }''';
  }
}
