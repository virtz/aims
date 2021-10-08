import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String? name;
  String? password;
  String? client;
  String? costCenter;
  String? location;
  double? lat;
  double? long;
  String? address;
  String? costCenterValue;
  String? locationSelectedValue;
  User(
      {this.name,
      this.password,
      this.client,
      this.costCenter,
      this.location,
      this.lat,
      this.long,
      this.address,
      this.costCenterValue,
      this.locationSelectedValue
      
      });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User && other.name == name && other.password == password;
  }

  @override
  int get hashCode => name.hashCode ^ password.hashCode;
}

class AuthModel {
  final String _token;

  AuthModel(this._token);
  String get token => _token;

  factory AuthModel.fromJson(String token) {
    return AuthModel(
      token,
    );
  }
}
