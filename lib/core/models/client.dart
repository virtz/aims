import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'client.g.dart';

@HiveType(typeId: 0)
@JsonSerializable(fieldRename: FieldRename.pascal)
class ClientModel {
  @HiveField(0)
  @JsonKey(name:"ClientID")
  final int? clientId;
    @HiveField(1)
  final String? clientName;
    @HiveField(2)
  final String? clientCode;
    @HiveField(3)
  final String? status;
 

 
  factory ClientModel.fromJson(Map<String, dynamic> json) =>
      _$ClientModelFromJson(json);

  ClientModel(this.clientId, this.clientName, this.clientCode, this.status);
  Map<String, dynamic> toJson() => _$ClientModelToJson(this);
}
