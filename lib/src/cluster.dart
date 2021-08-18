import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'cluster_item.dart';

class Cluster<T> {
  final LatLng location;
  final Iterable<ClusterItem<T>> markers;

  Cluster(this.markers)
      : this.location = LatLng(
            markers.fold<double>(0.0, (p, c) => p + c.location.latitude) /
                markers.length,
            markers.fold<double>(0.0, (p, c) => p + c.location.longitude) /
                markers.length);

  /// Retrieve cluster items
  Iterable<T?> get items => markers.map((m) => m.item);

  /// Get number of clustered items
  int get count => markers.length;

  /// True if cluster is not a single item cluster
  bool get isMultiple => markers.length > 1;

  /// Basic cluster marker id
  String getId() {
    return location.latitude.toString() +
        "_" +
        location.longitude.toString() +
        "_$count";
  }

  @override
  String toString() {
    return 'Cluster of $count $T (${location.latitude}, ${location.longitude})';
  }
}
