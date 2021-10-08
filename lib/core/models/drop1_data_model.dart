import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'drop1_data_model.g.dart';

@HiveType(typeId: 11)
@JsonSerializable(fieldRename: FieldRename.pascal)
class Drop1DataModel {
  @HiveField(0)
  @JsonKey(name: "ID")
  final int? id;
  @HiveField(1)
  final String? caption;
  @HiveField(2)
  final String? code;
  @HiveField(3)
  final String? year;
  @HiveField(4)
  final String? client;

  Drop1DataModel({this.id, this.caption, this.code, this.year, this.client});
  factory Drop1DataModel.fromJson(Map<String, dynamic> json) =>
      _$Drop1DataModelFromJson(json);
  Map<String, dynamic> toJson() => _$Drop1DataModelToJson(this);

  @override
  String toString() {
    return 'Drop1DataModel(id: $id, caption: $caption, code: $code, year: $year, client: $client)';
  }
}
