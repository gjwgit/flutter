/// Demonstrate a single page with an [Image] asset.
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

class MyImageAsset extends StatelessWidget {
  const MyImageAsset({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demonstrating an Image Widget From The Assets Library"),
      ),
      body: Center(
        child: Image.asset(image),
      ),
    );
  }
}
