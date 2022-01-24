import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'asset_name.g.dart';

@HiveType(typeId: 5)
@JsonSerializable(fieldRename: FieldRename.pascal)
class AssetName {
  @HiveField(0)
  @JsonKey(name: "id")
  final int? id;
  @HiveField(1)
  // ignore: non_constant_identifier_names
  final String? p_Code;
  @HiveField(2)
  final String? caption;
  @HiveField(3)
  final String? parentCode;
  @HiveField(4)
  final String? year;
  @HiveField(5)
  final String? createdBy;
  @HiveField(6)
  final String? updatedBy;
  @HiveField(7)
  final String? dateCreated;
  @HiveField(8)
  final String? lastUpdated;
  @HiveField(9)
  final String? client;
  @HiveField(10)
  final int? maxCount;

  AssetName(
      {this.id,
      this.dateCreated,
      // ignore: non_constant_identifier_names
      this.p_Code,
      this.caption,
      this.parentCode,
      this.year,
      this.createdBy,
      this.updatedBy,
      this.lastUpdated,
      this.client,
      this.maxCount});
  factory AssetName.fromJson(Map<String, dynamic> json) =>
      _$AssetNameFromJson(json);
  Map<String, dynamic> toJson() => _$AssetNameToJson(this);

  @override
  String toString() {
    return 'AssetName(id: $id, p_Code: $p_Code, caption: $caption, parentCode: $parentCode, year: $year, createdBy: $createdBy, updatedBy: $updatedBy, dateCreated: $dateCreated, lastUpdated: $lastUpdated, client: $client, maxCount: $maxCount)';
  }
}
