import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram/constants/commom_size.dart';
import 'package:instagram/widget/comment.dart';
import 'package:instagram/widget/rounded_avatar.dart';

import 'my_progress_indicator.dart';

class Post extends StatelessWidget {
  final int index;
  late Size size;

  Post(
    this.index, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    var _postImage = CachedNetworkImage(
      imageUrl: 'https://picsum.photos/id/$index/2000/3000',
      placeholder: (BuildContext context, String url) {
        return MyProgressIndicator(
          containerSize: size.width,
        );
      },
      imageBuilder: (BuildContext context, ImageProvider imageProvider) {
        return AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              image:
                  DecorationImage(image: imageProvider, fit: BoxFit.scaleDown),
            ),
          ),
        );
      },
    );

    Widget _postHeader() {
      return Row(
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.all(common_xxs_gap),
            child: RoundedAvatar(),
          ),
          Expanded(child: Text('username')),
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.more_horiz,
              color: Colors.black87,
            ),
          )
        ],
      );
    }

    var _postActions = Row(
      children: const [
        IconButton(
          onPressed: null,
          icon: ImageIcon(
            AssetImage('assets/images/heart_selected.png'),
            color: Colors.black87,
          ),
        ),
        IconButton(
          onPressed: null,
          icon: ImageIcon(
            AssetImage('assets/images/comment.png'),
            color: Colors.black87,
          ),
        ),
        IconButton(
          onPressed: null,
          icon: ImageIcon(
            AssetImage('assets/images/direct_message.png'),
            color: Colors.black87,
          ),
        ),
        Spacer(),
        IconButton(
          onPressed: null,
          icon: ImageIcon(
            AssetImage('assets/images/bookmark.png'),
            color: Colors.black87,
          ),
        ),
      ],
    );

    var _postLikes = const Padding(
      padding: EdgeInsets.only(left: common_gap),
      child: Text(
        '12000 likes',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    Widget _postCpation() {
      return const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: common_gap,
          vertical: common_xxs_gap,
        ),
        child: Comment(
          showImage: false,
          username: 'useraname111',
          text: 'I love myself!!',
          dateTime: null,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _postHeader(),
        _postImage,
        _postActions,
        _postLikes,
        _postCpation()
      ],
    );
  }
}
