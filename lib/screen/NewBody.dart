import 'package:flutter/material.dart';
import 'package:runrun/widget/colors.dart';


class NewBody extends StatelessWidget {
  const NewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return


    Expanded(
      child: Container(
        color: MyColors.Rgreen,
        child: ElevatedButton(
          onPressed: () {},
          child: Text('ランニングをやめる'),
        ),

      ),
    );
  }
}




