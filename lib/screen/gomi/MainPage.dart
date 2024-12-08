import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';

//import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:runrun/widget/colors.dart';

//import 'package:runrun/screen/presetting.dart';
//import 'package:runrun/screen/clear.dart';
//import 'package:runrun/widget/sizes.dart';
//import 'package:runrun/widget/text.dart';
import 'package:runrun/screen/NewBody.dart';
import 'package:runrun/screen/NewHeader.dart';
import 'package:runrun/screen/NewHooter.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Column(
      children: [
        SizedBox(
          width: 1000,
          child: Column(
            children: [
              SizedBox(
                height: 100,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: MyColors.Rred,
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: Container(
                        color: MyColors.Rpurple,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),


        Expanded(
          child: Container(
            color: MyColors.Rgreen,
          ),
        ),


        SizedBox(
          height: 100,
          child: Container(
            color: MyColors.Rblue,
          ),
        ),
      ],
    ),
    );

  }}
