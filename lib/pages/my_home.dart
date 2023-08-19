/// A home page with a bottom bar for navigating.
///
/// Copyright (C) 2023, Graham Williams
///
/// License: https://www.gnu.org/licenses/quick-guide-gplv3.html
///
// This program is free software: you can redistribute it and/or modify it under
// the terms of the GNU General Public License as published by the Free Software
// Foundation, either version 3 of the License, or (at your option) any later
// version.
//
// This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
// FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
// details.
///
/// Authors: Graham Williams

import 'package:flutter/material.dart';

import 'package:experience/constants/app.dart';
import 'package:experience/pages/app_lifecycle_buttons.dart';
import 'package:experience/pages/my_counter.dart';
import 'package:experience/pages/my_button_grid.dart';
import 'package:experience/pages/my_button_grid_builder.dart';
import 'package:experience/pages/my_sliver_button_grid.dart';
import 'package:experience/pages/my_text.dart';
import 'package:experience/pages/my_image_asset.dart';
import 'package:experience/wolt/wolt_buttons.dart';

const NAV_SELECTED = Color(0xFFFF8F00);
const NAV_UNSELECTED = Color(0xDF898884);

//import 'package:experience/presentation/widgets/navigation_bar/navigation_bar.dart';
//import 'package:experience/presentation/widgets/widget_option/widget_options.dart';

/// A page to display app information, intended as the home page.

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedBottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: pageSelector(
          context,
          (index) {
            setState(() {
              _selectedBottomNavIndex = index;
            });
          },
        ).elementAt(_selectedBottomNavIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedBottomNavIndex,
        items: bottomNavigationBarItems,
        selectedItemColor: NAV_SELECTED,
        unselectedItemColor: NAV_UNSELECTED,
        showUnselectedLabels: true,
        onTap: (int index) {
          setState(() {
            _selectedBottomNavIndex = index;
          });
        },
      ),
    );
  }
}

/// A List of [BottomNavigationBarItem] used in the navigation
/// bar at the bottom of the App.

final List<BottomNavigationBarItem> bottomNavigationBarItems = [
  const BottomNavigationBarItem(
    icon: Icon(
      Icons.home,
      color: Colors.teal,
      semanticLabel: 'Click to return to the home page.',
    ),
    label: "Buttons",
  ),
  const BottomNavigationBarItem(
    icon: Icon(
      Icons.format_align_justify_rounded,
      color: Colors.red,
    ),
    label: "Text",
  ),
  const BottomNavigationBarItem(
    icon: Icon(
      Icons.image,
      color: Colors.purple,
    ),
    label: "Image",
  ),
  // When I add a fourth item to the navigation bar it greys all icons. Had to
  // specifically set the colour.
  const BottomNavigationBarItem(
    icon: Icon(
      Icons.directions,
      color: Colors.blue,
    ),
    label: "Counter",
  ),
  const BottomNavigationBarItem(
    icon: Icon(
      Icons.directions,
      color: Colors.pink,
    ),
    label: "Wolt",
  ),
  const BottomNavigationBarItem(
    icon: Icon(
      Icons.beach_access,
      color: Colors.green,
      size: 24,
    ),
    label: "State",
  ),
];

/// List of pages to display as per the nav bar items.

List<Widget> pageSelector(BuildContext context, Function(int) onTap) {
  return [
    MyButtonGridBuilder(title: "A Button Grid"),
    MyText(title: "A Text Widget"),
    MyImageAsset(title: "An Image Widget", image: APP_IMAGE),
    MyCounter(),
    WoltButtons(),
    AppLifecycleButtons(),
  ];
}
