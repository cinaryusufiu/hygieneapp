import 'package:equatable/equatable.dart';
import 'package:user_repository/entities/entities.dart';

class Settings extends Equatable {
  final int id;
  final String? language;

  const Settings({required this.id, this.language});

  /// Empty user which represents an unauthenticated user.
  static const empty = Settings(id: 0, language: '');

  /// Modify Settings parameters
  Settings copyWith({int? id, String? language}) {
    return Settings(id: id ?? this.id, language: language ?? this.language);
  }

  /// Convenience getter to determine whether the current settings is empty.
  bool get isEmpty => this == Settings.empty;

  /// Convenience getter to determine whether the current settings is not empty.
  bool get isNotEmpty => this != Settings.empty;

  SettingsEntity toEntity() {
    return SettingsEntity(
      id: id,
      language: language,
    );
  }

  static Settings fromEntity(SettingsEntity? entity) {
    if (entity == null) {
      return empty;
    }
    return Settings(
      id: entity.id,
      language: entity.language,
    );
  }

  @override
  List<Object?> get props => [id, language];

  @override
  String toString() {
    return '''Settings: {
      id: $id
      language: $language
    }''';
  }
}
