import 'package:flutter/material.dart';
import 'package:runrun/widget/colors.dart';


class NewHeader extends StatelessWidget {
  const NewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1000,

        child:

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


    );
  }
}