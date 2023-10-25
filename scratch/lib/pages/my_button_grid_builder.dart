/// A grid of buttons on a page aligned from the top left.
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

class MyButtonGridBuilder extends StatelessWidget {
  const MyButtonGridBuilder({super.key, required this.title});

  final String title;

  final List<Map<String, String>> pages = const [
    const {'title': 'Text', 'widget': 'MyText'},
    const {'title': 'Image', 'widget': 'MyImageAsset'},
    const {'title': 'Counter', 'widget': 'MyCounter'},
    const {'title': 'Wolt', 'widget': 'Wolt'},
    const {'title': 'State', 'widget': 'AppLifecycleButtons'},
    const {'title': 'Any', 'widget': 'MyRandom'},
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final columns = (screenWidth / 100).floor();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: GridView.builder(
          itemCount: pages.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 2,
          ),
          itemBuilder: (BuildContext context, int index) {
            return ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => _getPage(pages[index]['widget']!),
                  ),
                );
              },
              child: Text(pages[index]['title']!),
            );
          },
        ),
      ),
    );
  }
}

Widget _getPage(String widgetName) {
  switch (widgetName) {
    case 'MyText':
      return MyText(title: "Demonstrating a Text Widget");

    case 'MyImageAsset':
      return MyImageAsset(image: APP_IMAGE);

    case 'MyCounter':
      return MyCounter(title: "The Default Counter App");

    case 'Wolt':
      return WoltButtons();

    case 'AppLifecycleButtons':
      return AppLifecycleButtons();

    case 'MyRandom':
      final choice = DateTime.now().millisecond % 10;
      print(choice);
      switch (choice) {
        case >= 0 && <= 3:
          return MyCounter(title: APP_TITLE);
        case >= 4 && <= 6:
          return MyButtonGrid();
        case >= 7 && <= 8:
          return WoltButtons();
        default:
          return MySliverButtonGrid(title: APP_TITLE);
      }
      ;
    default:
      throw Exception('Invalid widget name');
  }
}

class MyOtherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Another Page'),
      ),
      body: Center(
        child: Text('This is another page'),
      ),
    );
  }
}
