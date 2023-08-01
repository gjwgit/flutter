/// Demonstrate a single widget containing an image.
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
// import 'package:flutter/foundation.dart'; // defaultTargetPlatform

// import 'package:window_size/window_size.dart'; // setWindowTitle()

// import 'package:experience/constants/app_constants.dart';
// import 'package:experience/presentation/widgets/my_text_widget.dart';

class MyImageAssetWidget extends StatelessWidget {
  const MyImageAssetWidget({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(image),
    );
  }
}
