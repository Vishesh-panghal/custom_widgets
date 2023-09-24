// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:animated_bottom_navigation_bar/utils/rive_utils.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<TabItem> _icons = TabItem.tabItemsList;

  int _selectedTab = 0;

  void _onRiveIconInit(Artboard artboard, index) {
    final controller = StateMachineController.fromArtboard(
        artboard, _icons[index].stateMachine);
    artboard.addController(controller!);

    _icons[index].status = controller.findInput<bool>("active") as SMIBool;
  }

  void onTabPress(int index) {
    if (_selectedTab != index) {
      setState(() {
        _selectedTab = index;
      });

      _icons[index].status!.change(true);
      Future.delayed(const Duration(seconds: 1), () {
        _icons[index].status!.change(false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(100, 83, 76, 76),
      bottomNavigationBar: Container(
        height: 70,
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(horizontal: 4, vertical: 30),
        decoration: BoxDecoration(
            color: Color.fromARGB(220, 0, 0, 0),
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_icons.length, (index) {
            TabItem icon = _icons[index];

            return InkWell(
              onTap: () {
                onTabPress(index);
              },
              child: AnimatedOpacity(
                opacity: _selectedTab == index ? 1 : 0.5,
                duration: const Duration(milliseconds: 200),
                child: SizedBox(
                  height: 96,
                  width: 36,
                  child: RiveAnimation.asset(
                    'assets/Rive/Icons.riv',
                    stateMachines: [icon.stateMachine],
                    artboard: icon.artboard,
                    onInit: (artboard) {
                      _onRiveIconInit(artboard, index);
                    },
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
