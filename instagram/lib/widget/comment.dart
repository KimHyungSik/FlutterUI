import 'package:flutter/material.dart';
import 'package:instagram/constants/commom_size.dart';
import 'package:instagram/widget/rounded_avatar.dart';

class Comment extends StatelessWidget {
  final bool showImage;
  final String username;
  final String text;
  final DateTime? dateTime;

  const Comment({
    Key? key,
    this.showImage = true,
    required this.username,
    required this.text,
    required this.dateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (showImage)
          const RoundedAvatar(
            size: 24,
          ),
        if (showImage)
          const SizedBox(
            width: common_xxs_gap,
          ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: username,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const TextSpan(text: '  '),
                  TextSpan(
                    text: text,
                    style: const TextStyle(color: Colors.black87),
                  ),
                ],
              ),
            ),
            if (dateTime != null)
              Text(
                dateTime.toString(),
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 10,
                ),
              )
          ],
        ),
      ],
    );
  }
}
