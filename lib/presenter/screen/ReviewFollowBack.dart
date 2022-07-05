import 'package:flutter/material.dart';
import 'package:twitter_tools/data/dto/TwitterResponse.dart';
import 'package:twitter_tools/data/repository/UserRepository.dart';
part '../view_model/ReviewFollowBackViewModel.dart';

class ReviewFollowBack extends StatefulWidget {
  static MaterialPageRoute route() => MaterialPageRoute(
        builder: (context) => ReviewFollowBack(),
      );
  const ReviewFollowBack({Key? key}) : super(key: key);

  @override
  _ReviewFollowBackState createState() => _ReviewFollowBackState();
}

class _ReviewFollowBackState extends State<ReviewFollowBack> {
  late ReviewFollowBackViewModel viewModel;
  List<FollowResponse> _itemList = [];

  @override
  void initState() {
    viewModel = ReviewFollowBackViewModel(widget: this);
    viewModel
        .handleFollowingList(UserRepository.instance.currentUser?.id ?? "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        titleSpacing: 0,
        toolbarHeight: 70,
        leadingWidth: 70,
        title: Text(UserRepository.instance.currentUser?.username ?? ""),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(50)),
              child: Icon(Icons.arrow_back),
            ),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            width: 38,
            decoration: BoxDecoration(
                color: Colors.black54, borderRadius: BorderRadius.circular(50)),
            child: Icon(Icons.search),
          ),
          const SizedBox(
            width: 15,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            width: 38,
            decoration: BoxDecoration(
                color: Colors.black54, borderRadius: BorderRadius.circular(50)),
            child: Icon(Icons.sort),
          ),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            const Text(
              "find unBackFollow Users",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) => ListTile(
                leading: Image.network(
                  'src',
                  width: 30,
                ),
                title: Text(_itemList[index].text ?? 'not found'),
              ),
              itemCount: _itemList.length,
            ))
          ],
        ),
      ),
    );
  }
}
