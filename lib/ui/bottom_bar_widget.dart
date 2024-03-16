import 'package:bosszp/model/Appearance.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomBarWidget extends StatelessWidget {
  final List<(String, String)> items;
  BottomBarWidget(
      {super.key, required TabController tabController, required this.items})
      : _tabController = tabController,
        bars = items
            .map((e) => BottomNavigationBarItem(
                icon: Image.asset(
                    width: 45, height: 45, "assets/images/webp/${e.$1}.webp"),
                label: "${e.$2}"))
            .toList();

  final TabController _tabController;
  final List<BottomNavigationBarItem> bars;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      child: StatefulBuilder(builder: (context, setState) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _tabController.animateTo(index);
            });
          },
          currentIndex: _tabController.index,
          selectedItemColor: context.read<Appearance>().blueColor,
          unselectedItemColor: Color.fromARGB(255, 6, 5, 5),
          selectedFontSize: 12,
          unselectedFontSize: 12,
          items: bars,
        );
      }),
    );
  }
}
