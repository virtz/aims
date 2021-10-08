// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cost_center_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConstCenterAdapter extends TypeAdapter<ConstCenter> {
  @override
  final int typeId = 0;

  @override
  ConstCenter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ConstCenter(
      id: fields[0] as int?,
      description: fields[1] as String?,
      code: fields[2] as String?,
      year: fields[3] as String?,
      client: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ConstCenter obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.code)
      ..writeByte(3)
      ..write(obj.year)
      ..writeByte(4)
      ..write(obj.client);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConstCenterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConstCenter _$ConstCenterFromJson(Map<String, dynamic> json) {
  return ConstCenter(
    id: json['ID'] as int?,
    description: json['Description'] as String?,
    code: json['Code'] as String?,
    year: json['Year'] as String?,
    client: json['Client'] as String?,
  );
}

Map<String, dynamic> _$ConstCenterToJson(ConstCenter instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Description': instance.description,
      'Code': instance.code,
      'Year': instance.year,
      'Client': instance.client,
    };
