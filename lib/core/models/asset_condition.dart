import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'asset_condition.g.dart';

@HiveType(typeId: 8)
@JsonSerializable(fieldRename: FieldRename.pascal)
class AssetCondition {

  @HiveField(0)
  @JsonKey(name: "ID")
  final int? id;
  @HiveField(1)
  final String? condition;
  @HiveField(2)
  final int? position;

  AssetCondition(this.id, this.condition, this.position);

  factory AssetCondition.fromJson(Map<String, dynamic> json) =>
      _$AssetConditionFromJson(json);
  Map<String, dynamic> toJson() => _$AssetConditionToJson(this);
}
