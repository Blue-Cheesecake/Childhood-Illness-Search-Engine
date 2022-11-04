import 'package:flutter/material.dart';

class ProfileBar extends StatelessWidget {
  const ProfileBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset("assets/images/ellipse.png"),
              Image.asset("assets/images/me_profile.png"),
            ],
          )
        ],
      ),
    );
  }
}
