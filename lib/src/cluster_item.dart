import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'cluster_manager.dart';
import 'geohash.dart';

class ClusterItem<T> {
  final LatLng location;
  final String geohash;
  final String name;
  final String tendoituong;
  final String address;
  final String tinhtrang;
  final String capquanly;
  final String manoidungbienbao;
  final T? item;

  ClusterItem(this.location,this.name,this.address,this.tendoituong,this.tinhtrang,this.capquanly,this.manoidungbienbao,{this.item})
      : geohash = Geohash.encode(location.latitude, location.longitude,
            codeLength: ClusterManager.precision);
}
