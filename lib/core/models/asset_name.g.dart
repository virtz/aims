// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_name.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AssetNameAdapter extends TypeAdapter<AssetName> {
  @override
  final int typeId = 5;

  @override
  AssetName read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AssetName(
      id: fields[0] as int?,
      dateCreated: fields[7] as String?,
      p_Code: fields[1] as String?,
      caption: fields[2] as String?,
      parentCode: fields[3] as String?,
      year: fields[4] as String?,
      createdBy: fields[5] as String?,
      updatedBy: fields[6] as String?,
      lastUpdated: fields[8] as String?,
      client: fields[9] as String?,
      maxCount: fields[10] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, AssetName obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.p_Code)
      ..writeByte(2)
      ..write(obj.caption)
      ..writeByte(3)
      ..write(obj.parentCode)
      ..writeByte(4)
      ..write(obj.year)
      ..writeByte(5)
      ..write(obj.createdBy)
      ..writeByte(6)
      ..write(obj.updatedBy)
      ..writeByte(7)
      ..write(obj.dateCreated)
      ..writeByte(8)
      ..write(obj.lastUpdated)
      ..writeByte(9)
      ..write(obj.client)
      ..writeByte(10)
      ..write(obj.maxCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AssetNameAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetName _$AssetNameFromJson(Map<String, dynamic> json) {
  return AssetName(
    id: json['id'] as int?,
    dateCreated: json['DateCreated'] as String?,
    p_Code: json['P_Code'] as String?,
    caption: json['Caption'] as String?,
    parentCode: json['ParentCode'] as String?,
    year: json['Year'] as String?,
    createdBy: json['CreatedBy'] as String?,
    updatedBy: json['UpdatedBy'] as String?,
    lastUpdated: json['LastUpdated'] as String?,
    client: json['Client'] as String?,
    maxCount: json['MaxCount'] as int?,
  );
}

Map<String, dynamic> _$AssetNameToJson(AssetName instance) => <String, dynamic>{
      'id': instance.id,
      'P_Code': instance.p_Code,
      'Caption': instance.caption,
      'ParentCode': instance.parentCode,
      'Year': instance.year,
      'CreatedBy': instance.createdBy,
      'UpdatedBy': instance.updatedBy,
      'DateCreated': instance.dateCreated,
      'LastUpdated': instance.lastUpdated,
      'Client': instance.client,
      'MaxCount': instance.maxCount,
    };
