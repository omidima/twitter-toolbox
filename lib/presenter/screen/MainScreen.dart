import 'package:flutter/material.dart';
import 'package:twitter_tools/data/dto/UserResponse.dart';
import 'package:twitter_tools/data/repository/UserRepository.dart';

import 'ProfilePage.dart';
part  '../view_model/MainScreenViewModel.dart';


class MainScreen extends StatefulWidget {
  static MaterialPageRoute route() => MaterialPageRoute(
        builder: (context) => const MainScreen(),
      );
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isSubmitEnable = true;
  bool _isLoading = false;
  User? _user;
  String username = "";
  late MainScreenViewModel viewModel;

  @override
  void initState() {
    viewModel =  MainScreenViewModel(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Twitter ToolBox", style: TextStyle(color: Colors.blueGrey),),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              const SizedBox(height: 52,),
              Image.asset('assets/Twitter_Logo.png', width: 100,),
              const SizedBox(height: 30,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(' Inter page username. (not need to password)'),
                  const SizedBox(height: 16,),
                  TextFormField(
                    onChanged: (value) {
                      if (!isSubmitEnable){
                        setState(() {
                          isSubmitEnable = true;
                        });
                      }
                      username = value;
                    },
                    decoration:const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('username:'),
                      helperText: 'exp: omid8144'
                    ),
                  )
                ],
              ),
              _isLoading ? const CircularProgressIndicator() :
              _user != null ? Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xff000000),
                        offset: Offset(0, 0.1))
                  ],
                  // border: Border(bottom: BorderSide(color: Colors.black87,width: 1))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(
                                _user!.profile_image_url ?? "",
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
                                _user!.username ?? "",
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                _user!.name ?? "",
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.normal),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 8,),
                    Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: Text(_user?.description ?? ""),
                    ),
                    const SizedBox(height: 10,),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, ProfilePage.route(username));
                      },
                      splashColor: Colors.blue,
                      child: Container(
                        height: 38,
                        padding:const EdgeInsets.symmetric(horizontal: 5, vertical: 5).copyWith(left: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.blue, width: 2)
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('Go to Profile!'),
                            const SizedBox(width: 10,),
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(50)),
                              child:const Icon(Icons.arrow_forward, size: 16,color: Colors.white,),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ) : Container(),

              const SizedBox(height: 70,)
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        margin: const EdgeInsets.all(12),
        child: MaterialButton(
          onPressed: isSubmitEnable ? () {
            viewModel.getUserInformation(username);
          } : null,
          height: 52,
          minWidth: double.infinity,
          color: Colors.blue,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: const Text('Check username', style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}
