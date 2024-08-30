import 'package:river_pod/feacture/trip/domain/entities/trip.dart';
import 'package:river_pod/feacture/trip/domain/repositories/trip_repo.dart';

class AddTrip {
final TripRepository repository;

AddTrip(this.repository);

Future<void> call(Trip trip) {
 return repository.addTrips(trip);
}

}