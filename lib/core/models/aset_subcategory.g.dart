// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aset_subcategory.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AssetSubCategoryAdapter extends TypeAdapter<AssetSubCategory> {
  @override
  final int typeId = 7;

  @override
  AssetSubCategory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AssetSubCategory(
      id: fields[0] as int?,
      p_Code: fields[1] as String?,
      caption: fields[2] as String?,
      cat_Code: fields[3] as String?,
      year: fields[4] as String?,
      createdBy: fields[5] as String?,
      updatedBy: fields[6] as String?,
      dateCreated: fields[7] as String?,
      lastUpdated: fields[8] as String?,
      client: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AssetSubCategory obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.p_Code)
      ..writeByte(2)
      ..write(obj.caption)
      ..writeByte(3)
      ..write(obj.cat_Code)
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
      other is AssetSubCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetSubCategory _$AssetSubCategoryFromJson(Map<String, dynamic> json) =>
    AssetSubCategory(
      id: json['id'] as int?,
      p_Code: json['P_Code'] as String?,
      caption: json['Caption'] as String?,
      cat_Code: json['Cat_Code'] as String?,
      year: json['Year'] as String?,
      createdBy: json['CreatedBy'] as String?,
      updatedBy: json['UpdatedBy'] as String?,
      dateCreated: json['DateCreated'] as String?,
      lastUpdated: json['LastUpdated'] as String?,
      client: json['Client'] as String?,
    );

Map<String, dynamic> _$AssetSubCategoryToJson(AssetSubCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'P_Code': instance.p_Code,
      'Caption': instance.caption,
      'Cat_Code': instance.cat_Code,
      'Year': instance.year,
      'CreatedBy': instance.createdBy,
      'UpdatedBy': instance.updatedBy,
      'DateCreated': instance.dateCreated,
      'LastUpdated': instance.lastUpdated,
      'Client': instance.client,
    };
