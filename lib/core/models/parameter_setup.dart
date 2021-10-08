import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'parameter_setup.g.dart';
@HiveType(typeId: 2)
@JsonSerializable(fieldRename: FieldRename.pascal)
class ParameterSetUp {
  @HiveField(0)
  final String? client;
  @HiveField(1)
  final int? assetLevelCount;
  @HiveField(2)
  final String? year;
  @HiveField(3)
  final String? assetLevel1Name;
  @HiveField(4)
  final String? assetLevel2Name;
  @HiveField(5)
  final String? assetLevel3Name;
  @HiveField(6)
  final String? assetLevel4Name;
  @HiveField(7)
  final String? manufacturer;
  @HiveField(8)
  final String? serialNo;
  @HiveField(9)
  final String? chasisNo;
  @HiveField(10)
  final String? engineN0;
  @HiveField(11)
  final String? captureMode;

  ParameterSetUp(
      this.client,
      this.assetLevelCount,
      this.year,
      this.assetLevel1Name,
      this.assetLevel2Name,
      this.assetLevel3Name,
      this.assetLevel4Name,
      this.manufacturer,
      this.serialNo,
      this.chasisNo,
      this.engineN0,
      this.captureMode);

  factory ParameterSetUp.fromJson(Map<String, dynamic> json) =>
      _$ParameterSetUpFromJson(json);
  Map<String, dynamic> toJson() => _$ParameterSetUpToJson(this);
}
