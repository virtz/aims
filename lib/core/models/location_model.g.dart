// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocationModelAdapter extends TypeAdapter<LocationModel> {
  @override
  final int typeId = 1;

  @override
  LocationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocationModel(
      fields[0] as int?,
      fields[1] as String?,
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
  void write(BinaryWriter writer, LocationModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.ID)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.address)
      ..writeByte(3)
      ..write(obj.year)
      ..writeByte(4)
      ..write(obj.client)
      ..writeByte(5)
      ..write(obj.LGA)
      ..writeByte(6)
      ..write(obj.agent)
      ..writeByte(7)
      ..write(obj.latitude)
      ..writeByte(8)
      ..write(obj.longitude)
      ..writeByte(9)
      ..write(obj.FSEName)
      ..writeByte(10)
      ..write(obj.FSENumber)
      ..writeByte(11)
      ..write(obj.storeKeeper);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) =>
    LocationModel(
      json['ID'] as int?,
      json['Name'] as String?,
      json['Address'] as String?,
      json['Year'] as String?,
      json['Client'] as String?,
      json['LGA'] as String?,
      json['Agent'] as String?,
      json['Latitude'] as String?,
      json['Longitude'] as String?,
      json['FSEName'] as String?,
      json['FSENumber'] as String?,
      json['StoreKeeper'] as String?,
    );

Map<String, dynamic> _$LocationModelToJson(LocationModel instance) =>
    <String, dynamic>{
      'ID': instance.ID,
      'Name': instance.name,
      'Address': instance.address,
      'Year': instance.year,
      'Client': instance.client,
      'LGA': instance.LGA,
      'Agent': instance.agent,
      'Latitude': instance.latitude,
      'Longitude': instance.longitude,
      'FSEName': instance.FSEName,
      'FSENumber': instance.FSENumber,
      'StoreKeeper': instance.storeKeeper,
    };
