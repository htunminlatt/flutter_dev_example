import 'package:river_pod/feacture/trip/domain/repositories/trip_repo.dart';

class DeleteTrip {
final TripRepository repository;

DeleteTrip(this.repository);

Future<void> call(int index) {
 return repository.deleteTrips(index);
}

}