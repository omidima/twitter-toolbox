// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      data: json['data'] == null
          ? null
          : User.fromJson(json['data'] as Map<String, dynamic>),
      meta: json['meta'] as Map<String, dynamic>?,
      includes: json['includes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'includes': instance.includes,
      'meta': instance.meta,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String?,
      name: json['name'] as String?,
      username: json['username'] as String?,
      created_at: json['created_at'] as String?,
      protected: json['protected'] as bool?,
      verified: json['verified'] as bool?,
      location: json['location'] as String?,
      url: json['url'] as String?,
      description: json['description'] as String?,
      profile_image_url: json['profile_image_url'] as String?,
      pinned_tweet_id: json['pinned_tweet_id'] as String?,
      withheld: json['withheld'] as Map<String, dynamic>?,
      entities: json['entities'] as Map<String, dynamic>?,
      public_metrics: json['public_metrics'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'created_at': instance.created_at,
      'protected': instance.protected,
      'verified': instance.verified,
      'location': instance.location,
      'url': instance.url,
      'description': instance.description,
      'profile_image_url': instance.profile_image_url,
      'pinned_tweet_id': instance.pinned_tweet_id,
      'withheld': instance.withheld,
      'entities': instance.entities,
      'public_metrics': instance.public_metrics,
    };
