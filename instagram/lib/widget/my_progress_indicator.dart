import 'package:flutter/material.dart';

class MyProgressIndicator extends StatelessWidget {
  const MyProgressIndicator(
      {Key? key, this.containerSize = 60, this.progressSize = 60})
      : super(key: key);

  final double containerSize;
  final double progressSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerSize,
      height: containerSize,
      child: SizedBox(
        height: progressSize,
        width: progressSize,
        child: Image.asset('assets/images/loading_img.gif'),
      ),
    );
  }
}
