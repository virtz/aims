// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'captured_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CapturedDataAdapter extends TypeAdapter<CapturedData> {
  @override
  final int typeId = 9;

  @override
  CapturedData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CapturedData(
      id: fields[41] as int?,
      product: fields[0] as String?,
      capturedBy: fields[40] as String?,
      location: fields[1] as String?,
      barcode: fields[2] as String?,
      year: fields[3] as String?,
      dateCaptured: fields[4] as String?,
      lastUpdated: fields[5] as String?,
      updatedBy: fields[6] as String?,
      serialNo: fields[7] as String?,
      condition: fields[8] as String?,
      message: fields[9] as String?,
      siteName: fields[10] as String?,
      siteAddress: fields[11] as String?,
      costCenter: fields[12] as String?,
      latitude: fields[13] as String?,
      longitude: fields[14] as String?,
      mapShape: fields[15] as String?,
      comment: fields[16] as String?,
      status: fields[17] as String?,
      client: fields[18] as String?,
      isParent: fields[19] as String?,
      parentBarcode: fields[20] as String?,
      person: fields[21] as String?,
      brExtra1: fields[22] as String?,
      brExtra2: fields[23] as String?,
      drop1: fields[24] as String?,
      drop2: fields[25] as String?,
      drop3: fields[26] as String?,
      text1: fields[27] as String?,
      text2: fields[28] as String?,
      text3: fields[29] as String?,
      text4: fields[30] as String?,
      text5: fields[31] as String?,
      text6: fields[32] as String?,
      text7: fields[33] as String?,
      text8: fields[34] as String?,
      photo1: fields[35] as String?,
      photo2: fields[36] as String?,
      photo3: fields[37] as String?,
      photo4: fields[38] as String?,
      mode: fields[39] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CapturedData obj) {
    writer
      ..writeByte(42)
      ..writeByte(0)
      ..write(obj.product)
      ..writeByte(1)
      ..write(obj.location)
      ..writeByte(2)
      ..write(obj.barcode)
      ..writeByte(3)
      ..write(obj.year)
      ..writeByte(4)
      ..write(obj.dateCaptured)
      ..writeByte(5)
      ..write(obj.lastUpdated)
      ..writeByte(6)
      ..write(obj.updatedBy)
      ..writeByte(7)
      ..write(obj.serialNo)
      ..writeByte(8)
      ..write(obj.condition)
      ..writeByte(9)
      ..write(obj.message)
      ..writeByte(10)
      ..write(obj.siteName)
      ..writeByte(11)
      ..write(obj.siteAddress)
      ..writeByte(12)
      ..write(obj.costCenter)
      ..writeByte(13)
      ..write(obj.latitude)
      ..writeByte(14)
      ..write(obj.longitude)
      ..writeByte(15)
      ..write(obj.mapShape)
      ..writeByte(16)
      ..write(obj.comment)
      ..writeByte(17)
      ..write(obj.status)
      ..writeByte(18)
      ..write(obj.client)
      ..writeByte(19)
      ..write(obj.isParent)
      ..writeByte(20)
      ..write(obj.parentBarcode)
      ..writeByte(21)
      ..write(obj.person)
      ..writeByte(22)
      ..write(obj.brExtra1)
      ..writeByte(23)
      ..write(obj.brExtra2)
      ..writeByte(24)
      ..write(obj.drop1)
      ..writeByte(25)
      ..write(obj.drop2)
      ..writeByte(26)
      ..write(obj.drop3)
      ..writeByte(27)
      ..write(obj.text1)
      ..writeByte(28)
      ..write(obj.text2)
      ..writeByte(29)
      ..write(obj.text3)
      ..writeByte(30)
      ..write(obj.text4)
      ..writeByte(31)
      ..write(obj.text5)
      ..writeByte(32)
      ..write(obj.text6)
      ..writeByte(33)
      ..write(obj.text7)
      ..writeByte(34)
      ..write(obj.text8)
      ..writeByte(35)
      ..write(obj.photo1)
      ..writeByte(36)
      ..write(obj.photo2)
      ..writeByte(37)
      ..write(obj.photo3)
      ..writeByte(38)
      ..write(obj.photo4)
      ..writeByte(39)
      ..write(obj.mode)
      ..writeByte(40)
      ..write(obj.capturedBy)
      ..writeByte(41)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CapturedDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CapturedData _$CapturedDataFromJson(Map<String, dynamic> json) {
  return CapturedData(
    id: json['ID'] as int?,
    product: json['Product'] as String?,
    capturedBy: json['CapturedBy'] as String?,
    location: json['Location'] as String?,
    barcode: json['Barcode'] as String?,
    year: json['Year'] as String?,
    dateCaptured: json['DateCaptured'] as String?,
    lastUpdated: json['LastUpdated'] as String?,
    updatedBy: json['UpdatedBy'] as String?,
    serialNo: json['SerialNo'] as String?,
    condition: json['Condition'] as String?,
    message: json['Message'] as String?,
    siteName: json['SiteName'] as String?,
    siteAddress: json['SiteAddress'] as String?,
    costCenter: json['CostCenter'] as String?,
    latitude: json['Latitude'] as String?,
    longitude: json['Longitude'] as String?,
    mapShape: json['MapShape'] as String?,
    comment: json['Comment'] as String?,
    status: json['Status'] as String?,
    client: json['Client'] as String?,
    isParent: json['IsParent'] as String?,
    parentBarcode: json['ParentBarcode'] as String?,
    person: json['Person'] as String?,
    brExtra1: json['BrExtra1'] as String?,
    brExtra2: json['BrExtra2'] as String?,
    drop1: json['Drop1'] as String?,
    drop2: json['Drop2'] as String?,
    drop3: json['Drop3'] as String?,
    text1: json['Text1'] as String?,
    text2: json['Text2'] as String?,
    text3: json['Text3'] as String?,
    text4: json['Text4'] as String?,
    text5: json['Text5'] as String?,
    text6: json['Text6'] as String?,
    text7: json['Text7'] as String?,
    text8: json['Text8'] as String?,
    photo1: json['Photo1'] as String?,
    photo2: json['Photo2'] as String?,
    photo3: json['Photo3'] as String?,
    photo4: json['Photo4'] as String?,
    mode: json['Mode'] as String?,
  );
}

Map<String, dynamic> _$CapturedDataToJson(CapturedData instance) =>
    <String, dynamic>{
      'Product': instance.product,
      'Location': instance.location,
      'Barcode': instance.barcode,
      'Year': instance.year,
      'DateCaptured': instance.dateCaptured,
      'LastUpdated': instance.lastUpdated,
      'UpdatedBy': instance.updatedBy,
      'SerialNo': instance.serialNo,
      'Condition': instance.condition,
      'Message': instance.message,
      'SiteName': instance.siteName,
      'SiteAddress': instance.siteAddress,
      'CostCenter': instance.costCenter,
      'Latitude': instance.latitude,
      'Longitude': instance.longitude,
      'MapShape': instance.mapShape,
      'Comment': instance.comment,
      'Status': instance.status,
      'Client': instance.client,
      'IsParent': instance.isParent,
      'ParentBarcode': instance.parentBarcode,
      'Person': instance.person,
      'BrExtra1': instance.brExtra1,
      'BrExtra2': instance.brExtra2,
      'Drop1': instance.drop1,
      'Drop2': instance.drop2,
      'Drop3': instance.drop3,
      'Text1': instance.text1,
      'Text2': instance.text2,
      'Text3': instance.text3,
      'Text4': instance.text4,
      'Text5': instance.text5,
      'Text6': instance.text6,
      'Text7': instance.text7,
      'Text8': instance.text8,
      'Photo1': instance.photo1,
      'Photo2': instance.photo2,
      'Photo3': instance.photo3,
      'Photo4': instance.photo4,
      'Mode': instance.mode,
      'CapturedBy': instance.capturedBy,
      'ID': instance.id,
    };
