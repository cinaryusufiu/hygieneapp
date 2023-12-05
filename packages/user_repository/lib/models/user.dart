import 'dart:core';
import 'package:equatable/equatable.dart';
import 'package:user_repository/entities/entities.dart';
import 'package:user_repository/models/models.dart';

enum UserType { none, running, stopped, paused }

enum UserStatus { first, second, thhird }

class User extends Equatable {
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
  final UserStatus? status;
  final UserType? statusType;
  final Settings? settings;
  final Stats? stats;
  final NotificationPermissions? notificationPermissionsEntity;

  const User({
    this.id,
    this.username,
    this.email,
    this.nameSurname,
    this.countryCode,
    this.phoneNumber,
    this.image,
    this.address,
    this.companyName,
    this.settings,
    this.notificationPermissionsEntity,
    this.test,
    this.guest,
    this.isVerified,
    this.isVerifiedEmail,
    this.isVerifiedPhoneNumber,
    this.statusType,
    this.status,
    this.stats,
  });

  /// Empty user which represents an unauthenticated user.
  static const empty = User(id: 0);

  /// Modify MyUser parameters
  User copyWith({
    int? id,
    String? username,
    String? email,
    String? nameSurname,
    String? countryCode,
    String? phoneNumber,
    String? image,
    String? address,
    String? companyName,
    Settings? settings,
    NotificationPermissions? notificationPermissionsEntity,
    bool? test,
    bool? guest,
    bool? isVerified,
    bool? isVerifiedEmail,
    bool? isVerifiedPhoneNumber,
    UserType? statusType,
    UserStatus? status,
    Stats? stats,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      nameSurname: nameSurname ?? this.nameSurname,
      countryCode: countryCode ?? this.countryCode,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      image: image ?? this.image,
      address: address ?? this.address,
      companyName: companyName ?? this.companyName,
      settings: settings ?? this.settings,
      notificationPermissionsEntity:
          notificationPermissionsEntity ?? this.notificationPermissionsEntity,
      test: test ?? this.test,
      guest: guest ?? this.guest,
      isVerified: isVerified ?? this.isVerified,
      isVerifiedEmail: isVerifiedEmail ?? this.isVerifiedEmail,
      isVerifiedPhoneNumber:
          isVerifiedPhoneNumber ?? this.isVerifiedPhoneNumber,
      statusType: statusType ?? this.statusType,
      status: status ?? this.status,
      stats: stats ?? this.stats,
    );
  }

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == User.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != User.empty;

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      username: username,
      email: email,
      nameSurname: nameSurname,
      countryCode: countryCode,
      phoneNumber: phoneNumber,
      image: image,
      address: address,
      companyName: companyName,
      settingsEntity: settings?.toEntity(),
      notificationPermissionsEntity: notificationPermissionsEntity?.toEntity(),
      test: test,
      guest: guest,
      isVerified: isVerified,
      isVerifiedEmail: isVerifiedEmail,
      isVerifiedPhoneNumber: isVerifiedPhoneNumber,
      statusTypeEntity: UserTypeEntity.values[statusType?.index ?? 0],
      statusEntity: UserStatusEntity.values[status?.index ?? 0],
      statsEntity: stats?.toEntity(),
    );
  }

  static User fromEntity(UserEntity entity) {
    return User(
        id: entity.id,
        username: entity.username,
        email: entity.email,
        nameSurname: entity.nameSurname,
        countryCode: entity.countryCode,
        phoneNumber: entity.phoneNumber,
        image: entity.image,
        address: entity.address,
        companyName: entity.companyName,
        settings: Settings.fromEntity(entity.settingsEntity),
        notificationPermissionsEntity: NotificationPermissions.fromEntity(
            entity.notificationPermissionsEntity),
        test: entity.test,
        guest: entity.guest,
        isVerified: entity.isVerified,
        isVerifiedEmail: entity.isVerifiedEmail,
        isVerifiedPhoneNumber: entity.isVerifiedPhoneNumber,
        statusType: UserType.values[entity.statusTypeEntity?.index ?? 0],
        status: UserStatus.values[entity.statusEntity?.index ?? 0],
        stats: Stats.fromEntity(entity.statsEntity));
  }

  @override
  List<Object?> get props => [id];

  @override
  String toString() {
    return '''User: {
      id: $id
      userName: $username
      email: $email
      nameSurname: $nameSurname
      countryCode: $countryCode
      phoneNumber: $phoneNumber
      image: $image
      address: $address
      companyName: $companyName
      settings: $settings
      notificationPermissionsEntity: $notificationPermissionsEntity
      test: $test
      guest: $guest
      isVerified: $isVerified
      isVerifiedEmail: $isVerifiedEmail
      isVerifiedPhoneNumber: $isVerifiedPhoneNumber
      type: $statusType
      status: $status
      stats: $stats
    }''';
  }
}
