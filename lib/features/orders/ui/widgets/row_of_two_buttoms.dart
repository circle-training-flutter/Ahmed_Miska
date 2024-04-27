import 'package:flutter/material.dart';

import 'current_and_previous_buttom.dart';

class RowOfTwoButtoms extends StatefulWidget {
  final void Function(String type)? onTap;
  const RowOfTwoButtoms({
    super.key, this.onTap,
  });

  @override
  State<RowOfTwoButtoms> createState() => _RowOfTwoButtomsState();
}

class _RowOfTwoButtomsState extends State<RowOfTwoButtoms> {
  bool checkFirst = true;
  bool checkSecond = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            if (!checkFirst) {
              setState(() {
                checkFirst = true;
                checkSecond = false;
              });
            }
            widget.onTap!('new');
          },
          child: CurrentAndPreviosButtom(
            title: 'current',
            check: checkFirst,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            if (!checkSecond) {
              setState(() {
                checkFirst = false;
                checkSecond = true;
              });
            }
            widget.onTap!('old');
          },
          child: CurrentAndPreviosButtom(
            title: 'previous',
            check: checkSecond,
          ),
        ),
      ],
    );
  }
}
