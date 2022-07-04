
import 'package:json_annotation/json_annotation.dart';
part 'TwitterResponse.g.dart';

@JsonSerializable()
class TwitterFollowResponse {
  List<FollowResponse>? data;
  Map<String, dynamic>? includes;
  Map<String, dynamic>? meta;
  TwitterFollowResponse({this.data,this.meta,this.includes});

  factory TwitterFollowResponse.fromJson(Map<String, dynamic> json) =>
      _$TwitterFollowResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TwitterFollowResponseToJson(this);

}

@JsonSerializable()
class FollowResponse {
  String? id;
  String? name;
  String? text;
  String? username;
  String? create_at;
  String? owner_id;
  String? author_id;
  String? pinned_tweet_id;
  String? description;
  String? conversation_id;
  Map<String, dynamic>? context_annotations;
  Map<String, dynamic>? public_metrics;
  int? follower_count;


  factory FollowResponse.fromJson(Map<String, dynamic> json) =>
      _$FollowResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FollowResponseToJson(this);

  FollowResponse(
      {this.id,
      this.name,
      this.username,
      this.create_at,
      this.owner_id,
      this.pinned_tweet_id,
      this.follower_count});
}