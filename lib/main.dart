/// Entry point for the application.
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
import 'package:flutter/foundation.dart'; // defaultTargetPlatform

import 'package:window_size/window_size.dart'; // setWindowTitle()

import 'package:experience/constants/app_constants.dart';
import 'package:experience/presentation/pages/my_counter_page.dart';
import 'package:experience/presentation/widgets/my_text_widget.dart';
import 'package:experience/presentation/widgets/my_image_asset_widget.dart';

/// The main() entry point.

void main() {
  runApp(const MyExperienceApp());
}

/// An app to demonstrate the functionality of flutter.

class MyExperienceApp extends StatelessWidget {
  const MyExperienceApp({super.key});

  // The root of the application.

  @override
  Widget build(BuildContext context) {
    // Set the window title for the desktop apps approriately.

    const desktop = [
      TargetPlatform.linux,
      TargetPlatform.macOS,
      TargetPlatform.windows
    ];

    if (desktop.contains(defaultTargetPlatform)) {
      setWindowTitle(APP_WINDOW_TITLE);
    }

    // TODO The home page will be a grid of buttons to select the different
    // experiments. For now randomly select an experiment to display.

    final choice = DateTime.now().millisecond % 10;

    print(choice);

    final home = switch (choice) {
      0 => MyTextWidget(title: APP_TITLE),
      1 => MyImageAssetWidget(image: APP_IMAGE),
      _ => MyCounterPage(title: APP_TITLE)
    };

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: APP_NAME,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: home,
    );
  }
}
