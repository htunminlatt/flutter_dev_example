import 'package:hive/hive.dart';
import 'package:river_pod/feacture/trip/data/model/trip_model.dart';

class TripLocalDatasource {
  final Box<TripModel> tripBox;

  TripLocalDatasource({required this.tripBox});

  List<TripModel> getTrips() {
    return tripBox.values.toList();
  }

  addTrip(TripModel trip){
    tripBox.add(trip);
  }

  deleteTrip(int index){
    tripBox.deleteAt(index);
  }

}