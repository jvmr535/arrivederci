import 'package:arrivederci/shared/models/place_model.dart';

class TravelItinerary {
  String name;
  String photo;
  String details;
  List <Place> places ;

  TravelItinerary(
      {required this.name,
      required this.photo,
      required this.details,
      required this.places});

  @override
  String toString() {
    return 'Place(Nome : $name, places: $places, details $details, referencia de imagem: $photo)';
  }
}