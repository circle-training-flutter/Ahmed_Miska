import 'package:flutter/material.dart';

import 'choose_city_row.dart';

class ListviewOfChooseCity extends StatefulWidget {
  const ListviewOfChooseCity({Key? key}) : super(key: key);

  @override
  State<ListviewOfChooseCity> createState() => _ListviewOfChooseCityState();
}

class _ListviewOfChooseCityState extends State<ListviewOfChooseCity> {
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
          child: ChooseCityRow(
            text: index == 0 ? 'cairo' : 'menoufia',
            isChecked: _index == index ? true : false,
          ),
        );
      },
    );
  }
}
