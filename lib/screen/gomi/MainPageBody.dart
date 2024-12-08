import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:runrun/widget/colors.dart';
import 'package:runrun/widget/sizes.dart';
import 'package:runrun/widget/text.dart';
import 'package:runrun/screen/presetting.dart';
import 'package:runrun/screen/clear.dart';
//import 'package:runrun/screen/MainPage.dart';
//import 'package:runrun/screen/MainPageBody.dart';
//import 'package:runrun/screen/MainPageHeader.dart';

//マップ、人、道、ランニングをやめるボタン

class MainPageBody extends StatelessWidget {
  const MainPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(

      child:
          //Stack(
          // alignment: Alignment.center, //中央に重ねるやつ
          //children: [
          // const Padding(padding: EdgeInsets.all(20.0)),
          Container(
        alignment: Alignment.topCenter,
        height: 500,
        width: 500,
        color: MyColors.Ryellow,


        child: Padding(
          padding: const EdgeInsets.all(16.0),

          child: ElevatedButton(
            child: const Text(Messages.stop),
            onPressed: () {},
          ),
          //],
        ),
      ),
    );
  }
}
