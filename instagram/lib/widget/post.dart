import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram/constants/commom_size.dart';

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
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(common_xxs_gap),
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: 'https://picsum.photos/100',
                width: avatar_size,
                height: avatar_size,
              ),
            ),
          ),
          const Expanded(child: Text('username')),
          const IconButton(
            onPressed: null,
            icon: Icon(
              Icons.more_horiz,
              color: Colors.black87,
            ),
          )
        ],
      );
    }

    return Column(
      children: [
        _postHeader(),
        _postImage,
      ],
    );
  }
}
