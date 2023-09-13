import '../entity/status_entity.dart';
import 'serializable.dart';

class ResponseModel<T extends Serializable> extends Serializable {
  late T? data;
  late StatusEntity? status;

  ResponseModel({this.status, this.data});

  factory ResponseModel.fromJson(
      Map<String, dynamic> json, Function(Map<String, dynamic>) create) {
    return ResponseModel<T>(
      status: StatusEntity.fromDocument(json["status"]),
      data: create(json["data"]),
    );
  }

  @override
  Map<String, dynamic> toDocument() => {
        "status": this.status?.toDocument(),
        "data": this.data?.toDocument(),
      };
}
