import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:runrun/widget/colors.dart';
import 'package:runrun/widget/sizes.dart';
import 'package:runrun/screen/presetting.dart';
import 'package:runrun/screen/clear.dart';
//import 'package:runrun/screen/MainPage.dart';
//import 'package:runrun/screen/MainPageBody.dart';
//import 'package:runrun/screen/MainPageHeader.dart';

//進捗、残り距離

class MainPageHeader extends StatelessWidget {
  const MainPageHeader({
    super.key,
  });


@override
Widget build(BuildContext context) {
  return Center(
    child: Stack(
      alignment: Alignment.center, //中央に重ねるやつ
      children: [
        Container(
          height: 100,
          width: 500,
          color: MyColors.Rgreen,
        ),
      ],
    ),
  );
}
}