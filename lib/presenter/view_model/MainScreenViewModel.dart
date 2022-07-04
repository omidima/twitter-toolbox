part of '../screen/MainScreen.dart';

class MainScreenViewModel{
  UserRepository userResponse = UserRepository.instance;
  late _MainScreenState widget;
  MainScreenViewModel(this.widget);

  getUserInformation(String? text) async{
    if (text == null || text.isEmpty){
      widget.setState(() {
        widget.isSubmitEnable = false;
      });
    } else {
      widget.setState(() {
        widget._isLoading = true;
      });

      var result = await userResponse.getUserInformationWithUsername(text);
      widget._user = result;

      widget.setState(() {
        widget._isLoading = false;
      });
    }
  }
}