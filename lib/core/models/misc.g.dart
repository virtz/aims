// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'misc.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MiscAdapter extends TypeAdapter<Misc> {
  @override
  final int typeId = 14;

  @override
  Misc read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Misc(
      fields[0] as AssetName?,
      fields[1] as AssetCategory?,
      fields[2] as AssetSubCategory?,
      fields[3] as String?,
      fields[4] as String?,
      fields[5] as AssetType?,
      fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Misc obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.productName)
      ..writeByte(1)
      ..write(obj.selectedCategory)
      ..writeByte(2)
      ..write(obj.selectedSubCategory)
      ..writeByte(3)
      ..write(obj.manufacturer)
      ..writeByte(4)
      ..write(obj.chasisNo)
      ..writeByte(5)
      ..write(obj.assetType)
      ..writeByte(6)
      ..write(obj.productCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MiscAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Misc _$MiscFromJson(Map<String, dynamic> json) => Misc(
      json['product_name'] == null
          ? null
          : AssetName.fromJson(json['product_name'] as Map<String, dynamic>),
      json['selected_category'] == null
          ? null
          : AssetCategory.fromJson(
              json['selected_category'] as Map<String, dynamic>),
      json['selected_sub_category'] == null
          ? null
          : AssetSubCategory.fromJson(
              json['selected_sub_category'] as Map<String, dynamic>),
      json['manufacturer'] as String?,
      json['chasis_no'] as String?,
      json['asset_type'] == null
          ? null
          : AssetType.fromJson(json['asset_type'] as Map<String, dynamic>),
      json['product_code'] as String?,
    );

Map<String, dynamic> _$MiscToJson(Misc instance) => <String, dynamic>{
      'product_name': instance.productName,
      'selected_category': instance.selectedCategory,
      'selected_sub_category': instance.selectedSubCategory,
      'manufacturer': instance.manufacturer,
      'chasis_no': instance.chasisNo,
      'asset_type': instance.assetType,
      'product_code': instance.productCode,
    };
