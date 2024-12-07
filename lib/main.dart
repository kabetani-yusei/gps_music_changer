import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
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
      home: const MyHomePage(title: 'flutter_mapテスト'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  List<Marker> addMarkers = [];
  // MapControllerのインスタンス作成
  late final _animatedMapController = AnimatedMapController(vsync: this);

  void _addMarker(LatLng latlng) {
    setState(() {
      addMarkers.add(
        Marker(
          width: 30.0,
          height: 30.0,
          point: latlng,
          child: GestureDetector(
            onTap: () {
              _animatedMapController.animateTo(dest: latlng);
            },
            child: const Icon(
              Icons.location_on,
              color: Colors.blue,
              size: 50,
            ),
          ),
        ),
      );
    });
  }

  void _showAlert(LatLng latlng) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('ピンの位置'),
        content: Text('緯度: ${latlng.latitude}, 経度: ${latlng.longitude}'),
        actions: <Widget>[
          TextButton(
            child: const Text('閉じる'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.title),
      ),
      body: FlutterMap(
        // mapControllerをFlutterMapに指定
        mapController: _animatedMapController.mapController,
        options: MapOptions(
          initialCenter: const LatLng(35.170915, 136.881537),
          initialZoom: 10.0,
          maxZoom: 12.0,
          minZoom: 8.0,
          onTap: (tapPosition, point) {
            _addMarker(point);
          },
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          ),
          const MarkerLayer(
            markers: [
              Marker(
                width: 30.0,
                height: 30.0,
                point: LatLng(35.170915, 136.881537), // ピンの位置を設定
                child: Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 50,
                ),
                rotate: true,
              )
            ],
          ),
          MarkerLayer(markers: addMarkers),
          PolylineLayer(
            polylines: [
              Polyline(
                points: [
                  const LatLng(35.1, 136.85),
                  const LatLng(35.2, 136.80),
                  const LatLng(35.3, 136.89),
                  const LatLng(35.4, 136.82),
                ],
                strokeWidth: 16.0,
                color: Colors.black,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
