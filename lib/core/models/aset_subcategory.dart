import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'aset_subcategory.g.dart';

@HiveType(typeId: 7)
@JsonSerializable(fieldRename: FieldRename.pascal)
class AssetSubCategory {
  @HiveField(0)
  @JsonKey(name: "id")
  final int? id;
  // ignore: non_constant_identifier_names
  @HiveField(1)
  // ignore: non_constant_identifier_names
  final String? p_Code;
  @HiveField(2)
  final String? caption;

  // ignore: non_constant_identifier_names
  @HiveField(3)
  // ignore: non_constant_identifier_names
  final String? cat_Code;
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

  AssetSubCategory(
      this.id,
      this.p_Code,
      this.caption,
      this.cat_Code,
      this.year,
      this.createdBy,
      this.updatedBy,
      this.dateCreated,
      this.lastUpdated,
      this.client);
  factory AssetSubCategory.fromJson(Map<String, dynamic> json) =>
      _$AssetSubCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$AssetSubCategoryToJson(this);
}
