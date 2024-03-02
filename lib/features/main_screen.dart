import 'package:circletraning/features/setting/ui/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/helpers/consatants.dart';
import '../core/widgets/custom_buttom_icon.dart';
import 'category/ui/category_screen.dart';
import 'home/ui/home_screen.dart';
import 'map/ui/map_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    CategoryScreen(),
    MapScreen(),
    SettingScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: SizedBox(
        height: 64.h,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButtomIcon(
              onTap: () {
                _onItemTapped(0);
                // context.pushNamed(Routes.home);
              },
              icon: _selectedIndex == 0
                  ? AppIcons.homeIconSelected
                  : AppIcons.homeIcon,
            ),
            CustomButtomIcon(
              onTap: () {
                _onItemTapped(1);
              },
              icon: _selectedIndex == 1
                  ? AppIcons.categoryIconSelected
                  : AppIcons.categoryIcon,
            ),
            CustomButtomIcon(
              onTap: () {
                _onItemTapped(2);
              },
              icon: _selectedIndex == 2
                  ? AppIcons.mapIconSelected
                  : AppIcons.mapIcon,
            ),
            CustomButtomIcon(
              onTap: () {
                _onItemTapped(3);
              },
              icon: _selectedIndex == 3
                  ? AppIcons.settingsIconSelected
                  : AppIcons.settingsIcon,
            ),
          ],
        ),
      ),
    );
  }
}
