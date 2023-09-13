import '../models/serializable.dart';

class StatusEntity implements Serializable {
  final int code;
  final String? statusTraceCode;

  const StatusEntity({required this.code, this.statusTraceCode});

  @override
  Map<String, Object?> toDocument() {
    return {'code': code, 'statusTraceCode': statusTraceCode};
  }

  static StatusEntity fromDocument(Map<String, dynamic> doc) {
    return StatusEntity(
      code: doc['code'] as int,
      statusTraceCode: doc['statusTraceCode'] as String?,
    );
  }

  @override
  String toString() {
    return '''StatsEntity: {
      code: $code
      statusTraceCode: $statusTraceCode
    }''';
  }
}
