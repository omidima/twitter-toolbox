part of '../screen/ReviewFollowBack.dart';

class ReviewFollowBackViewModel {
  UserRepository userRepository = UserRepository.instance;
  _ReviewFollowBackState widget;

  ReviewFollowBackViewModel({required this.widget});

  handleFollowingList(String userId) async{
    var followers = await userRepository.getUserFollowers(userId);
    var following = await userRepository.getUserFollowing(userId);

    following?.forEach((item) {
      var result = followers?.where((element) => element.id != item.id);
      if (result != null && result.isNotEmpty) {
        widget._itemList.add(item);
      }
    });

    widget.setState((){});
  }
}