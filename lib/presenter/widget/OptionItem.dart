import 'package:flutter/material.dart';

class OptionItem extends StatelessWidget {
  Icon icon;
  String title;
  Function() onTap;
  OptionItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(
            boxShadow:const [BoxShadow(
              color: Colors.black38,
            )],
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          children: [
            icon,
            const SizedBox(height: 10,),
            Text(title)
          ],
        ),
      ),
    );
  }
}
