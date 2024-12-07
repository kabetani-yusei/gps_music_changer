import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: 'flutter_map 拡大縮小ボタン'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final MapController _mapController = MapController();
  double _zoom = 13.0; // 初期ズームレベル
  LatLng _center = LatLng(35.170915, 136.881537); // 初期中心座標

  // ズームインの処理
  void _zoomIn() {
    setState(() {
      _zoom = (_zoom + 1).clamp(8.0, 18.0); // ズームイン
      _mapController.move(_center, _zoom);
    });
  }

  // ズームアウトの処理
  void _zoomOut() {
    setState(() {
      _zoom = (_zoom - 1).clamp(8.0, 18.0); // ズームアウト
      _mapController.move(_center, _zoom);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              crs: Epsg3857(),
              initialCenter: _center,  // 初期中心座標
              initialZoom: _zoom,      // 初期ズームレベル
              maxZoom: 18.0,          // 最大ズーム
              minZoom: 8.0,           // 最小ズーム
              onTap: (tapPosition, point) {
                setState(() {
                  _center = point;  // タップした場所を中心に設定
                  _mapController.move(point, _zoom); // 中心とズームレベルを更新
                });
              },
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    width: 30.0,
                    height: 30.0,
                    point: _center,
                    child: const Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 50,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            right: 10,
            top: 80,
            child: Column(
              children: [
                FloatingActionButton(
                  onPressed: _zoomIn,
                  child: const Icon(Icons.zoom_in),
                  heroTag: null, // HeroTagのエラー防止
                ),
                const SizedBox(height: 10),
                FloatingActionButton(
                  onPressed: _zoomOut,
                  child: const Icon(Icons.zoom_out),
                  heroTag: null, // HeroTagのエラー防止
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
