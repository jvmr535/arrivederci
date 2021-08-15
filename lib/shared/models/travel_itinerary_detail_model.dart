import 'package:arrivederci/shared/models/place_model.dart';

class TravelItinerary {
  String name;
  String description;
  List<Place> places;

  TravelItinerary(
      {required this.name, required this.description, required this.places});

  @override
  String toString() {
    return 'Place(Nome : $name, descrição: $description, places: $places)';
  }
}
