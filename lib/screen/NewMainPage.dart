import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';

//import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:runrun/widget/colors.dart';

//import 'package:runrun/screen/presetting.dart';
//import 'package:runrun/screen/clear.dart';
//import 'package:runrun/widget/sizes.dart';
//import 'package:runrun/widget/text.dart';
import 'package:runrun/screen/NewBody.dart';
import 'package:runrun/screen/NewHeader.dart';
import 'package:runrun/screen/NewHooter.dart';

void main() {
  runApp(const NewMainPage());
}

class NewMainPage extends StatelessWidget {
  const NewMainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          NewHeader(),
          NewBody(),
          NewFooter(),

        ],
      ),
    );

  }}
