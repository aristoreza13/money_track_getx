import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_track_getx/app/modules/home/views/home_view.dart';
import 'package:money_track_getx/app/modules/profile/views/profile_view.dart';
import 'package:money_track_getx/app/modules/stats/views/stats_view.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  RxInt selectedIndex = 0.obs;
  static final List<Widget> _widgetOptions = <Widget>[
    // const Text("Home"),
    const HomeView(),
    const StatsView(),
    const Text("Schedule"),
    const ProfileView(),
  ];

  void _onItemTapped(int index) {
    selectedIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Center(
          child: _widgetOptions[selectedIndex.value],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: BottomNavigationBar(
            currentIndex: selectedIndex.value,
            onTap: _onItemTapped,
            elevation: 10,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Colors.blueGrey,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: const Color(0xFF526480),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
                  activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(FluentSystemIcons.ic_fluent_book_formula_statistics_regular),
                  activeIcon: Icon(FluentSystemIcons.ic_fluent_book_formula_statistics_filled),
                  label: "Stats"),
              BottomNavigationBarItem(
                  icon: Icon(FluentSystemIcons.ic_fluent_calendar_date_regular),
                  activeIcon: Icon(FluentSystemIcons.ic_fluent_calendar_date_filled),
                  label: "Schedule"),
              BottomNavigationBarItem(
                  icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
                  activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
                  label: "Profile"),
            ],
          ),
        ),
      ),
    );
  }
}
