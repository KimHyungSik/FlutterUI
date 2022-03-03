import 'package:flutter/material.dart';
import 'package:instagram/constants/commom_size.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _appbar(),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        _username(),
                        _userBio(),
                        _editProfileBtn(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _editProfileBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap),
      child: SizedBox(
        height: 24,
        child: OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6))),
          child: const Text(
            "Edit Profile",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Row _appbar() {
    return Row(
      children: [
        const SizedBox(
          width: 40,
        ),
        const Expanded(
            child: Text(
          "The Kim",
          textAlign: TextAlign.center,
        )),
        IconButton(onPressed: () => {}, icon: const Icon(Icons.menu))
      ],
    );
  }

  Widget _username() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: common_gap),
      child: Text("userName", style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _userBio() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: common_gap),
      child: Text("this is what I belive!!",
          style: TextStyle(fontWeight: FontWeight.w400)),
    );
  }
}
