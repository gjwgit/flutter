/// A grid of buttons for the wolt demos.
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
import 'package:experience/wolt/wolt_modal.dart';
import 'package:experience/wolt/wolt_coffee.dart';

class WoltButtons extends StatelessWidget {
  const WoltButtons({super.key});

  final String title = "Wolt Package Sampler";

  final List<Map<String, String>> pages = const [
    const {'title': 'Modal', 'widget': 'WoltModal'},
    const {'title': 'Coffee', 'widget': 'WoltCoffee'},
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
    case 'WoltModal':
      return WoltModal();

    case 'WoltCoffee':
      return WoltCoffee();

    default:
      throw Exception('WoltButtons: Invalid widget name');
  }
}
