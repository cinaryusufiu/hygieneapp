import 'package:equatable/equatable.dart';
import 'package:network/network.dart';

class StatsEntity extends Equatable implements Serializable {
  final int? id;
  final int? totalUnreadNotificationCount;

  const StatsEntity({this.id, this.totalUnreadNotificationCount});

  @override
  Map<String, Object?> toDocument() {
    return {
      'id': id,
      'totalUnreadNotificationCount': totalUnreadNotificationCount
    };
  }

  static StatsEntity fromDocument(Map<String, dynamic> doc) {
    return StatsEntity(
      id: doc['id'] as int?,
      totalUnreadNotificationCount:
          doc['total_notification_unread_count'] as int?,
    );
  }

  @override
  List<Object?> get props => [id];

  @override
  String toString() {
    return '''StatsEntity: {
      id: $id
      totalUnreadNotificationCount: $totalUnreadNotificationCount
    }''';
  }
}
