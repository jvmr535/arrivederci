import 'package:arrivederci/shared/models/place_model.dart';

class TravelItinerary {
  String name;
  String photo;
  List <Place> places ;

  TravelItinerary(
      {required this.name,
      required this.photo,
      required this.places});

  @override
  String toString() {
    return 'Place(Nome : $name, places: $places, referencia de imagem: $photo)';
  }
}