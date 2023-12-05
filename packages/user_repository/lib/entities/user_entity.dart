import 'package:equatable/equatable.dart';
import 'package:user_repository/entities/entities.dart';
import 'package:network/network.dart';

enum UserTypeEntity { none, running, stopped, paused }

enum UserStatusEntity { first, second, thhird }

class UserEntity extends Equatable implements Serializable {
  final int? id;
  final String? username;
  final String? email;
  final String? nameSurname;
  final String? countryCode;
  final String? phoneNumber;
  final String? image;
  final String? address;
  final String? companyName;
  final bool? test;
  final bool? guest;
  final bool? isVerified;
  final bool? isVerifiedEmail;
  final bool? isVerifiedPhoneNumber;
  final UserStatusEntity? statusEntity;
  final UserTypeEntity? statusTypeEntity;
  final SettingsEntity? settingsEntity;
  final StatsEntity? statsEntity;
  final NotificationPermissionsEntity? notificationPermissionsEntity;

  const UserEntity({
    this.id,
    this.username,
    this.email,
    this.nameSurname,
    this.countryCode,
    this.phoneNumber,
    this.image,
    this.address,
    this.companyName,
    this.settingsEntity,
    this.notificationPermissionsEntity,
    this.test,
    this.guest,
    this.isVerified,
    this.isVerifiedEmail,
    this.isVerifiedPhoneNumber,
    this.statusTypeEntity,
    this.statusEntity,
    this.statsEntity,
  });

  @override
  Map<String, Object?> toDocument() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'nameSurname': nameSurname,
      'countryCode': countryCode,
      'phoneNumber': phoneNumber,
      'image': image,
      'address': address,
      'companyName': companyName,
      'settings': settingsEntity,
      'notificationPermissionsEntity': notificationPermissionsEntity,
      'test': test,
      'guest': guest,
      'isVerified': isVerified,
      'isVerifiedEmail': isVerifiedEmail,
      'isVerifiedPhoneNumber': isVerifiedPhoneNumber,
      'type': statusTypeEntity,
      'status': statusEntity,
      'stats': statsEntity,
    };
  }

  static UserEntity fromDocument(Map<String, dynamic> doc) {
    return UserEntity(
      id: doc['id'] as int?,
      username: doc['username'] as String?,
      email: doc['email'] as String?,
      nameSurname: doc['name_surname'] as String?,
      countryCode: doc['country_code'] as String?,
      phoneNumber: doc['phone_number'] as String?,
      image: doc['image'] as String?,
      address: doc['address'] as String?,
      companyName: doc['company_name'] as String?,
      settingsEntity: SettingsEntity.fromDocument(doc['settings']),
      notificationPermissionsEntity: NotificationPermissionsEntity.fromDocument(
          doc['notification_permissions']),
      test: doc['test'] as bool?,
      guest: doc['guest'] as bool?,
      isVerified: doc['verified'] as bool?,
      isVerifiedEmail: doc['verified_email'] as bool?,
      isVerifiedPhoneNumber: doc['verified_phone_number'] as bool?,
      statusTypeEntity: UserTypeEntity.values[doc['user_type'] ?? 0],
      statusEntity: UserStatusEntity.values[doc['status'] ?? 0],
      statsEntity: StatsEntity.fromDocument(doc['stats']),
    );
  }

  @override
  List<Object?> get props => [id];

  @override
  String toString() {
    return '''UserEntity: {
      id: $id
      userName: $username
      email: $email
      nameSurname: $nameSurname
      countryCode: $countryCode
      phoneNumber: $phoneNumber
      image: $image
      address: $address
      companyName: $companyName
      settings: $settingsEntity
      notificationPermissionsEntity: $notificationPermissionsEntity
      test: $test
      guest: $guest
      isVerified: $isVerified
      isVerifiedEmail: $isVerifiedEmail
      isVerifiedPhoneNumber: $isVerifiedPhoneNumber
      type: $statusTypeEntity
      status: $statusEntity
      stats: $statsEntity
    }''';
  }
}
