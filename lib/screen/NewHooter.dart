import 'package:flutter/material.dart';
import 'package:runrun/widget/colors.dart';

class NewFooter extends StatefulWidget {
  const NewFooter({super.key});

  @override
  State<NewFooter> createState() => _NewFooterState();
}

class _NewFooterState extends State<NewFooter>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Container(
        color: MyColors.RlightGrey,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 左側の画像
            Image.asset(
              'assets/images/600x600bb-60.jpg',
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),

            Expanded(
              child: Container(
                child: Container(
                  margin: EdgeInsets.all(10),
                child: Text(
                    'Music 1',
                  style: TextStyle(

                  ),
                ),
              ),
            ),
            ),

            // アニメーションアイコンボタン
            IconButton(
              icon: AnimatedIcon(
                icon: AnimatedIcons.play_pause,
                progress: _controller,
              ),
              iconSize: 50,
              onPressed: () {
                // ボタンを押すとアニメーションを開始/停止
                if (_controller.isCompleted) {
                  _controller.reverse();
                } else {
                  _controller.forward();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
