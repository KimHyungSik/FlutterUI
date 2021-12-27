import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/widget/post.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        leading: const IconButton(
          onPressed: null,
          icon: Icon(
            CupertinoIcons.camera,
            color: Colors.black87,
          ),
        ),
        middle: const Text(
          'instagram',
          style: TextStyle(fontFamily: 'VeganStyle', color: Colors.black87),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            IconButton(
              onPressed: null,
              icon: ImageIcon(
                AssetImage('assets/images/actionbar_camera.png'),
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemBuilder: _feedListBuild,
        itemCount: 30,
      ),
    );
  }

  Widget _feedListBuild(BuildContext context, int index) {
    return Post(
      index: index,
    );
  }
}
