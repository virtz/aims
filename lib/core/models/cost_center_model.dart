import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cost_center_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable(fieldRename: FieldRename.pascal)
class ConstCenter {
  @HiveField(0)
  @JsonKey(name:"ID")
  final int? id;
  @HiveField(1)
  final String? description;
  @HiveField(2)
  final String? code;
  @HiveField(3)
  final String? year;
  @HiveField(4)
  final String? client;

  ConstCenter({this.id, this.description, this.code, this.year, this.client});
  factory ConstCenter.fromJson(Map<String, dynamic> json) =>
      _$ConstCenterFromJson(json);
  Map<String, dynamic> toJson() => _$ConstCenterToJson(this);
}
