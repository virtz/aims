// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'control.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ControlAdapter extends TypeAdapter<Control> {
  @override
  final int typeId = 3;

  @override
  Control read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Control(
      client: fields[0] as String?,
      systemName: fields[1] as String?,
      userDefinedName: fields[2] as String?,
      status: fields[3] as String?,
      dataType: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Control obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.client)
      ..writeByte(1)
      ..write(obj.systemName)
      ..writeByte(2)
      ..write(obj.userDefinedName)
      ..writeByte(3)
      ..write(obj.status)
      ..writeByte(4)
      ..write(obj.dataType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ControlAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Control _$ControlFromJson(Map<String, dynamic> json) {
  return Control(
    client: json['Client'] as String?,
    systemName: json['SystemName'] as String?,
    userDefinedName: json['UserDefinedName'] as String?,
    status: json['Status'] as String?,
    dataType: json['DataType'] as String?,
  );
}

Map<String, dynamic> _$ControlToJson(Control instance) => <String, dynamic>{
      'Client': instance.client,
      'SystemName': instance.systemName,
      'UserDefinedName': instance.userDefinedName,
      'Status': instance.status,
      'DataType': instance.dataType,
    };
