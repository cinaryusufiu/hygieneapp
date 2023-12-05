import 'package:equatable/equatable.dart';
import '../entities/entities.dart';

class NotificationPermissions extends Equatable {
  final int id;
  final bool? isAllowEmail;
  final bool? isAllowSms;
  final bool? isAllowPush;
  final bool? isAllowAgreement;

  const NotificationPermissions(
      {required this.id,
      this.isAllowEmail,
      this.isAllowSms,
      this.isAllowPush,
      this.isAllowAgreement});

  /// Empty user which represents an NotificationPermissions.
  static const empty = NotificationPermissions(
      id: 0,
      isAllowEmail: false,
      isAllowSms: false,
      isAllowPush: false,
      isAllowAgreement: false);

  /// Modify NotificationPermissions parameters
  NotificationPermissions copyWith({
    int? id,
    bool? isAllowEmail,
    bool? isAllowSms,
    bool? isAllowPush,
    bool? isAllowAgreement,
  }) {
    return NotificationPermissions(
      id: id ?? this.id,
      isAllowEmail: isAllowEmail ?? this.isAllowEmail,
      isAllowSms: isAllowSms ?? this.isAllowSms,
      isAllowPush: isAllowPush ?? this.isAllowPush,
      isAllowAgreement: isAllowAgreement ?? this.isAllowAgreement,
    );
  }

  /// Convenience getter to determine whether the current NotificationPermissions is empty.
  bool get isEmpty => this == NotificationPermissions.empty;

  /// Convenience getter to determine whether the current NotificationPermissions is not empty.
  bool get isNotEmpty => this != NotificationPermissions.empty;

  NotificationPermissionsEntity toEntity() {
    return NotificationPermissionsEntity(
      id: id,
      isAllowEmail: isAllowEmail,
      isAllowSms: isAllowSms,
      isAllowPush: isAllowPush,
      isAllowAgreement: isAllowAgreement,
    );
  }

  static NotificationPermissions fromEntity(
      NotificationPermissionsEntity? entity) {
    if (entity == null) {
      return empty;
    }
    return NotificationPermissions(
      id: entity.id,
      isAllowEmail: entity.isAllowEmail,
      isAllowSms: entity.isAllowSms,
      isAllowPush: entity.isAllowPush,
      isAllowAgreement: entity.isAllowAgreement,
    );
  }

  @override
  List<Object?> get props => [id];

  @override
  String toString() {
    return '''NotificationPermissions: {
      id: $id
      isAllowEmail: $isAllowEmail
      isAllowSms: $isAllowSms
      isAllowPush: $isAllowPush
      isAllowAgreement: $isAllowAgreement
    }''';
  }
}
