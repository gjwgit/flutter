/// Demo of Flutter 3.13 AppLifecycleListener
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
/// See https://kazlauskas.dev/flutter-app-lifecycle-listener-overview/
///
/// Authors: Graham Williams

import 'package:flutter/material.dart';

class AppLifecyclePageNew extends StatefulWidget {
  const AppLifecyclePageNew({super.key});

  @override
  State<AppLifecyclePageNew> createState() => _AppLifecyclePageNewState();
}

class _AppLifecyclePageNewState extends State<AppLifecyclePageNew> {
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();

    // Initialize the AppLifecycleListener class and pass callbacks
    _listener = AppLifecycleListener(
      onStateChange: _onStateChanged,
    );
  }

  @override
  void dispose() {
    // Do not forget to dispose the listener
    _listener.dispose();

    super.dispose();
  }

  // Listen to the app lifecycle state changes
  void _onStateChanged(AppLifecycleState state) {
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
        title: Text("Demo of New AppLifecycleState Flutter 3.13"),
      ),
      body: Center(
        child: Text("Open and close the window and watch console messages."),
      ),
    );
  }
}
