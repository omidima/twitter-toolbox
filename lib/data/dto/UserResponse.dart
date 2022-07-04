import 'package:json_annotation/json_annotation.dart';
part 'UserResponse.g.dart';

@JsonSerializable()
class UserResponse {
  User? data;
  Map<String, dynamic>? includes;
  Map<String, dynamic>? meta;
  UserResponse({this.data,this.meta,this.includes});

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);

}

@JsonSerializable()
class User {
  String? id;
  String? name;
  String? username;
  String? created_at;
  bool? protected;
  bool? verified;
  String? location;
  String? url;
  String? description;
  String? profile_image_url;
  String? pinned_tweet_id;
  Map<String, dynamic>? withheld;
  Map<String, dynamic>? entities;
  Map<String, dynamic>? public_metrics;

  User(
      {this.id,
      this.name,
      this.username,
      this.created_at,
      this.protected,
      this.verified,
      this.location,
      this.url,
      this.description,
      this.profile_image_url,
      this.pinned_tweet_id,
      this.withheld,
      this.entities,
      this.public_metrics});

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}