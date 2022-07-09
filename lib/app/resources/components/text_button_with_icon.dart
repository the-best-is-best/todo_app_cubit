import 'package:flutter/material.dart';
import 'package:todo_app/app/resources/styles_manger.dart';
import '../value_manger.dart';
import 'circular_icon.dart';
import 'my_text.dart';

class TextButtonIcon extends StatelessWidget {
  final String text;
  final IconData? iconData;

  const TextButtonIcon({Key? key, required this.text, this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Row(
        children: [
          MyText(label: text, textStyle: getRegularStyle()),
          const SizedBox(
            width: AppSize.ap4,
          ),
          CircularIcon(
            icon: iconData,
          ),
        ],
      ),
    );
  }
}
