// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TwitterResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TwitterFollowResponse _$TwitterFollowResponseFromJson(
        Map<String, dynamic> json) =>
    TwitterFollowResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => FollowResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] as Map<String, dynamic>?,
      includes: json['includes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$TwitterFollowResponseToJson(
        TwitterFollowResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'includes': instance.includes,
      'meta': instance.meta,
    };

FollowResponse _$FollowResponseFromJson(Map<String, dynamic> json) =>
    FollowResponse(
      id: json['id'] as String?,
      name: json['name'] as String?,
      username: json['username'] as String?,
      create_at: json['create_at'] as String?,
      owner_id: json['owner_id'] as String?,
      pinned_tweet_id: json['pinned_tweet_id'] as String?,
      follower_count: json['follower_count'] as int?,
    )
      ..text = json['text'] as String?
      ..author_id = json['author_id'] as String?
      ..description = json['description'] as String?
      ..conversation_id = json['conversation_id'] as String?
      ..context_annotations =
          json['context_annotations'] as Map<String, dynamic>?
      ..public_metrics = json['public_metrics'] as Map<String, dynamic>?;

Map<String, dynamic> _$FollowResponseToJson(FollowResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'text': instance.text,
      'username': instance.username,
      'create_at': instance.create_at,
      'owner_id': instance.owner_id,
      'author_id': instance.author_id,
      'pinned_tweet_id': instance.pinned_tweet_id,
      'description': instance.description,
      'conversation_id': instance.conversation_id,
      'context_annotations': instance.context_annotations,
      'public_metrics': instance.public_metrics,
      'follower_count': instance.follower_count,
    };
