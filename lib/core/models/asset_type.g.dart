// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AssetTypeAdapter extends TypeAdapter<AssetType> {
  @override
  final int typeId = 4;

  @override
  AssetType read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AssetType(
      id: fields[0] as int?,
      p_Code: fields[1] as String?,
      caption: fields[2] as String?,
      subCat_Code: fields[3] as String?,
      year: fields[4] as String?,
      createdBy: fields[5] as String?,
      updatedBy: fields[6] as String?,
      dateCreated: fields[7] as String?,
      lastUpdated: fields[8] as String?,
      client: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AssetType obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.p_Code)
      ..writeByte(2)
      ..write(obj.caption)
      ..writeByte(3)
      ..write(obj.subCat_Code)
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
      ..write(obj.client);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AssetTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetType _$AssetTypeFromJson(Map<String, dynamic> json) => AssetType(
      id: json['id'] as int?,
      p_Code: json['P_Code'] as String?,
      caption: json['Caption'] as String?,
      subCat_Code: json['SubCat_Code'] as String?,
      year: json['Year'] as String?,
      createdBy: json['CreatedBy'] as String?,
      updatedBy: json['UpdatedBy'] as String?,
      dateCreated: json['DateCreated'] as String?,
      lastUpdated: json['LastUpdated'] as String?,
      client: json['Client'] as String?,
    );

Map<String, dynamic> _$AssetTypeToJson(AssetType instance) => <String, dynamic>{
      'id': instance.id,
      'P_Code': instance.p_Code,
      'Caption': instance.caption,
      'SubCat_Code': instance.subCat_Code,
      'Year': instance.year,
      'CreatedBy': instance.createdBy,
      'UpdatedBy': instance.updatedBy,
      'DateCreated': instance.dateCreated,
      'LastUpdated': instance.lastUpdated,
      'Client': instance.client,
    };
