import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'asset_type.g.dart';

@HiveType(typeId: 4)
@JsonSerializable(fieldRename: FieldRename.pascal)
class AssetType {
  @HiveField(0)
  @JsonKey(name: "id")
  final int? id;
  @HiveField(1)
  // ignore: non_constant_identifier_names
  final String? p_Code;
  @HiveField(2)
  final String? caption;
  @HiveField(3)
  // ignore: non_constant_identifier_names
  final String? subCat_Code;
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

  AssetType(
      {this.id,
      this.p_Code,
      this.caption,
      this.subCat_Code,
      this.year,
      this.createdBy,
      this.updatedBy,
      this.dateCreated,
      this.lastUpdated,
      this.client});
  factory AssetType.fromJson(Map<String, dynamic> json) =>
      _$AssetTypeFromJson(json);
  Map<String, dynamic> toJson() => _$AssetTypeToJson(this);

  @override
  String toString() {
    return 'AssetType(id: $id, p_Code: $p_Code, caption: $caption, subCat_Code: $subCat_Code, year: $year, createdBy: $createdBy, updatedBy: $updatedBy, dateCreated: $dateCreated, lastUpdated: $lastUpdated, client: $client)';
  }
}
