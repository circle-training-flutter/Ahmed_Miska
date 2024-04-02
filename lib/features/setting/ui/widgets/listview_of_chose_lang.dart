import 'package:flutter/material.dart';

import 'chose_lang_row.dart';

class ListviewOfChoseLang extends StatefulWidget {
  const ListviewOfChoseLang({
    super.key,
  });

  @override
  State<ListviewOfChoseLang> createState() => _ListviewOfChoseLangState();
}

class _ListviewOfChoseLangState extends State<ListviewOfChoseLang> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(
              () {
                _index = index;
              },
            );
          },
          child: ChoseLanguageRow(
            text: index == 0 ? 'عربي' : 'English',
            isChecked: _index == index ? true : false,
          ),
        );
      },
    );
  }
}
