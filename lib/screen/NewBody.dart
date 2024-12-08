import 'package:flutter/material.dart';
import 'package:runrun/widget/colors.dart';  // MyColors.Rgreen
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'dart:async';

class NewBody extends StatefulWidget {
  const NewBody({super.key});

  @override
  _NewBodyState createState() => _NewBodyState();
}

class _NewBodyState extends State<NewBody> {
  List<Marker> trailMarkers = []; // 通過した地点を保存するリスト
  LatLng blueMarkerPosition = const LatLng(35.170915, 136.881537); // 青丸の初期位置
  Timer? _timer;

  void _startMovingBlueMarker() {
    _timer ??= Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        // 青丸の現在位置を通過地点リストに追加
        trailMarkers.add(
          Marker(
            width: 15.0,
            height: 15.0,
            point: blueMarkerPosition,
            child: const Icon(
              Icons.circle,
              color: Colors.black,
              size: 10,
            ),
          ),
        );

        // 青丸の位置を北方向に更新
        blueMarkerPosition = LatLng(
          blueMarkerPosition.latitude + 0.0002, // 緯度を少しずつ増加
          blueMarkerPosition.longitude,
        );
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _startMovingBlueMarker(); // 初期化時にタイマーを開始
  }

  @override
  Widget build(BuildContext context) {
    return
      Stack(

      children: [
        // 緑色の長方形
        Container(
          width: 500,
          color: MyColors.Rgreen,
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(10),
                ),
                onPressed: () {},
                child: Text('ランニングをやめる'),
              ),
            ),
          ),
        ),
        // 地図ウィジェットを緑色の長方形の前面に表示
        Positioned.fill(
          child: FlutterMap(
            options: MapOptions(
              initialCenter: const LatLng(35.170915, 136.881537),
              initialZoom: 14.0,
              maxZoom: 18.0,
              minZoom: 12.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              ),
              MarkerLayer(
                markers: [
                  // 初期位置の赤いピン
                  const Marker(
                    width: 30.0,
                    height: 30.0,
                    point: LatLng(35.170915, 136.881537),
                    child: Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 50,
                    ),
                  ),
                  // 通過地点の白丸
                  ...trailMarkers,
                  // 現在の青丸
                  Marker(
                    width: 30.0,
                    height: 30.0,
                    point: blueMarkerPosition,
                    child: const Icon(
                      Icons.circle,
                      color: Colors.blue,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
