

import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'drop2_data_model.g.dart';

@HiveType(typeId: 12)
@JsonSerializable(fieldRename: FieldRename.pascal)
class Drop2DataModel {
  @HiveField(0)
  @JsonKey(name:"ID")
  final int? id;
  @HiveField(1)
  final String? caption;
  @HiveField(2)
  final String? code;
  @HiveField(3)
  final String? year;
  @HiveField(4)
  final String? client;

  Drop2DataModel({this.id, this.caption, this.code, this.year, this.client});
  factory Drop2DataModel.fromJson(Map<String, dynamic> json) =>
      _$Drop2DataModelFromJson(json);
  Map<String, dynamic> toJson() => _$Drop2DataModelToJson(this);
}