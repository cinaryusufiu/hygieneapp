import 'package:equatable/equatable.dart';
import 'package:network/network.dart';

class NotificationPermissionsEntity extends Equatable implements Serializable {
  final int id;
  final bool? isAllowEmail;
  final bool? isAllowSms;
  final bool? isAllowPush;
  final bool? isAllowAgreement;

  const NotificationPermissionsEntity(
      {required this.id,
      this.isAllowEmail,
      this.isAllowSms,
      this.isAllowPush,
      this.isAllowAgreement});

  @override
  Map<String, Object?> toDocument() {
    return {
      'id': id,
      'isAllowEmail': isAllowEmail,
      'isAllowSms': isAllowSms,
      'isAllowPush': isAllowPush,
      'isAllowAgreement': isAllowAgreement
    };
  }

  static NotificationPermissionsEntity fromDocument(Map<String, dynamic> doc) {
    return NotificationPermissionsEntity(
      id: doc['id'] as int,
      isAllowEmail: doc['allow_email_notification'] as bool?,
      isAllowSms: doc['allow_sms_notification'] as bool?,
      isAllowPush: doc['allow_push_notification'] as bool?,
      isAllowAgreement: doc['allow_agreement'] as bool?,
    );
  }

  @override
  List<Object?> get props => [id];

  @override
  String toString() {
    return '''NotificationPermissionsEntity: {
      id: $id
      isAllowEmail: $isAllowEmail
      isAllowSms: $isAllowSms
      isAllowPush: $isAllowPush
      isAllowAgreement: $isAllowAgreement
    }''';
  }
}
