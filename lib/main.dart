/// Entry point for the application.
///
/// Copyright (C) 2023,  Graham Williams
///
/// License: https://www.gnu.org/licenses/quick-guide-gplv3.html
//
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
//
/// Authors: Graham Williams

import 'package:experience/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'; // defaultTargetPlatform
import 'package:window_size/window_size.dart'; // setWindowTitle()

/// The main() entry point.

void main() {
  runApp(const MyExperience());
}

/// An app to demonstrate the functionality of flutter.

class MyExperience extends StatelessWidget {
  const MyExperience({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    // Set the window title for the desktop apps approriately.

    if (defaultTargetPlatform == TargetPlatform.linux ||
        defaultTargetPlatform == TargetPlatform.macOS ||
        defaultTargetPlatform == TargetPlatform.windows) {
      setWindowTitle(APP_WINDOW_TITLE);
    }

    // TODO The home page will be a grid of buttons to select the different
    // experiments. For now randomly select an experiment to display.

    final home;

    if (DateTime.now().second.isEven) {
      home = MyImageAssetWidget();
    } else {
      home = MyCounterPage(title: APP_TITLE);
    }

    return MaterialApp(
      title: 'MyExperience',
      theme: ThemeData(
        // Theme for the application.

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      home: home,
      //home: const MyImageAssetWidget(),
      //home: const MyCounterPage(title: APP_TITLE),

      debugShowCheckedModeBanner: false,
    );
  }
}

// TODO into it's own file and a button in the home page grid to select it.

/// The flutter default counter demo.

class MyCounterPage extends StatefulWidget {
  const MyCounterPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyCounterPage> createState() => _MyCounterPageState();
}

class _MyCounterPageState extends State<MyCounterPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyCounterPage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// TODO into it's own file and a button in the home page grid to select it.

/// Demonstrate a single page widget containing an image.

class MyImageAssetWidget extends StatelessWidget {
  const MyImageAssetWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset('assets/images/FrontPanel.png'),
    );
  }
}
