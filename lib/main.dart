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
import 'package:experience/pages/my_counter.dart';
import 'package:experience/pages/my_button_grid.dart';
import 'package:experience/pages/my_button_grid_builder.dart';
import 'package:experience/pages/my_sliver_button_grid.dart';
import 'package:experience/pages/my_text.dart';
import 'package:experience/pages/my_image_asset.dart';

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

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: APP_NAME,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyButtonGridBuilder(title: APP_TITLE),
    );
  }
}
