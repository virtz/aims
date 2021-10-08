// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drop1_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class Drop1DataModelAdapter extends TypeAdapter<Drop1DataModel> {
  @override
  final int typeId = 11;

  @override
  Drop1DataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Drop1DataModel(
      id: fields[0] as int?,
      caption: fields[1] as String?,
      code: fields[2] as String?,
      year: fields[3] as String?,
      client: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Drop1DataModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.caption)
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
      other is Drop1DataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Drop1DataModel _$Drop1DataModelFromJson(Map<String, dynamic> json) {
  return Drop1DataModel(
    id: json['ID'] as int?,
    caption: json['Caption'] as String?,
    code: json['Code'] as String?,
    year: json['Year'] as String?,
    client: json['Client'] as String?,
  );
}

Map<String, dynamic> _$Drop1DataModelToJson(Drop1DataModel instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Caption': instance.caption,
      'Code': instance.code,
      'Year': instance.year,
      'Client': instance.client,
    };
