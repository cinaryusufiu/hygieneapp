import 'package:equatable/equatable.dart';
import 'package:network/network.dart';

class SettingsEntity extends Equatable implements Serializable {
  final int id;
  final String? language;

  const SettingsEntity({required this.id, this.language});

  @override
  Map<String, Object?> toDocument() {
    return {'id': id, 'language': language};
  }

  static SettingsEntity fromDocument(Map<String, dynamic> doc) {
    return SettingsEntity(
      id: doc['id'] as int,
      language: doc['language'] as String?,
    );
  }

  @override
  List<Object?> get props => [id];

  @override
  String toString() {
    return '''SettingsEntity: {
      id: $id
      language: $language
    }''';
  }
}
