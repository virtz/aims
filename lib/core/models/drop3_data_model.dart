import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'drop3_data_model.g.dart';

@HiveType(typeId: 13)
@JsonSerializable(fieldRename: FieldRename.pascal)
class Drop3DataModel {
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

  Drop3DataModel({this.id, this.caption, this.code, this.year, this.client});
  factory Drop3DataModel.fromJson(Map<String, dynamic> json) =>
      _$Drop3DataModelFromJson(json);
  Map<String, dynamic> toJson() => _$Drop3DataModelToJson(this);
}