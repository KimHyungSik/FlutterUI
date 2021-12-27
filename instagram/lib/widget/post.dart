import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Post extends StatelessWidget {

  final int index;
  late Size size;

  Post(
    this.index,{
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    size ??= MediaQuery.of(context).size;

    return CachedNetworkImage(
      imageUrl: 'https://picsum.photos/id/$index/2000/3000',
      placeholder: (BuildContext context, String url){
        return SizedBox(
          height: size.width, 
          width: size.height, 
          child: const CircularProgressIndicator(
          backgroundColor: Colors.black87,
        )
        )
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
  }
}
