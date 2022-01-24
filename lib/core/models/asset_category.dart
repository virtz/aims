import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'asset_category.g.dart';

@HiveType(typeId: 6)
@JsonSerializable(fieldRename: FieldRename.pascal)
class AssetCategory {
  @HiveField(0)
  @JsonKey(name: "ID")
  final int? id;
  @HiveField(1)
  final String? code;
  @HiveField(2)
  final String? caption;
  @HiveField(3)
  final String? year;
  @HiveField(4)
  final String? createdBy;
  @HiveField(5)
  final String? updatedBy;
  @HiveField(6)
  final String? dateCreated;
  @HiveField(7)
  final String? lastUpdated;
  @HiveField(8)
  final String? client;

  AssetCategory(
      {this.id,
      this.code,
      this.caption,
      this.year,
      this.createdBy,
      this.updatedBy,
      this.dateCreated,
      this.lastUpdated,
      this.client});

  factory AssetCategory.fromJson(Map<String, dynamic> json) =>
      _$AssetCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$AssetCategoryToJson(this);

  @override
  String toString() {
    return 'AssetCategory(id: $id, code: $code, caption: $caption, year: $year, createdBy: $createdBy, updatedBy: $updatedBy, dateCreated: $dateCreated, lastUpdated: $lastUpdated, client: $client)';
  }
}
