import 'package:hive/hive.dart';
import 'package:river_pod/feacture/trip/domain/entities/trip.dart';

part 'trip_model.g.dart';

@HiveType(typeId: 0)
class TripModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final List<String> photos;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final DateTime data;
  @HiveField(4)
  final String location;

  TripModel(
      this.title, this.photos, this.description, this.data, this.location);

//convert to entity to model
  factory TripModel.fromEntity(Trip trip) => TripModel(
      trip.title, trip.photos, trip.description, trip.data, trip.location);

//convert to model to entity
  Trip toEntity() => Trip(title, photos, description, data, location);
}
