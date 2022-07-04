part of '../screen/ProfilePage.dart';

class ProfilePageViewModel {
  UserRepository userRepository = UserRepository.instance;
  late _ProfilePageState widget;
  ProfilePageViewModel(this.widget);

  Future getUserProfile({String? username="omid8144"}) async{
    if (userRepository.currentUser == null) {
      var result = await userRepository.getUserInformationWithUsername(username);
      widget.user = result;
    }else {
      widget.user = userRepository.currentUser;
    }
    widget.setState(() {});

  }

  loadUserTweets({required String userId}) async{
    var result = await userRepository.getUserTweets(userId);
    widget.tweets = result;
    print(result);
    widget.setState(() {});
  }

  // openLink({})
}