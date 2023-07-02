import 'package:catelog_app/models/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ThemeChanger extends StatelessWidget {
  const ThemeChanger({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        top: 10,
        right: 10,
        child: ToggleSwitch(
          initialLabelIndex: ThemeManager.index,
          activeFgColor: Colors.white,
          inactiveBgColor: Colors.grey,
          inactiveFgColor: Colors.white,
          totalSwitches: 3,
          icons: const [
            CupertinoIcons.moon,
            CupertinoIcons.sun_max,
            CupertinoIcons.device_phone_portrait
          ],
          minWidth: 50,
          minHeight: 30,
          labels: const ["", "", ""],
          onToggle: (index) {
            ThemeMutation(index);
          },
        ),
      ),
    ]);
  }
}
