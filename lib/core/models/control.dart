import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'control.g.dart';

@HiveType(typeId: 3)
@JsonSerializable(fieldRename: FieldRename.pascal)
class Control {
  @HiveField(0)
  final String? client;
  @HiveField(1)
  final String? systemName;
  @HiveField(2)
  final String? userDefinedName;
  @HiveField(3)
  final String? status;
  @HiveField(4)
  final String? dataType;

  Control({
    this.client,
    this.systemName,
    this.userDefinedName,
    this.status,
    this.dataType,
  });

  factory Control.fromJson(Map<String, dynamic> json) =>
      _$ControlFromJson(json);
  Map<String, dynamic> toJson() => _$ControlToJson(this);
}
