import 'package:river_pod/feacture/trip/domain/entities/trip.dart';
import 'package:river_pod/feacture/trip/domain/repositories/trip_repo.dart';

class GetTrip {
final TripRepository repository;

GetTrip(this.repository);

Future<Trip> call() {
 return repository.getTrips();
}

}