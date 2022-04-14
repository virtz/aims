import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'captured_data.g.dart';

@HiveType(typeId: 9)
@JsonSerializable(fieldRename: FieldRename.pascal)
class CapturedData {
  @HiveField(0)
  final String? product;
  @HiveField(1)
  final String? location;
  @HiveField(2)
  final String? barcode;
  @HiveField(3)
  final String? year;
  @HiveField(4)
  final String? dateCaptured;
  @HiveField(5)
  final String? lastUpdated;
  @HiveField(6)
  final String? updatedBy;
  @HiveField(7)
  final String? serialNo;
  @HiveField(8)
  final String? condition;
  @HiveField(9)
  final String? message;
  @HiveField(10)
  final String? siteName;
  @HiveField(11)
  final String? siteAddress;
  @HiveField(12)
  final String? costCenter;
  @HiveField(13)
  final String? latitude;
  @HiveField(14)
  final String? longitude;
  @HiveField(15)
  final String? mapShape;
  @HiveField(16)
  final String? comment;
  @HiveField(17)
  late String? status;
  @HiveField(18)
  final String? client;
  @HiveField(19)
  final String? isParent;
  @HiveField(20)
  final String? parentBarcode;
  @HiveField(21)
  final String? person;
  @HiveField(22)
  final String? brExtra1;
  @HiveField(23)
  final String? brExtra2;
  @HiveField(24)
  final String? drop1;
  @HiveField(25)
  final String? drop2;
  @HiveField(26)
  final String? drop3;
  @HiveField(27)
  final String? text1;
  @HiveField(28)
  final String? text2;
  @HiveField(29)
  final String? text3;
  @HiveField(30)
  final String? text4;
  @HiveField(31)
  final String? text5;
  @HiveField(32)
  final String? text6;
  @HiveField(33)
  final String? text7;
  @HiveField(34)
  final String? text8;
  @HiveField(35)
  final String? photo1;
  @HiveField(36)
  final String? photo2;
  @HiveField(37)
  final String? photo3;
  @HiveField(38)
  final String? photo4;
  @HiveField(39)
  final String? mode;
  @HiveField(40)
  final String? capturedBy;
  @HiveField(41)
  @JsonKey(name: "ID")
  final int? id;
  @HiveField(42)
  bool? isEdited;
  @HiveField(43)
  bool? isFromAudit;

  CapturedData(
      {this.id,
      this.product,
      this.capturedBy,
      this.location,
      this.barcode,
      this.isFromAudit = false,
      this.year,
      this.dateCaptured,
      this.lastUpdated,
      this.updatedBy,
      this.serialNo,
      this.condition,
      this.message,
      this.siteName,
      this.siteAddress,
      this.costCenter,
      this.latitude,
      this.longitude,
      this.mapShape,
      this.comment,
      this.status,
      this.client,
      this.isParent,
      this.parentBarcode,
      this.person,
      this.brExtra1,
      this.brExtra2,
      this.drop1,
      this.drop2,
      this.drop3,
      this.text1,
      this.text2,
      this.text3,
      this.text4,
      this.text5,
      this.text6,
      this.text7,
      this.text8,
      this.photo1,
      this.photo2,
      this.photo3,
      this.photo4,
      this.mode,
      this.isEdited});

  factory CapturedData.fromJson(Map<String, dynamic> json) =>
      _$CapturedDataFromJson(json);
  Map<String, dynamic> toJson() => _$CapturedDataToJson(this);

  @override
  String toString() {
    return 'CapturedData(product: $product, location: $location, barcode: $barcode, year: $year, dateCaptured: $dateCaptured, lastUpdated: $lastUpdated, updatedBy: $updatedBy, serialNo: $serialNo, condition: $condition, message: $message, siteName: $siteName, siteAddress: $siteAddress, costCenter: $costCenter, latitude: $latitude, longitude: $longitude, mapShape: $mapShape, comment: $comment, status: $status, client: $client, isParent: $isParent, parentBarcode: $parentBarcode, person: $person, brExtra1: $brExtra1, brExtra2: $brExtra2, drop1: $drop1, drop2: $drop2, drop3: $drop3, text1: $text1, text2: $text2, text3: $text3, text4: $text4, text5: $text5, text6: $text6, text7: $text7, text8: $text8, photo1: $photo1, photo2: $photo2, photo3: $photo3, photo4: $photo4, mode: $mode, capturedBy: $capturedBy, id: $id, isEdited: $isEdited)';
  }
}
