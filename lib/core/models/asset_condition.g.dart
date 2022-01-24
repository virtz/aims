// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_condition.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AssetConditionAdapter extends TypeAdapter<AssetCondition> {
  @override
  final int typeId = 8;

  @override
  AssetCondition read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AssetCondition(
      fields[0] as int?,
      fields[1] as String?,
      fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, AssetCondition obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.condition)
      ..writeByte(2)
      ..write(obj.position);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AssetConditionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetCondition _$AssetConditionFromJson(Map<String, dynamic> json) =>
    AssetCondition(
      json['ID'] as int?,
      json['Condition'] as String?,
      json['Position'] as int?,
    );

Map<String, dynamic> _$AssetConditionToJson(AssetCondition instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Condition': instance.condition,
      'Position': instance.position,
    };
