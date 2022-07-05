

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:twitter_tools/data/network/DioAuther.dart';

import '../dto/TwitterResponse.dart';
import '../dto/UserResponse.dart';
part 'network.g.dart';


@RestApi(baseUrl: "https://api.twitter.com/2")
abstract class NetworkClass {
  factory NetworkClass(Dio dio, {String baseUrl}) = _NetworkClass;

  // user options
  @GET('/users/by/username/{username}')
  Future<UserResponse> getUserWithUsername(
      @Path("username") String username,
      @Query('user.fields') String query
      );

  @GET('/users/{id}')
  Future<UserResponse> getUserWithId(
      @Path("id") String userId
      );


  @GET('/users/{id}/followed_lists')
  Future<TwitterFollowResponse> getFollowingList(
    @Path("id") String id
  );

  @GET('/lists/{id}/followers')
  Future<TwitterFollowResponse> getFollowerList(
      @Path("id") String id
      );

  // post status

  @GET('/users/{id}/tweets')
  Future<TwitterFollowResponse> getUserTweets(
      @Path("id") String twitterId
      );


  @GET('/tweets/:id/retweeted_by')
  Future<List<TwitterFollowResponse>> getRetweetedPostList(
      @Path("id") String twitterId
      );

  @GET('/tweets/:id/quote_tweets')
  Future<List<TwitterFollowResponse>> getQuotePostList(
      @Path("id") String twitterId
      );

  @GET('/tweets/:id/liking_users')
  Future<List<TwitterFollowResponse>> getLikedPostList(
      @Path("id") String twitterId
      );
}

class RestProvider {
  RestProvider() {
    var dio = Dio()
      ..interceptors.addAll([DioAuther()]);
    restProvider = NetworkClass(dio);
  }

  late NetworkClass restProvider;
}