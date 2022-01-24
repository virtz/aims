// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AssetCategoryAdapter extends TypeAdapter<AssetCategory> {
  @override
  final int typeId = 6;

  @override
  AssetCategory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AssetCategory(
      id: fields[0] as int?,
      code: fields[1] as String?,
      caption: fields[2] as String?,
      year: fields[3] as String?,
      createdBy: fields[4] as String?,
      updatedBy: fields[5] as String?,
      dateCreated: fields[6] as String?,
      lastUpdated: fields[7] as String?,
      client: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AssetCategory obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.code)
      ..writeByte(2)
      ..write(obj.caption)
      ..writeByte(3)
      ..write(obj.year)
      ..writeByte(4)
      ..write(obj.createdBy)
      ..writeByte(5)
      ..write(obj.updatedBy)
      ..writeByte(6)
      ..write(obj.dateCreated)
      ..writeByte(7)
      ..write(obj.lastUpdated)
      ..writeByte(8)
      ..write(obj.client);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AssetCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetCategory _$AssetCategoryFromJson(Map<String, dynamic> json) =>
    AssetCategory(
      id: json['ID'] as int?,
      code: json['Code'] as String?,
      caption: json['Caption'] as String?,
      year: json['Year'] as String?,
      createdBy: json['CreatedBy'] as String?,
      updatedBy: json['UpdatedBy'] as String?,
      dateCreated: json['DateCreated'] as String?,
      lastUpdated: json['LastUpdated'] as String?,
      client: json['Client'] as String?,
    );

Map<String, dynamic> _$AssetCategoryToJson(AssetCategory instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Code': instance.code,
      'Caption': instance.caption,
      'Year': instance.year,
      'CreatedBy': instance.createdBy,
      'UpdatedBy': instance.updatedBy,
      'DateCreated': instance.dateCreated,
      'LastUpdated': instance.lastUpdated,
      'Client': instance.client,
    };
