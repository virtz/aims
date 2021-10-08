import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'site_status.g.dart';

@HiveType(typeId: 10)
@JsonSerializable(fieldRename: FieldRename.pascal)
class Status {
  @HiveField(0)
  // ignore: non_constant_identifier_names
  final int? ID;
  @HiveField(1)
  final String? issue;
  @HiveField(2)
  final String? client;

  Status(this.ID, this.issue, this.client);

   factory Status.fromJson(Map<String, dynamic> json) =>
      _$StatusFromJson(json);
  Map<String, dynamic> toJson() => _$StatusToJson(this);
}
