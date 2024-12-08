import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:runrun/widget/colors.dart';
import 'package:runrun/widget/sizes.dart';
import 'package:runrun/screen/presetting.dart';
import 'package:runrun/screen/clear.dart';
//import 'package:runrun/screen/MainPage.dart';
//import 'package:runrun/screen/MainPageBody.dart';
//import 'package:runrun/screen/MainPageHeader.dart';
import 'package:runrun/screen/NewMainPage.dart';

  void main() {
    runApp(const runrun());
  }

  class runrun extends StatelessWidget {
    const runrun({super.key});

    @override
    Widget build(BuildContext context) {
      return const MaterialApp(
          home:NewMainPage(),
      );
    }
  }


