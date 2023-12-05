import 'package:equatable/equatable.dart';
import '../entities/entities.dart';

class Stats extends Equatable {
  final int? id;
  final int? totalUnreadNotificationCount;

  const Stats({this.id, this.totalUnreadNotificationCount});

  /// Empty user which represents an Stats.
  static const empty = Stats(id: 0, totalUnreadNotificationCount: 0);

  /// Modify Stats parameters
  Stats copyWith({int? id, int? totalUnreadNotificationCount}) {
    return Stats(
        id: id ?? this.id,
        totalUnreadNotificationCount:
            totalUnreadNotificationCount ?? this.totalUnreadNotificationCount);
  }

  /// Convenience getter to determine whether the current Stats is empty.
  bool get isEmpty => this == Stats.empty;

  /// Convenience getter to determine whether the current Stats is not empty.
  bool get isNotEmpty => this != Stats.empty;

  StatsEntity toEntity() {
    return StatsEntity(
      id: id,
      totalUnreadNotificationCount: totalUnreadNotificationCount,
    );
  }

  static Stats fromEntity(StatsEntity? entity) {
    if (entity == null) {
      return empty;
    }

    return Stats(
      id: entity.id,
      totalUnreadNotificationCount: entity.totalUnreadNotificationCount,
    );
  }

  @override
  List<Object?> get props => [id];

  @override
  String toString() {
    return '''Stats: {
      id: $id
      totalUnreadNotificationCount: $totalUnreadNotificationCount
    }''';
  }
}
