import 'package:arrivederci/shared/models/place_model.dart';

class TravelItinerary {
  String uid;
  String name;
  String description;
  List<Place>? places;

  TravelItinerary({
    required this.uid,
    required this.name,
    required this.description,
    this.places,
  });

  @override
  String toString() {
    return 'Travel Itinerary(Uid: $uid,Nome : $name, descrição: $description, places: $places)';
  }
}
