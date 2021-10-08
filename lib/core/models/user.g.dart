// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    name: json['name'] as String?,
    password: json['password'] as String?,
    client: json['client'] as String?,
    costCenter: json['costCenter'] as String?,
    location: json['location'] as String?,
    lat: (json['lat'] as num?)?.toDouble(),
    long: (json['long'] as num?)?.toDouble(),
    address: json['address'] as String?,
    costCenterValue: json['costCenterValue'] as String?,
    locationSelectedValue: json['locationSelectedValue'] as String?,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'password': instance.password,
      'client': instance.client,
      'costCenter': instance.costCenter,
      'location': instance.location,
      'lat': instance.lat,
      'long': instance.long,
      'address': instance.address,
      'costCenterValue': instance.costCenterValue,
      'locationSelectedValue': instance.locationSelectedValue,
    };
