// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parameter_setup.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ParameterSetUpAdapter extends TypeAdapter<ParameterSetUp> {
  @override
  final int typeId = 2;

  @override
  ParameterSetUp read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ParameterSetUp(
      fields[0] as String?,
      fields[1] as int?,
      fields[2] as String?,
      fields[3] as String?,
      fields[4] as String?,
      fields[5] as String?,
      fields[6] as String?,
      fields[7] as String?,
      fields[8] as String?,
      fields[9] as String?,
      fields[10] as String?,
      fields[11] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ParameterSetUp obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.client)
      ..writeByte(1)
      ..write(obj.assetLevelCount)
      ..writeByte(2)
      ..write(obj.year)
      ..writeByte(3)
      ..write(obj.assetLevel1Name)
      ..writeByte(4)
      ..write(obj.assetLevel2Name)
      ..writeByte(5)
      ..write(obj.assetLevel3Name)
      ..writeByte(6)
      ..write(obj.assetLevel4Name)
      ..writeByte(7)
      ..write(obj.manufacturer)
      ..writeByte(8)
      ..write(obj.serialNo)
      ..writeByte(9)
      ..write(obj.chasisNo)
      ..writeByte(10)
      ..write(obj.engineN0)
      ..writeByte(11)
      ..write(obj.captureMode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ParameterSetUpAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParameterSetUp _$ParameterSetUpFromJson(Map<String, dynamic> json) =>
    ParameterSetUp(
      json['Client'] as String?,
      json['AssetLevelCount'] as int?,
      json['Year'] as String?,
      json['AssetLevel1Name'] as String?,
      json['AssetLevel2Name'] as String?,
      json['AssetLevel3Name'] as String?,
      json['AssetLevel4Name'] as String?,
      json['Manufacturer'] as String?,
      json['SerialNo'] as String?,
      json['ChasisNo'] as String?,
      json['EngineN0'] as String?,
      json['CaptureMode'] as String?,
    );

Map<String, dynamic> _$ParameterSetUpToJson(ParameterSetUp instance) =>
    <String, dynamic>{
      'Client': instance.client,
      'AssetLevelCount': instance.assetLevelCount,
      'Year': instance.year,
      'AssetLevel1Name': instance.assetLevel1Name,
      'AssetLevel2Name': instance.assetLevel2Name,
      'AssetLevel3Name': instance.assetLevel3Name,
      'AssetLevel4Name': instance.assetLevel4Name,
      'Manufacturer': instance.manufacturer,
      'SerialNo': instance.serialNo,
      'ChasisNo': instance.chasisNo,
      'EngineN0': instance.engineN0,
      'CaptureMode': instance.captureMode,
    };
