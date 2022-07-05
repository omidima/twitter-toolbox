import 'package:flutter/material.dart';
import 'package:twitter_tools/data/dto/UserResponse.dart';
import 'package:twitter_tools/data/repository/UserRepository.dart';
import 'package:twitter_tools/presenter/screen/ReviewFollowBack.dart';
import 'package:twitter_tools/presenter/widget/OptionItem.dart';

import '../../data/dto/TwitterResponse.dart';

part '../view_model/ProfilePageViewModel.dart';

class ProfilePage extends StatefulWidget {
  static MaterialPageRoute route(String? username) => MaterialPageRoute(
        builder: (context) => ProfilePage(username: username,),
      );

  String? username;

  ProfilePage({Key? key, this.username}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? user;
  ScrollController controller = ScrollController();
  late ProfilePageViewModel viewModel;
  bool _showingToolbar = false;
  List<FollowResponse>? tweets;

  @override
  void initState() {
    viewModel = ProfilePageViewModel(this);
    viewModel
        .getUserProfile(username: widget.username)
        .then((value) => viewModel.loadUserTweets(userId: user!.id!));

    controller.addListener(() {
      if (controller.position.pixels > 85 && !_showingToolbar) {
        setState(() {
          _showingToolbar = true;
        });
      } else if (controller.position.pixels < 85 && _showingToolbar) {
        setState(() {
          _showingToolbar = false;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: controller,
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.black,
                toolbarHeight: 70,
                elevation: 0,
                expandedHeight: 150,
                pinned: true,
                automaticallyImplyLeading: false,
                centerTitle: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  stretchModes: [StretchMode.zoomBackground],
                  title: Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            user!.profile_image_url ?? "",
                            width: 30,
                            height: 30,
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user!.username ?? "",
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            user!.name ?? "",
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.normal),
                          )
                        ],
                      )
                    ],
                  ),
                  collapseMode: CollapseMode.pin,
                  background: Container(
                    color: Colors.blueAccent,
                  ),
                ),
                leadingWidth: 70,
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      print('clicker');
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
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(50)),
                    child: Icon(Icons.search),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 16),
                    width: 38,
                    decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(50)),
                    child: Icon(Icons.sort),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 8,
                      ),
                      MaterialButton(
                        onPressed: () {},
                        color: Colors.blueAccent,
                        elevation: 0,
                        child: const Text(
                          'View Profile.',
                          style: TextStyle(color: Colors.white),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      MaterialButton(
                        onPressed: () {},
                        color: Colors.white,
                        elevation: 0,
                        child: const Text(
                          'Send Message.',
                          style: TextStyle(color: Colors.black),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: const BorderSide(
                                color: Colors.blueAccent, width: 2)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(user!.description ?? ""),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        Text(
                          "${user!.public_metrics?['followers_count']} followers",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                            "${user!.public_metrics?['following_count']} following",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  )
                ]),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(
                        child: OptionItem(
                          onTap: () {
                            Navigator.push(context, ReviewFollowBack.route());
                          },
                          title: "find unBackFollow",
                          icon: Icon(Icons.person),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: OptionItem(
                          onTap: () {},
                          title: "DFAsbafdb",
                          icon: Icon(Icons.person),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: OptionItem(
                          onTap: () {},
                          title: "DFAsbafdb",
                          icon: Icon(Icons.person),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: OptionItem(
                          onTap: () {},
                          title: "DFAsbafdb",
                          icon: Icon(Icons.person),
                        ),
                      )
                    ],
                  )
                ]),
              )
            ],
          ),
          _showingToolbar
              ? SizedBox(
                  height: 94,
                  child: AppBar(
                    backgroundColor: Colors.black,
                    titleSpacing: 0,
                    toolbarHeight: 70,
                    leadingWidth: 70,
                    title: Text(user!.username ?? ""),
                    leading: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          print('clicker');
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
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(50)),
                        child: Icon(Icons.search),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 16),
                        width: 38,
                        decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(50)),
                        child: Icon(Icons.sort),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
