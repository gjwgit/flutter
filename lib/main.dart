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

import 'dart:io' show Platform;

import 'package:flutter/material.dart';

//import 'package:window_size/window_size.dart'; // setWindowTitle()
import 'package:window_manager/window_manager.dart';

import 'package:experience/constants/app_constants.dart';
import 'package:experience/pages/my_home.dart';
import 'package:experience/pages/my_counter.dart';
import 'package:experience/pages/my_button_grid.dart';
import 'package:experience/pages/my_button_grid_builder.dart';
import 'package:experience/pages/my_sliver_button_grid.dart';
import 'package:experience/pages/my_text.dart';
import 'package:experience/pages/my_image_asset.dart';

/// The main() entry point.

void main() async {
  // Handle Desktop and Mobile apps.

  bool isDesktop = Platform.isLinux || Platform.isMacOS || Platform.isWindows;

  // Perform the window manager tuning before the call to runApp so the user
  // will not see a lag in the UI.

  if (isDesktop) {
    // To set things up for the windowManager from the window_manager package,
    // in order to set the method call handler before the binary messenger has
    // been initialized, as when you call setMethodCallHandler() before the
    // WidgetsFlutterBinding has been initialized, or setWindowTitle() from the
    // window_size package, we need to ensure the WidgetsFlutterBinding is
    // initialized. MOVE THIS TO THE CHAPTER

    WidgetsFlutterBinding.ensureInitialized();

    await windowManager.ensureInitialized();

    WindowOptions windowOptions = WindowOptions(
      // It is not usually desirable to set alwaysOnTop but for testing when it
      // might otherwise be hidden below other windows I force this to be the
      // case. COMMENT ON THIS IN THE CHAPTER

      alwaysOnTop: true,
      size: Size(1280, 720),
      title: APP_TITLE,

      // Other options are available: PUT THIS INTO THE CHAPTER

      // center: true,
      // backgroundColor: Colors.transparent,
      // skipTaskbar: false,
      // titleBarStyle: TitleBarStyle.hidden,
    );

    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
      // Turn this off now so it is not always on top, but is when the app
      // starts. Must be a better approach but this works for now.
      await windowManager.setAlwaysOnTop(false);
    });
  }

  // An alternative way to just set the window title for the desktop apps
  // approriately is this from the window_size package which is not available on
  // pub.dev. REMOVE FROM HERE AND KEEP IN FLUTTER CHAPTER

  // if (isDesktop) {
  //   setWindowTitle(APP_WINDOW_TITLE);
  // }

  runApp(const MyExperienceApp());
}

/// An app to demonstrate the functionality of flutter.

class MyExperienceApp extends StatelessWidget {
  const MyExperienceApp({super.key});

  // The root of the application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: APP_NAME,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: MyButtonGridBuilder(title: APP_TITLE),
      home: MyHomePage(),
    );
  }
}
