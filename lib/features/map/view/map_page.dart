import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Colors;
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final _zoomController = MapController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          mapController: _zoomController,
          options: MapOptions(initialZoom: 14),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: LatLng(43.2363924, 76.9457275),
                  child: Icon(CupertinoIcons.map_pin),
                ),
              ],
            ),
          ],
        ),
        Positioned(
          right: 10,
          bottom: 100,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => _zoomController.move(
                    _zoomController.camera.center,
                    _zoomController.camera.zoom + 1,
                  ),
                  child: Icon(CupertinoIcons.plus, color: Colors.blueGrey),
                ),
                SizedBox(height: 4),
                GestureDetector(
                  onTap: () => _zoomController.move(
                    _zoomController.camera.center,
                    _zoomController.camera.zoom - 1,
                  ),
                  child: Icon(CupertinoIcons.minus, color: Colors.blueGrey),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
