import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'misc.g.dart';

@HiveType(typeId: 14)
@JsonSerializable(fieldRename: FieldRename.snake)
class Misc {
  @HiveField(0)
  final String? productName;
  @HiveField(1)
  final String? selectedCategory;
  @HiveField(2)
  final String? selectedSubCategory;
  @HiveField(3)
  final String? manufacturer;
  @HiveField(4)
  final String? chasisNo;
  @HiveField(5)
  final String? assetType;
    @HiveField(6)
  final String? productCode;

  Misc(this.productName, this.selectedCategory, this.selectedSubCategory,
      this.manufacturer, this.chasisNo, this.assetType, this.productCode);
  factory Misc.fromJson(Map<String, dynamic> json) => _$MiscFromJson(json);
  Map<String, dynamic> toJson() => _$MiscToJson(this);
}
