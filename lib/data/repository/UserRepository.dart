import 'package:twitter_tools/data/dto/TwitterResponse.dart';
import 'package:twitter_tools/data/repository/BaseRepository.dart';

import '../dto/UserResponse.dart';

class UserRepository extends BaseRepository{
  User? currentUser;

  UserRepository._internal();
  static final UserRepository _instance = UserRepository._internal();
  static UserRepository get instance => _instance;

  Future<User?> getUserInformationWithUsername(String? username) async{
    var data = await restProvider.getUserWithUsername(username ?? "omid8144",
      "created_at,description,entities,id,location,name,pinned_tweet_id,profile_image_url,protected,public_metrics,url,username,verified");

    if (data != null) {
      currentUser = data.data;
      return data.data!;
    }
    return null;
  }

  Future<List<FollowResponse>?> getUserTweets(String userId) async {
    var data = await restProvider.getUserTweets(userId);

    if (data != null) {
      return data.data;
    }
    return null;
  }

  Future<List<FollowResponse>?> getUserFollowers(String userId) async{
    var data = await restProvider.getFollowerList(userId);
    if (data != null) {
      return data.data;
    }
    return null;
  }

  Future<List<FollowResponse>?> getUserFollowing(String userId) async{
    var data = await restProvider.getFollowingList(userId);
    if (data != null) {
      return data.data;
    }
    return null;
  }


}