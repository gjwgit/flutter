/// Demo of Pre-Flutter 3.13 WidgetsBindingObserver
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
//
/// See https://kazlauskas.dev/flutter-app-lifecycle-listener-overview/
///
/// Authors: Graham Williams

import 'package:flutter/material.dart';

class AppLifecyclePageOld extends StatefulWidget {
  const AppLifecyclePageOld({super.key});

  @override
  State<AppLifecyclePageOld> createState() => _AppLifecyclePageOldState();
}

class _AppLifecyclePageOldState extends State<AppLifecyclePageOld>
    // Use the WidgetsBindingObserver mixin
    with
        WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();

    // Register your State class as a binding observer
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // Unregister your State class as a binding observer
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  // Override the didChangeAppLifecycleState method and
  // listen to the app lifecycle state changes
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.detached:
        _onDetached();
      case AppLifecycleState.resumed:
        _onResumed();
      case AppLifecycleState.inactive:
        _onInactive();
      case AppLifecycleState.hidden:
        _onHidden();
      case AppLifecycleState.paused:
        _onPaused();
    }
  }

  void _onDetached() => print('state changed: detached');

  void _onResumed() => print('state changed: resumed');

  void _onInactive() => print('state changed: inactive');

  void _onHidden() => print('state changed: hidden');

  void _onPaused() => print('state changed: paused');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo of Old State Pre-Flutter 3.13"),
      ),
      body: Center(
        child: Text("Open and close the window and watch console messages."),
      ),
    );
  }
}
