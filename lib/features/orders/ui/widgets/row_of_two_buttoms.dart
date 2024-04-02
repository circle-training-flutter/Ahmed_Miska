import 'package:flutter/material.dart';

import 'current_and_previous_buttom.dart';

class RowOfTwoButtoms extends StatefulWidget {
  const RowOfTwoButtoms({
    super.key,
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
