import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@HiveType(typeId: 1)
@JsonSerializable(fieldRename: FieldRename.pascal)
class LocationModel {
  @HiveField(0)
  // ignore: non_constant_identifier_names
  final int? ID;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? address;
  @HiveField(3)
  final String? year;
  @HiveField(4)
  final String? client;
  @HiveField(5)
  // ignore: non_constant_identifier_names
  final String? LGA;
  @HiveField(6)
  final String? agent;
  @HiveField(7)
  final String? latitude;
  @HiveField(8)
  final String? longitude;
  @HiveField(9)
  // ignore: non_constant_identifier_names
  final String? FSEName;
  @HiveField(10)
  // ignore: non_constant_identifier_names
  final String? FSENumber;
  @HiveField(11)
  final String? storeKeeper;

  LocationModel(
      this.ID,
      this.name,
      this.address,
      this.year,
      this.client,
      this.LGA,
      this.agent,
      this.latitude,
      this.longitude,
      this.FSEName,
      this.FSENumber,
      this.storeKeeper);

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}
